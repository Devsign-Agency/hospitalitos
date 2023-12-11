import { CreateGoogleUserDto as ICreateGoogleUserDto } from '@kaad/security/ng-common';
import { ApiProperty, PartialType } from '@nestjs/swagger';
import { UserDto } from './user.dto';

export class CreateGoogleUserDto extends PartialType(UserDto) implements ICreateGoogleUserDto {
    @ApiProperty()
    googleId: string;
}
