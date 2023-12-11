import { Test, TestingModule } from '@nestjs/testing';
import { CategoryValidator } from './category.validator';

describe('CategoryValidator', () => {
    let provider: CategoryValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [CategoryValidator],
        }).compile();

        provider = module.get<CategoryValidator>(CategoryValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
