import { CreatePasswordDto as ICreatePasswordDto,  User } from "@kaad/security/ng-common";
import { ApiProperty } from "@nestjs/swagger";

export class CreatePasswordDto implements ICreatePasswordDto {
    @ApiProperty()
    user: User;

    @ApiProperty()
    value: string;
}
