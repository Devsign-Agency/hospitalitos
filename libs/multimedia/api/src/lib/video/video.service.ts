import { MetadataVideo, YoutubeService } from '@kaad/gcloud/api';
import { CreateVideoDto, UpdateVideoDto, Video } from '@kaad/multimedia/ng-common';
import { FileUtils, Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Order } from '@kaad/shared/ng-common';
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
            .orderBy('video.createdAt', Order.DESC)
            .skip(pageOptions.skip)
            .take(pageOptions.take);

        if (criteria) {
            queryBuilder
                .where('video.title like :criteria', { criteria: `%${criteria}%` })
                .orWhere('video.description like :criteria', { criteria: `%${criteria}%` })
                .orWhere('video.synopsis like :criteria', { criteria: `%${criteria}%` })
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
        return await this.videoRepository.findOne({ where: { title: Like(`%${name}%`) } });
    }

    async findByTag(tag: string) {
        return await this.videoRepository.findOne({ where: { tags: Like(`%${tag}%`) } });
    }

    async create(file: Express.Multer.File, thumbnailImage: Express.Multer.File, createVideoDto: CreateVideoDto): Promise<Video> {
        let newVideo: Video;

        if (await this.validator.validateRequired(createVideoDto)) {
            const { title, description, synopsis, tags } = createVideoDto;
            const meta: MetadataVideo = new MetadataVideo({ title, description, tags });
            const { code, urlVideo } = await this.youtubeService.upload(file, meta);

            const video = new VideoEntity();
            video.title = title;
            video.description = description;
            video.synopsis = synopsis;
            video.code = code;
            video.url = urlVideo;
            video.tags = tags;

            if (thumbnailImage) {
                const destinationPath = `${process.env.MULTIMEDIA_ASSETS_PATH}/thumbnails/video`;
                video.thumbnail = FileUtils.copyAndDelete(thumbnailImage, destinationPath);
            }

            newVideo = await this.videoRepository.save(video);
        }

        return newVideo;
    }

    async update(id: string, updateVideoDto: UpdateVideoDto) {
        let video: Video;

        if (await this.validator.validateVideoExistById(id)) {
            video = await this.findById(id);

            const { title: name, description, synopsis, recommended, tags } = updateVideoDto;

            if (name) {
                video.title = name;
            }

            if (description) {
                video.description = description;
            }

            if (synopsis) {
                video.synopsis = synopsis;
            }

            if (recommended !== undefined) {
                video.recommended = recommended;
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
