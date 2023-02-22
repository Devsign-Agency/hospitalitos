import { ConfigApiModule } from '@kaad/config/api';
import { SharedApiModule } from '@kaad/shared/api';
import { Module } from '@nestjs/common';
import { AudioModule } from './audio/audio.module';
import { CommonModule } from './common/common.module';
import { VideoModule } from './video/video.module';
import { BookModule } from './book/book.module';

@Module({
    controllers: [],
    providers: [],
    exports: [],
    imports: [
        AudioModule,
        CommonModule,
        ConfigApiModule,
        SharedApiModule,
        VideoModule,
        BookModule,
    ],
})
export class MultimediaApiModule {}
