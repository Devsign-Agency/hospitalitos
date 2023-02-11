import { CreatePasswordDto } from './create-password.dto';

export interface UpdatePasswordDto extends Partial<CreatePasswordDto> {
    id: string;
}
