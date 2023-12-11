import { JwtGuard } from '@kaad/core/api';
import { Audio } from '@kaad/multimedia/ng-common';
import { PageOptions, SearchOptions } from '@kaad/shared/api';
import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    Query,
    Res,
    UseInterceptors,
    UploadedFiles,
    UseGuards,
} from '@nestjs/common';
import { FileFieldsInterceptor } from '@nestjs/platform-express';
import { ApiConsumes, ApiTags } from '@nestjs/swagger';
import { diskStorage } from 'multer';
import { join } from 'path';
import { AudioService } from './audio.service';
import { CreateAudioDto } from './dto/create-audio.dto';
import { UpdateAudioDto } from './dto/update-audio.dto';

@ApiTags('Multimedia/Audio')
@Controller('audio')
@UseGuards(JwtGuard)
export class AudioController {
    constructor(private readonly audioService: AudioService) { }

    @Get()
    public async findAll(
        @Query() { criteria, ...pageOptions }: SearchOptions) {
        return await this.audioService.findAll(new PageOptions(pageOptions), criteria);
    }

    @Get(':criteria')
    public async findOne(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<Audio | Audio[]> {
        if (findBy === 'title') {
            return await this.audioService.findByTitle(criteria);
        } else if (findBy === 'tag') {
            return await this.audioService.findByTag(criteria);
        } else {
            return await this.audioService.findById(criteria);
        }
    }

    @Get('source/:fileId')
    public async serveAudio(@Param('fileId') fileId, @Res() res): Promise<void> {
        const root = join(__dirname, process.env.MULTIMEDIA_ASSETS_PATH, 'audio', 'sources');
        res.sendFile(fileId, { root });
    }

    @Get('thumbnail/:fileId')
    public async serveThumbnail(@Param('fileId') fileId, @Res() res): Promise<void> {
        const root = join(__dirname, process.env.MULTIMEDIA_ASSETS_PATH, 'thumbnails', 'audio');
        res.sendFile(fileId, { root });
    }

    @Post()
    @ApiConsumes('multipart/form-data')
    @UseInterceptors(FileFieldsInterceptor(
        [
            { name: 'file', maxCount: 1 },
            { name: 'thumbnailImage', maxCount: 1 }
        ],
        { storage: diskStorage({ destination: join(__dirname, process.env.MULTIMEDIA_UPLOAD_PATH) }) }
    ))
    public async create(
        @Body() createAudioDto: CreateAudioDto,
        @UploadedFiles() files: { file?: Express.Multer.File[], thumbnailImage?: Express.Multer.File[] }) {
        return this.audioService.create(files.file[0], files.thumbnailImage[0], createAudioDto);
    }

    @Patch(':id')
    public async update(@Param('id') id: string, @Body() updateAudioDto: UpdateAudioDto) {
        return this.audioService.update(id, updateAudioDto);
    }

    @Delete(':id')
    public async remove(@Param('id') id: string) {
        return this.audioService.remove(id);
    }
}
