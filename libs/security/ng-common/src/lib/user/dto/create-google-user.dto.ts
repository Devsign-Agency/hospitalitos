import { ApiProperty } from "@nestjs/swagger";

export class CreateGoogleUserDto {
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

    @ApiProperty()
    googleId: string;
}
