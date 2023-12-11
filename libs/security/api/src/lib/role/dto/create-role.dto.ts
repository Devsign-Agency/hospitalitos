import { CreateRoleDto as ICreateRoleDto } from '@kaad/security/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class CreateRoleDto implements ICreateRoleDto {
    @ApiProperty()
    name: string;

    @ApiProperty()
    code: string;
}
