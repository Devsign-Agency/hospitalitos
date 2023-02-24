import { Book } from '@kaad/multimedia/ng-common';
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MultimediaValidator } from '../../common/services/validator/multimedia.validator';
import { BookEntity } from '../entities/book.entity';

@Injectable()
export class BookValidator extends MultimediaValidator<Book, BookEntity> {

    constructor(@InjectRepository(BookEntity) protected readonly videoRepository: Repository<BookEntity>) {
        super();
        this.entityName = 'book';
        this.repository = videoRepository;
    }

    public async validateEntityExistById(id: string): Promise<boolean> {
        try {
            await super.validateEntityExistById(id);
        } catch (error) {
            throw new NotFoundException(`book with id "${id}" not found`);
        }

        return true;
    }
}
