import { ApiProperty, PartialType } from '@nestjs/swagger';
import { UserDto } from './user.dto';

export class CreateGoogleUserDto extends PartialType(UserDto) {
    @ApiProperty()
    googleId: string;
}
