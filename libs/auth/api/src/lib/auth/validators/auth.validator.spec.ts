import { Test, TestingModule } from '@nestjs/testing';
import { AuthValidator } from './auth.validator';

describe('AuthValidator', () => {
    let provider: AuthValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [AuthValidator],
        }).compile();

        provider = module.get<AuthValidator>(AuthValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
