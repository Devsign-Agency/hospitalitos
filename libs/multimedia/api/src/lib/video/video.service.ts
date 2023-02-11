import { MetadataVideo, YoutubeService } from '@kaad/gcloud/api';
import { CreateVideoDto, UpdateVideoDto, Video } from '@kaad/multimedia/ng-common';
import { Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Like, Repository } from 'typeorm';
import { VideoEntity } from './entities/video.entity';
import { VideoValidator } from './validators/video.validator';

@Injectable()
export class VideoService {
    constructor(@InjectRepository(VideoEntity) private readonly videoRepository: Repository<VideoEntity>,
                private readonly validator: VideoValidator,
                private readonly youtubeService: YoutubeService) {}

    public async findAll(pageOptions: PageOptions, criteria?: string): Promise<Page<Video>> {
        const queryBuilder = this.videoRepository.createQueryBuilder("video");

        queryBuilder
            .orderBy('video.createdAt', pageOptions.order)
            .skip(pageOptions.skip)
            .take(pageOptions.take);

        if (criteria) {
            queryBuilder
                .where('video.name like :criteria', { criteria: `%${criteria}%` })
                .orWhere('video.description like :criteria', { criteria: `%${criteria}%` })
                .orWhere('video.tags like :criteria', { criteria: `%${criteria}%` });
        }

        const itemCount = await queryBuilder.getCount();
        const { entities } = await queryBuilder.getRawAndEntities();

        const pageMetaDto = new PageMeta({ itemCount, pageOptions });

        return new Page(entities, pageMetaDto);
    }

    async findById(id: string) {
        let video: Video;

        if (await this.validator.validateVideoExistById(id)) {
            video = await this.videoRepository.findOne({ where: { id } });
        }
        return video;
    }

    async findByName(name: string) {
        return await this.videoRepository.findOne({ where: { name: Like(`%${name}%`) } });
    }

    async findByTag(tag: string) {
        return await this.videoRepository.findOne({ where: { tags: Like(`%${tag}%`) } });
    }

    async create(file: Express.Multer.File, createVideoDto: CreateVideoDto): Promise<Video> {
        let newVideo: Video;

        if (await this.validator.validateRequired(createVideoDto)) {
            const { name, description, tags } = createVideoDto;
            const meta: MetadataVideo = new MetadataVideo({ title: name, description, tags });
            const { code, urlVideo } = await this.youtubeService.upload(file, meta);

            const video = new VideoEntity();
            video.name = createVideoDto.name;
            video.description = createVideoDto.description;
            video.code = code;
            video.url = urlVideo;
            video.tags = tags;

            newVideo = await this.videoRepository.save(video);
        }

        return newVideo;
    }

    async update(id: string, updateVideoDto: UpdateVideoDto) {
        let video: Video;

        if (await this.validator.validateVideoExistById(id)) {
            video = await this.findById(id);

            const { name, description, tags } = updateVideoDto;

            if (name) {
                video.name = name;
            }

            if (description) {
                video.description = description;
            }

            if (tags && tags.length > 0) {
                video.tags = tags;
            }

            video = await this.videoRepository.save(video);
        }

        return video;
    }

    async remove(id: string) {
        let video: VideoEntity;
        if (await this.validator.validateVideoExistById(id)) {
            video = await this.videoRepository.findOne({ where: { id } });
            await this.videoRepository.remove(video);
        }
        return video;
    }
}
