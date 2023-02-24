import { CreateCategoryDto as ICreateCategoryDto } from '@kaad/multimedia/ng-common';
import { ApiProperty } from '@nestjs/swagger';

export class CreateCategoryDto implements ICreateCategoryDto {
    @ApiProperty()
    name: string;
}
