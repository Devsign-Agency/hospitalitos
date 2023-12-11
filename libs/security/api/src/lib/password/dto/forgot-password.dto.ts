import { ForgotPassword as IForgotPassword } from '@kaad/security/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class ForgotPassword implements IForgotPassword {
    @ApiProperty()
    email: string;

    @ApiProperty()
    urlCallback: string;
}
