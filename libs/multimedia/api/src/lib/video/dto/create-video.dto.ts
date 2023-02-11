import { CreateVideoDto as ICreateVideoDto } from '@kaad/multimedia/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class CreateVideoDto implements ICreateVideoDto {
    @ApiProperty()
    name: string;

    @ApiProperty()
    tags: string[];

    @ApiProperty()
    description: string;

    @ApiProperty({ type: 'string', format: 'binary', required: true })
    file: Express.Multer.File
}
