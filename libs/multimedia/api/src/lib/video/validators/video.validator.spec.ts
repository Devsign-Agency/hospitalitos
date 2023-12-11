import { Test, TestingModule } from '@nestjs/testing';
import { VideoValidator } from './video.validator';

describe('VideoValidator', () => {
    let provider: VideoValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [VideoValidator],
        }).compile();

        provider = module.get<VideoValidator>(VideoValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
