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
import { PasswordResetEntity } from './password/entities/password-reset.entity';
import { MailSenderModule } from '@kaad/mailer/api';

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
        MailSenderModule,
        TypeOrmModule.forFeature([PasswordEntity, PasswordResetEntity, UserEntity])
    ],
    exports: [
        PasswordService,
        UserService
    ],
})
export class SecurityApiModule {}
