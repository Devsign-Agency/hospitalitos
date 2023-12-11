import { CreateAudioDto } from './create-audio.dto';

export interface UpdateAudioDto extends Partial<CreateAudioDto> {
    id: string;
}
