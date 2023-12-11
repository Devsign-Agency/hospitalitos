import { UpdateUserDto as IUdateUserDto } from '@kaad/security/ng-common';
import { DEFAULT_ADMIN_ROLE, DEFAULT_USER_ROLE } from '@kaad/shared/ng-common';
import { ApiProperty, ApiPropertyOptional, PartialType } from '@nestjs/swagger';
import { CreateUserDto } from './create-user.dto';

export class UpdateUserDto extends PartialType(CreateUserDto) implements IUdateUserDto {
    @ApiProperty()
    id: string;

    @ApiPropertyOptional({ default: false, type: 'boolean' })
    emailVerified?: boolean;

    @ApiPropertyOptional({ type: 'array', examples: [DEFAULT_ADMIN_ROLE, DEFAULT_USER_ROLE] })
    role?: string[];

    @ApiPropertyOptional({ type: 'array' })
    preferences?: string[];
}
