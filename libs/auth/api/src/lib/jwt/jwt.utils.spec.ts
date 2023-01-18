import { Test, TestingModule } from '@nestjs/testing';
import { JwtUtils } from './jwt.utils';

describe('JwtUtils', () => {
    let provider: JwtUtils;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [JwtUtils],
        }).compile();

        provider = module.get<JwtUtils>(JwtUtils);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
