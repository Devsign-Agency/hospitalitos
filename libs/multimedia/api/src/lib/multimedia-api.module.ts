import { Module } from '@nestjs/common';
import { VideoModule } from './video/video.module';
import { CommonModule } from './common/common.module';

@Module({
    controllers: [],
    providers: [],
    exports: [],
    imports: [VideoModule, CommonModule],
})
export class MultimediaApiModule {}
