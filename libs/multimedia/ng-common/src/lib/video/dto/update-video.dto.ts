import { CreateVideoDto } from './create-video.dto';

export interface UpdateVideoDto extends Partial<CreateVideoDto> {
    id: string;
}
