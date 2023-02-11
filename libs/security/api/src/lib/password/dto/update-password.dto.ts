import { UpdatePasswordDto as IUpdatePasswordDto } from '@kaad/security/ng-common';
import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreatePasswordDto } from './create-password.dto';

export class UpdatePasswordDto extends PartialType(CreatePasswordDto) implements IUpdatePasswordDto {
    @ApiProperty()
    id: string;
}
