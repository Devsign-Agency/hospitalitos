import { UpdateVideoDto as IUpdateVideoDto } from '@kaad/multimedia/ng-common';
import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateVideoDto } from './create-video.dto';

export class UpdateVideoDto extends PartialType(CreateVideoDto) implements IUpdateVideoDto {
    @ApiProperty()
    id: string;
}
