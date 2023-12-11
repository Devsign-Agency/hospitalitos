import { Credentials as ICredentials } from '@kaad/auth/ng-common'
import { ApiProperty } from "@nestjs/swagger";

export class Credentials implements ICredentials {
    @ApiProperty()
    username: string;

    @ApiProperty()
    password: string;

    @ApiProperty()
    rememberMe: boolean;
}
