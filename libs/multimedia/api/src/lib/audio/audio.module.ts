import { Module } from '@nestjs/common';
import { AudioService } from './audio.service';
import { AudioController } from './audio.controller';
import { AudioEntity } from './entities/audio.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AudioValidator } from './validators/audio.validator';

@Module({
    controllers: [AudioController],
    providers: [AudioService, AudioValidator],
    imports: [
        TypeOrmModule.forFeature([AudioEntity])
    ]
})
export class AudioModule {}

