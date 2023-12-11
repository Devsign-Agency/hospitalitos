import { Test, TestingModule } from '@nestjs/testing';
import { RoleValidator } from './role.validator';

describe('RoleValidator', () => {
    let provider: RoleValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [RoleValidator],
        }).compile();

        provider = module.get<RoleValidator>(RoleValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
