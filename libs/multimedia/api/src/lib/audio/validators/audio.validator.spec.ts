import { Test, TestingModule } from '@nestjs/testing';
import { AudioValidator } from './audio.validator';

describe('VideoValidator', () => {
    let provider: AudioValidator;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            providers: [AudioValidator],
        }).compile();

        provider = module.get<AudioValidator>(AudioValidator);
    });

    it('should be defined', () => {
        expect(provider).toBeDefined();
    });
});
