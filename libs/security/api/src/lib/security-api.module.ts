import { Module } from '@nestjs/common';
import { PasswordController } from './password/password.controller';
import { PasswordService } from './password/password.service';
import { UserController } from './user/user.controller';
import { UserService } from './user/user.service';
import { PasswordValidator } from './password/validators/password.validator';
import { UserValidator } from './user/validators/user.validator';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PasswordEntity } from './password/entities/password.entity';
import { UserEntity } from './user/entities/user.entity';

@Module({
    controllers: [
        PasswordController,
        UserController
    ],
    providers: [
        PasswordService,
        PasswordValidator,
        UserService,
        UserValidator
    ],
    imports: [
        TypeOrmModule.forFeature([PasswordEntity, UserEntity])
    ],
    exports: [
        PasswordService,
        UserService
    ],
})
export class SecurityApiModule {}
