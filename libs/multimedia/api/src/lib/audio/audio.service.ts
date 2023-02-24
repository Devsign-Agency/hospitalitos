import { Audio, Category } from '@kaad/multimedia/ng-common';
import { FileUtils } from '@kaad/shared/api';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { join } from 'path';
import { Repository } from 'typeorm';
import { MultimediaService } from '../common/services/multimedia/multimedia.service';
import { CreateAudioDto } from './dto/create-audio.dto';
import { AudioEntity } from './entities/audio.entity';
import { AudioValidator } from './validators/audio.validator';
import { randomUUID } from 'crypto';
import { CategoryService } from '../category/category.service';

@Injectable()
export class AudioService extends MultimediaService<Audio, AudioEntity> {
    constructor(@InjectRepository(AudioEntity) protected readonly audioRepository: Repository<AudioEntity>,
        protected readonly config: ConfigService,
        protected readonly validator: AudioValidator,
        protected readonly categoryService: CategoryService) {
        super(config, validator, categoryService);
        this.entityName = 'audio';
        this.repository = audioRepository;
    }

    protected async preCreate(file: Express.Multer.File, thumbnail: Express.Multer.File, createAudioDto: CreateAudioDto): Promise<Audio> {
        const { title, description, synopsis, tags, categories, categoriesString } = createAudioDto;

        const audio = new AudioEntity();
        audio.title = title;
        audio.description = description;
        audio.synopsis = synopsis;
        audio.tags = tags;
        audio.code = randomUUID();

        if (categoriesString) {
            audio.categories = JSON.parse(categoriesString) as Category[];
        } else if (categories && categories.length > 0) {
            audio.categories = categories;
        } else {
            audio.categories = [];
        }

        const assetsPath = join(__dirname, this.config.get('path.multimedia.assets'));
        const destinationPath = join(assetsPath, 'audio', 'sources');
        const localPath = FileUtils.copyAndDelete(file, destinationPath);
        const url = localPath.replace(destinationPath, this.config.get('globalPrefix') + '/audio/sources');
        audio.url = `/${url}`;

        if (thumbnail) {
            const assetsPath = join(__dirname, this.config.get('path.multimedia.assets'));
            const destinationPath = join(assetsPath, 'thumbnails', 'audio');
            const localPath = FileUtils.copyAndDelete(thumbnail, destinationPath);
            const url = localPath.replace(destinationPath, this.config.get('globalPrefix') + '/audio/thumbnail');
            audio.thumbnail = `/${url}`;
        }

        return audio;
    }
}
