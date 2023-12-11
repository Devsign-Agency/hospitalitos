import { UpdateBookDto as IUpdateBookDto } from '@kaad/multimedia/ng-common';
import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateBookDto } from './create-book.dto';

export class UpdateBookDto extends PartialType(CreateBookDto) implements IUpdateBookDto {
    @ApiProperty()
    id: string;
}
