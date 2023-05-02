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
import { RoleEntity } from './role/entities/role.entity';
import { RoleService } from './role/role.service';
import { RoleValidator } from './role/validators/role.validator';
import { RoleController } from './role/role.controller';
import { CategoryModule } from '@kaad/commons/api';

@Module({
    controllers: [PasswordController, RoleController, UserController],
    providers: [PasswordService, PasswordValidator, RoleService, RoleValidator, UserService, UserValidator],
    imports: [
        CategoryModule,
        MailSenderModule,
        TypeOrmModule.forFeature([
            PasswordEntity,
            PasswordResetEntity,
            RoleEntity,
            UserEntity,
        ]),
    ],
    exports: [PasswordService, RoleService, UserService],
})
export class SecurityApiModule {}
