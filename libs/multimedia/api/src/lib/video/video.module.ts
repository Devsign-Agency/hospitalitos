import { Module } from '@nestjs/common';
import { VideoService } from './video.service';
import { VideoController } from './video.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { VideoEntity } from './entities/video.entity';
import { GcloudApiModule } from '@kaad/gcloud/api';
import { CommonModule } from '../common/common.module';
import { VideoValidator } from './validators/video.validator';

@Module({
    controllers: [VideoController],
    providers: [VideoService, VideoValidator],
    imports: [
        CommonModule,
        GcloudApiModule,
        TypeOrmModule.forFeature([VideoEntity])
    ]
})
export class VideoModule {}
