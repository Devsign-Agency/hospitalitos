import { UserDto } from "./user.dto";

export interface CreateUserDto extends Partial<UserDto> {
    password?: string;
}
