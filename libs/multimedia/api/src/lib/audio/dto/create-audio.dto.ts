import { CreateAudioDto as ICreateAudioDto } from '@kaad/multimedia/ng-common';
import { PartialType } from '@nestjs/swagger';
import { CreateMultimediaDto } from '../../common/dto/create-multimedia.dto';

export class CreateAudioDto extends PartialType(CreateMultimediaDto) implements ICreateAudioDto {

}
