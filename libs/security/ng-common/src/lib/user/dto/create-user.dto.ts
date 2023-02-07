import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";

export class CreateUserDto {
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

    @ApiPropertyOptional()
    password?: string;
}
