import { JwtGuard } from '@kaad/core/api';
import { Book } from '@kaad/multimedia/ng-common';
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
import { BookService } from './book.service';
import { CreateBookDto } from './dto/create-book.dto';
import { UpdateBookDto } from './dto/update-book.dto';

@ApiTags('Multimedia/Book')
@Controller('book')
@UseGuards(JwtGuard)
export class BookController {
    constructor(private readonly bookService: BookService) {}

    @Get()
    public async findAll(
        @Query() { criteria, ...pageOptions }: SearchOptions) {
        return await this.bookService.findAll(new PageOptions(pageOptions), criteria);
    }

    @Get(':criteria')
    public async findOne(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<Book | Book[]> {
        if (findBy === 'title') {
            return await this.bookService.findByTitle(criteria);
        } else if (findBy === 'tag') {
            return await this.bookService.findByTag(criteria);
        } else {
            return await this.bookService.findById(criteria);
        }
    }

    @Get('source/:fileId')
    public async serveBook(@Param('fileId') fileId, @Res() res): Promise<void> {
        const root = join(__dirname, process.env.MULTIMEDIA_ASSETS_PATH, 'book', 'sources');
        res.sendFile(fileId, { root });
    }

    @Get('thumbnail/:fileId')
    public async serveThumbnail(@Param('fileId') fileId, @Res() res): Promise<void> {
        const root = join(__dirname, process.env.MULTIMEDIA_ASSETS_PATH, 'thumbnails', 'book');
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
        @Body() createBookDto: CreateBookDto,
        @UploadedFiles() files: { file?: Express.Multer.File[], thumbnailImage?: Express.Multer.File[] }) {
        return this.bookService.create(files.file[0], files.thumbnailImage[0], createBookDto);
    }

    @Patch(':id')
    public async update(@Param('id') id: string, @Body() updateBookDto: UpdateBookDto) {
        return this.bookService.update(id, updateBookDto);
    }

    @Delete(':id')
    public async remove(@Param('id') id: string) {
        return this.bookService.remove(id);
    }
}
