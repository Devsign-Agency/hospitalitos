import { UserDto } from './user.dto';

export interface CreateGoogleUserDto extends Partial<UserDto> {
    googleId: string;
}
