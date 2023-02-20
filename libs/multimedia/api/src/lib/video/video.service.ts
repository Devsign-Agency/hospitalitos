import { MetadataVideo, YoutubeService } from '@kaad/gcloud/api';
import { CreateVideoDto, UpdateVideoDto, Video } from '@kaad/multimedia/ng-common';
import { FileUtils, Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Order } from '@kaad/shared/ng-common';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { join } from 'path';
import { Like, Repository } from 'typeorm';
import { MultimediaService } from '../common/services/multimedia/multimedia.service';
import { VideoEntity } from './entities/video.entity';
import { VideoValidator } from './validators/video.validator';

@Injectable()
export class VideoService extends MultimediaService<Video, VideoEntity> {
    constructor(@InjectRepository(VideoEntity) protected readonly videoRepository: Repository<VideoEntity>,
        protected readonly config: ConfigService,
        protected readonly validator: VideoValidator,
        protected readonly youtubeService: YoutubeService) {
        super(config, validator);
        this.entityName = 'video';
        this.repository = videoRepository;
    }

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

    async findByTitle(name: string) {
        return await this.videoRepository.findOne({ where: { title: Like(`%${name}%`) } });
    }

    async findByTag(tag: string) {
        return await this.videoRepository.findOne({ where: { tags: Like(`%${tag}%`) } });
    }

    protected async preCreate(file: Express.Multer.File, thumbnailImage: Express.Multer.File, createVideoDto: CreateVideoDto): Promise<Video> {
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
            const assetsPath = join(__dirname, this.config.get('path.multimedia.assets'));
            const destinationPath = join(assetsPath, 'thumbnails', 'video');
            const localPath = FileUtils.copyAndDelete(thumbnailImage, destinationPath);
            const url = localPath.replace(destinationPath, this.config.get('globalPrefix') + '/video/thumbnail');
            video.thumbnail = `/${url}`;
        }

        return video;
    }

    protected async preUpdate(id: string, updateVideoDto: UpdateVideoDto) {
        const video = await this.findById(id);

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

        return video;
    }
}
