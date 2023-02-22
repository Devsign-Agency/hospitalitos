import { Audio } from '@kaad/multimedia/ng-common';
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MultimediaValidator } from '../../common/services/validator/multimedia.validator';
import { AudioEntity } from '../entities/audio.entity';

@Injectable()
export class AudioValidator extends MultimediaValidator<Audio, AudioEntity> {

    constructor(@InjectRepository(AudioEntity) protected readonly audioRepository: Repository<AudioEntity>) {
        super();
        this.entityName = 'audio';
        this.repository = audioRepository;
    }

    public async validateEntityExistById(id: string): Promise<boolean> {
        try {
            await super.validateEntityExistById(id);
        } catch (error) {
            throw new NotFoundException(`audio with id "${id}" not found`);
        }

        return true;
    }
}
