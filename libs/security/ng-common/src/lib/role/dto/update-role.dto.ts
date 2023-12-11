import { CreateRoleDto } from './create-role.dto';

export interface UpdateRoleDto extends Partial<CreateRoleDto> {
    id: string;
}
