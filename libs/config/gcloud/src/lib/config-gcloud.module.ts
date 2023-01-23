import { Module } from '@nestjs/common';
import { YoutubeController } from './youtube/youtube.controller';
import { YoutubeService } from './youtube/youtube.service';

@Module({
    controllers: [YoutubeController],
    providers: [YoutubeService],
    exports: [],
})
export class ConfigGcloudModule {}
