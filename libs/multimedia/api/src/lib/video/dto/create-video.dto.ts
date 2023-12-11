import { CreateVideoDto as ICreateVideoDto } from '@kaad/multimedia/ng-common';
import { PartialType } from "@nestjs/swagger";
import { CreateMultimediaDto } from '../../common/dto/create-multimedia.dto';

export class CreateVideoDto extends PartialType(CreateMultimediaDto) implements ICreateVideoDto {
}
