import { Test, TestingModule } from '@nestjs/testing';
import { BookValidator } from './book.validator';

describe('BookValidator', () => {
    let provider: BookValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [BookValidator],
        }).compile();

        provider = module.get<BookValidator>(BookValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
