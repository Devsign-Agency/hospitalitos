import { UpdateRoleDto as IUpdateRoleDto } from '@kaad/security/ng-common';
import { ApiProperty, PartialType } from '@nestjs/swagger';
import { CreateRoleDto } from './create-role.dto';

export class UpdateRoleDto extends PartialType(CreateRoleDto) implements IUpdateRoleDto {
    @ApiProperty()
    id: string;
}
