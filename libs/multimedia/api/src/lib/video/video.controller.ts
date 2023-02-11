import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    UseInterceptors,
    UploadedFile,
    ParseFilePipe,
    FileTypeValidator,
    MaxFileSizeValidator,
    Query,
} from '@nestjs/common';
import { VideoService } from './video.service';
import { ApiConsumes, ApiTags } from '@nestjs/swagger';
import { Video } from '@kaad/multimedia/ng-common';
import { FileInterceptor } from '@nestjs/platform-express';
import 'multer';
import { diskStorage } from 'multer';
import { Page, PageOptions, SearchOptions } from '@kaad/shared/api';
import { CreateVideoDto } from './dto/create-video.dto';
import { UpdateVideoDto } from './dto/update-video.dto';

@ApiTags('Multimedia/Video')
@Controller('video')
export class VideoController {
    constructor(private readonly videoService: VideoService) {}

    @Post()
    @ApiConsumes('multipart/form-data')
    @UseInterceptors(FileInterceptor('file', {
        storage: diskStorage({
            destination: './uploadedFiles'
        })
    }))
    create(
        @Body() createVideoDto: CreateVideoDto,
        @UploadedFile(
            new ParseFilePipe({
                validators: [
                    new FileTypeValidator({ fileType: 'video/*' }),
                    new MaxFileSizeValidator({ maxSize: 1024 * 1024 * 4 }),
                ]
            }),) file: Express.Multer.File) {
        return this.videoService.create(file, createVideoDto);
    }

    @Get()
    public async getAll(
            @Query() { criteria, ...pageOptions}: SearchOptions): Promise<Page<Video>> {
        return await this.videoService.findAll(new PageOptions(pageOptions), criteria);
    }

    @Get(':criteria')
    public async findById(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<Video> {
        if (findBy === 'name') {
            return await this.videoService.findByName(criteria);
        } else if (findBy === 'tag') {
            return await this.videoService.findByTag(criteria);
        } else {
            return await this.videoService.findById(criteria);
        }
    }

    @Patch(':id')
    update(@Param('id') id: string, @Body() updateVideoDto: UpdateVideoDto) {
        return this.videoService.update(id, updateVideoDto);
    }

    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.videoService.remove(id);
    }
}
