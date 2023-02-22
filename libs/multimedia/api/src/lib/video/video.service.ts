import { MetadataVideo, YoutubeService } from '@kaad/gcloud/api';
import { CreateVideoDto, Video } from '@kaad/multimedia/ng-common';
import { FileUtils } from '@kaad/shared/api';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { join } from 'path';
import { Repository } from 'typeorm';
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
}
