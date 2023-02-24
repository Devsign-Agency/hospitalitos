import { UpdateAudioDto as IUpdateAudioDto } from '@kaad/multimedia/ng-common';
import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateAudioDto } from './create-audio.dto';

export class UpdateAudioDto extends PartialType(CreateAudioDto) implements IUpdateAudioDto {
    @ApiProperty()
    id: string;
}
