import { ApiProperty } from "@nestjs/swagger";

interface IMetadataVideo {
    title: string;
    description: string;
    tags: string[];
    defaultLanguage?: string;
    defaultAudioLanguage?: string;
    file?: Express.Multer.File;
}

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

    constructor(meta: IMetadataVideo) {
        this.title = meta.title;
        this.description = meta.description;
        this.tags = meta.tags;
        this.defaultLanguage = meta.defaultLanguage || 'es';
        this.defaultAudioLanguage = meta.defaultAudioLanguage || 'es';
        if (meta.file) {
            this.file = meta.file;
        }
    }
}
