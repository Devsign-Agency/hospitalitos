import { CreateUserDto as ICreateUserDto} from '@kaad/security/ng-common';
import { ApiPropertyOptional, PartialType } from "@nestjs/swagger";
import { UserDto } from "./user.dto";

export class CreateUserDto extends PartialType(UserDto) implements ICreateUserDto {
    @ApiPropertyOptional()
    password?: string;
}
