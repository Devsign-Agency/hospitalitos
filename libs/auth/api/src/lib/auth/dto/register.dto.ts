import { Register as IRegister } from '@kaad/auth/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class Register implements IRegister {
    @ApiProperty()
    username: string;

    @ApiProperty()
    password: string;

    @ApiProperty()
    email: string;

    @ApiProperty()
    firstname: string;

    @ApiProperty()
    lastname: string;

    @ApiProperty()
    photoUrl: string;
}
