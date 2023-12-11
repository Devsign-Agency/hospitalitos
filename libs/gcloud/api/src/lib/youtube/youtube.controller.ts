import { Body, Controller, FileTypeValidator, Get, MaxFileSizeValidator, ParseFilePipe, Post, Query, UploadedFile, UseInterceptors } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { ApiConsumes, ApiTags } from '@nestjs/swagger';
import 'multer';
import { diskStorage } from 'multer';
import { MetadataVideo } from '../dto/metadata-video.dto';
import { YoutubeService } from './youtube.service';

@ApiTags('Youtube API Configuration')
@Controller('youtube')
export class YoutubeController {

    constructor(private readonly youtubeService: YoutubeService) { }

    @Get('authUrl')
    // @UseGuards(AdminGuard)
    async getAuthUrl() {
        return await this.youtubeService.getAuthUrl();
    }

    @Get('login')
    // @UseGuards(AdminGuard)
    async login(@Query('code') code: string) {
        return await this.youtubeService.login(code);
    }

    @Post('upload')
    @ApiConsumes('multipart/form-data')
    @UseInterceptors(FileInterceptor('file', {
        storage: diskStorage({
            destination: './uploadedFiles'
        })
    }))
    public uploadFile(
        @Body() metadata: MetadataVideo,
        @UploadedFile(
            new ParseFilePipe({
                validators: [
                    new FileTypeValidator({ fileType: 'video/*' }),
                    new MaxFileSizeValidator({ maxSize: 1024 * 1024 * 4 }),
                ]
            }),) file: Express.Multer.File) {
        return this.youtubeService.upload(file, metadata);
    }
}
