import { ApiProperty } from "@nestjs/swagger";

export class MetadataVideo {
    @ApiProperty()
    title: string;

    @ApiProperty()
    description: string;

    @ApiProperty()
    tags: string[];

    @ApiProperty({ default: 'es', required: false })
    defaultLanguage: string;

    @ApiProperty({ default: 'es', required: false })
    defaultAudioLanguage: string;

    @ApiProperty({ type: 'string', format: 'binary', required: true })
    file: Express.Multer.File
}
