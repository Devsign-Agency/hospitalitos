import { ApiProperty, ApiPropertyOptional, PartialType } from '@nestjs/swagger';
import { CreateUserDto } from './create-user.dto';

export class UpdateUserDto extends PartialType(CreateUserDto) {
    @ApiProperty()
    id: string;

    @ApiPropertyOptional({ default: false, type: 'boolean' })
    emailVerified?: boolean;

    @ApiPropertyOptional({ type: 'array', examples: ['admin', 'user'] })
    role?: string[]
}
