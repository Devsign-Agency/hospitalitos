import { Module } from '@nestjs/common';
import { BookService } from './book.service';
import { BookController } from './book.controller';
import { BookValidator } from './validators/book.validator';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BookEntity } from './entities/book.entity';
import { CategoryModule } from '@kaad/commons/api';

@Module({
    controllers: [BookController],
    providers: [BookService, BookValidator],
    imports: [
        CategoryModule,
        TypeOrmModule.forFeature([BookEntity])
    ]
})
export class BookModule {}
