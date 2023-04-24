import { Category, CreateMultimediaDto as ICreateMultimediaDto } from "@kaad/multimedia/ng-common";
import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";
import { Express } from 'express';
import { Multer } from 'multer';

export class CreateMultimediaDto implements ICreateMultimediaDto {
    @ApiProperty()
    title: string;

    @ApiProperty()
    description: string;

    @ApiProperty()
    synopsis: string;

    @ApiPropertyOptional()
    recommended?: boolean;

    @ApiProperty()
    tags: string[];

    @ApiPropertyOptional()
    categories?: Category[];

    @ApiPropertyOptional()
    categoriesString?: string;

    // @ApiProperty({ type: 'string', format: 'binary', required: true })
    thumbnailImage?: Express.Multer.File;

    // @ApiProperty({ type: 'string', format: 'binary', required: true })
    file?: Express.Multer.File;

    files: { file?: Express.Multer.File[], thubnailImage?: Express.Multer.File[] }

}
