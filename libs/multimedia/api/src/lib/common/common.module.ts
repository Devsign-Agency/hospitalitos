import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MultimediaService } from './services/multimedia/multimedia.service';
import { MultimediaValidator } from './services/validator/multimedia.validator';

@Module({
    imports: [
        TypeOrmModule.forFeature([])],
    providers: [MultimediaService, MultimediaValidator],
    exports: [MultimediaService, MultimediaValidator],
})
export class CommonModule {}
