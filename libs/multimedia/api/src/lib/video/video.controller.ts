import { JwtGuard } from '@kaad/core/api';
import { Video } from '@kaad/multimedia/ng-common';
import { Page, PageOptions, SearchOptions } from '@kaad/shared/api';
import {
    Body, Controller, Delete, FileTypeValidator, Get, MaxFileSizeValidator, Param, ParseFilePipe, Patch, Post, Query, UploadedFile, UseInterceptors, UseGuards
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { ApiConsumes, ApiTags } from '@nestjs/swagger';
import 'multer';
import { diskStorage } from 'multer';
import { CreateVideoDto } from './dto/create-video.dto';
import { UpdateVideoDto } from './dto/update-video.dto';
import { VideoService } from './video.service';

@ApiTags('Multimedia/Video')
@Controller('video')
@UseGuards(JwtGuard)
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
                    new MaxFileSizeValidator({ maxSize: 1024 * 1024 * 1024 }),
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
