import { CreateCategoryDto as ICreateCategoryDto } from '@kaad/commons/ng-common';
import { ApiProperty } from '@nestjs/swagger';

export class CreateCategoryDto implements ICreateCategoryDto {
    @ApiProperty()
    name: string;
}
