import { Test, TestingModule } from '@nestjs/testing';
import { UserValidator } from './user.validator';

describe('UserValidator', () => {
    let provider: UserValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [UserValidator],
        }).compile();

        provider = module.get<UserValidator>(UserValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
