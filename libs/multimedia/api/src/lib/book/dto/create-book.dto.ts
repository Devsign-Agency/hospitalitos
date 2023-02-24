import { CreateBookDto as ICreateBookDto } from '@kaad/multimedia/ng-common';
import { PartialType } from "@nestjs/swagger";
import { CreateMultimediaDto } from '../../common/dto/create-multimedia.dto';


export class CreateBookDto extends PartialType(CreateMultimediaDto) implements ICreateBookDto {}
