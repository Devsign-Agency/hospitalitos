import { Test, TestingModule } from '@nestjs/testing';
import { RefreshStrategy } from './refresh.strategy';

describe('RefreshStrategy', () => {
    let provider: RefreshStrategy;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [RefreshStrategy],
        }).compile();

        provider = module.get<RefreshStrategy>(RefreshStrategy);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
