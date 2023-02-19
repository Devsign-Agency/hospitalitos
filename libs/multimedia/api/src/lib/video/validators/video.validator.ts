import { Video } from '@kaad/multimedia/ng-common';
import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Like, Repository } from 'typeorm';
import { VideoEntity } from '../entities/video.entity';

@Injectable()
export class VideoValidator {

    constructor(@InjectRepository(VideoEntity) private readonly videoRepository: Repository<VideoEntity>) { }

    public async videoExist(id: string): Promise<boolean> {
        const video: Partial<Video> | null = await this.videoRepository.findOne({ where: {id} });
        return !!video;
    }

    public async tagExist(tag: string): Promise<boolean> {
        const video: Partial<Video> | null = await this.videoRepository.findOne({ where: { tags: Like(`%${tag}%`) } });
        return !!video;
    }

    public async validateVideoExistById(id: string): Promise<boolean> {
        if (!(await this.videoExist(id))) {
            throw new NotFoundException(`video with id "${id}" not found`);
        }

        return true;
    }

    public async validateRequired(video: Partial<Video>): Promise<boolean> {
        if (!video.title) {
            throw new BadRequestException("title must not be empty");
        }

        if (!video.tags || video.tags.length === 0) {
            throw new BadRequestException("tags must not be empty");
        }

        return true;
    }
}
