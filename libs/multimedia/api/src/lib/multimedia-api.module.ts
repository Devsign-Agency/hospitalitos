import { ConfigApiModule } from '@kaad/config/api';
import { SharedApiModule } from '@kaad/shared/api';
import { Module } from '@nestjs/common';
import { AudioModule } from './audio/audio.module';
import { BookModule } from './book/book.module';
import { CommonModule } from './common/common.module';
import { VideoModule } from './video/video.module';

@Module({
    controllers: [],
    providers: [],
    exports: [],
    imports: [
        AudioModule,
        BookModule,
        CommonModule,
        ConfigApiModule,
        SharedApiModule,
        VideoModule,
    ],
})
export class MultimediaApiModule {}
