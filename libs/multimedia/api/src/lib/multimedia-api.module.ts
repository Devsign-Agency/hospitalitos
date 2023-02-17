import { Module } from '@nestjs/common';
import { VideoModule } from './video/video.module';
import { CommonModule } from './common/common.module';
import { AudioModule } from './audio/audio.module';

@Module({
    controllers: [],
    providers: [],
    exports: [],
    imports: [VideoModule, CommonModule, AudioModule],
})
export class MultimediaApiModule {}
