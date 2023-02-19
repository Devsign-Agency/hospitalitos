import { CreateMultimediaDto as ICreateMultimediaDto } from "@kaad/multimedia/ng-common";
import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";

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

    // @ApiProperty({ type: 'string', format: 'binary', required: true })
    thumbnailImage?: Express.Multer.File;

    // @ApiProperty({ type: 'string', format: 'binary', required: true })
    file?: Express.Multer.File;

    files: { file?: Express.Multer.File[], thubnailImage?: Express.Multer.File[] }

}
