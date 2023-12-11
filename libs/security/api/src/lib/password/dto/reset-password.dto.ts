import { ResetPassword as IResetPassword } from '@kaad/security/ng-common';
import { ApiProperty } from "@nestjs/swagger";

export class ResetPassword implements IResetPassword {
    @ApiProperty()
    validationCode: string;

    @ApiProperty()
    newPassword: string;
}
