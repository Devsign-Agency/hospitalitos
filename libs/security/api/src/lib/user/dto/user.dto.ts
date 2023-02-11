import { UserDto as IUserDto } from '@kaad/security/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class UserDto implements IUserDto {
    @ApiProperty()
    username: string;

    @ApiProperty()
    email: string;

    @ApiProperty()
    firstname: string;

    @ApiProperty()
    lastname: string;

    @ApiProperty()
    photoUrl: string;
}
