import { Test, TestingModule } from '@nestjs/testing';
import { MultimediaValidator } from '../multimedia.validator';

describe('MultimediaValidator', () => {
    let provider: MultimediaValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [MultimediaValidator],
        }).compile();

        provider = module.get<MultimediaValidator>(MultimediaValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
