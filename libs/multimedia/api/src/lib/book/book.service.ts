import { Book, Category } from '@kaad/multimedia/ng-common';
import { FileUtils } from '@kaad/shared/api';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { randomUUID } from 'crypto';
import { join } from 'path';
import { Repository } from 'typeorm';
import { CategoryService } from '../category/category.service';
import { MultimediaService } from '../common/services/multimedia/multimedia.service';
import { CreateBookDto } from './dto/create-book.dto';
import { BookEntity } from './entities/book.entity';
import { BookValidator } from './validators/book.validator';
import { Express } from 'express';
import { Multer } from 'multer';

@Injectable()
export class BookService extends MultimediaService<Book, BookEntity> {
    constructor(@InjectRepository(BookEntity) protected readonly bookRepository: Repository<BookEntity>,
        protected readonly config: ConfigService,
        protected readonly validator: BookValidator,
        protected readonly categoryService: CategoryService) {
        super(config, validator, categoryService);
        this.entityName = 'book';
        this.repository = bookRepository;
    }

    protected async preCreate(file: Express.Multer.File, thumbnailImage: Express.Multer.File, createBookDto: CreateBookDto): Promise<Book> {
        const { title, description, synopsis, tags, categories, categoriesString } = createBookDto;

        const book = new BookEntity();
        book.title = title;
        book.description = description;
        book.synopsis = synopsis;
        book.tags = tags;
        book.code = randomUUID();

        if (categoriesString) {
            book.categories = JSON.parse(categoriesString) as Category[];
        } else if (categories && categories.length > 0) {
            book.categories = categories;
        } else {
            book.categories = [];
        }

        const assetsPath = join(__dirname, this.config.get('path.multimedia.assets'));
        const destinationPath = join(assetsPath, 'book', 'sources');
        const localPath = FileUtils.copyAndDelete(file, destinationPath);
        const url = localPath.replace(destinationPath, this.config.get('globalPrefix') + '/book/sources');
        book.url = `/${url}`;

        if (thumbnailImage) {
            const assetsPath = join(__dirname, this.config.get('path.multimedia.assets'));
            const destinationPath = join(assetsPath, 'thumbnails', 'book');
            const localPath = FileUtils.copyAndDelete(thumbnailImage, destinationPath);
            const url = localPath.replace(destinationPath, this.config.get('globalPrefix') + '/book/thumbnail');
            book.thumbnail = `/${url}`;
        }

        return book;
    }
}
