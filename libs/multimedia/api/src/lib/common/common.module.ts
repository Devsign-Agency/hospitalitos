import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MultimediaService } from './services/multimedia/multimedia.service';
import { MultimediaValidator } from './services/validator/multimedia.validator';
import { CategoryModule } from '@kaad/commons/api';

@Module({
    imports: [
        CategoryModule,
        TypeOrmModule.forFeature([])],
    providers: [MultimediaService, MultimediaValidator],
    exports: [MultimediaService, MultimediaValidator],
})
export class CommonModule {}
