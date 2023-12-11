import { Test, TestingModule } from '@nestjs/testing';
import { PasswordValidator } from './password.validator';

describe('PasswordValidator', () => {
    let provider: PasswordValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [PasswordValidator],
        }).compile();

        provider = module.get<PasswordValidator>(PasswordValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
