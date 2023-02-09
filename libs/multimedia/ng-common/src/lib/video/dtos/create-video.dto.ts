import { ApiProperty } from "@nestjs/swagger";

export class CreateVideoDto {
    @ApiProperty()
    name: string;

    @ApiProperty()
    tags: string[];

    @ApiProperty()
    description: string;

    @ApiProperty({ type: 'string', format: 'binary', required: true })
    file: Express.Multer.File
}
