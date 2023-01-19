import { ApiProperty } from "@nestjs/swagger";
import { User } from "../../user/interfaces/user.interface";

export class CreatePasswordDto {
    @ApiProperty()
    user: User;

    @ApiProperty()
    value: string;
}
