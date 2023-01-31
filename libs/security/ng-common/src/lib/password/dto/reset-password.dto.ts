import { ApiProperty } from "@nestjs/swagger";

export class ResetPassword {
    @ApiProperty()
    validationCode: string;

    @ApiProperty()
    newPassword: string;
}
