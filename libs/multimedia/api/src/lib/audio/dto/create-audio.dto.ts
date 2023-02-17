import { CreateAudioDto as ICreateAudioDto } from '@kaad/multimedia/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class CreateAudioDto implements ICreateAudioDto {
    @ApiProperty()
    name: string;

    @ApiProperty()
    tags: string[];

    @ApiProperty()
    description: string;

    @ApiProperty({ type: 'string', format: 'binary', required: true })
    file: Express.Multer.File
}
