import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MultimediaValidator } from '../../common/services/validator/multimedia.validator';
import { VideoEntity } from '../entities/video.entity';

@Injectable()
export class VideoValidator extends MultimediaValidator<VideoEntity, VideoEntity> {

    constructor(@InjectRepository(VideoEntity) protected readonly videoRepository: Repository<VideoEntity>) {
        super();
        this.entityName = 'video';
        this.repository = videoRepository;
    }

    public async validateEntityExistById(id: string): Promise<boolean> {
        try {
            await super.validateEntityExistById(id);
        } catch (error) {
            throw new NotFoundException(`video with id "${id}" not found`);
        }

        return true;
    }
}
