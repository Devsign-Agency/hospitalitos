import { ApiProperty } from "@nestjs/swagger";

export class Credentials {
    @ApiProperty()
    username: string;

    @ApiProperty()
    password: string;

    @ApiProperty()
    rememberMe: boolean;
}
