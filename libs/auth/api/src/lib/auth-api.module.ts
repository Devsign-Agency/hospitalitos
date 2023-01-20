import { MailSenderModule } from '@kaad/mailer/api';
import { SecurityApiModule } from '@kaad/security/api';
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { JwtModule } from '@nestjs/jwt';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AccountService } from './account/account.service';
import { AccountEntity } from './account/entities/account.entity';
import { AuthController } from './auth/auth.controller';
import { AuthService } from './auth/auth.service';
import { JwtStrategy } from './auth/strategies/jwt.strategy';
import { LocalStrategy } from './auth/strategies/local.strategy';
import { RefreshStrategy } from './auth/strategies/refresh.strategy';
import { AuthValidator } from './auth/validators/auth.validator';
import { JwtUtils } from './jwt/jwt.utils';
import { SessionEntity } from './session/entities/session.entity';
import { SessionService } from './session/session.service';
import { AccountController } from './account/account.controller';

@Module({
    controllers: [AuthController, AccountController],
    providers: [
        AccountService,
        AuthService,
        AuthValidator,
        JwtStrategy,
        JwtUtils,
        LocalStrategy,
        RefreshStrategy,
        SessionService,
    ],
    exports: [],
    imports: [
        JwtModule.registerAsync({
            imports: [ConfigModule],
            useFactory: (config: ConfigService) =>
                config.get('jwtConfiguration'),
            inject: [ConfigService],
        }),
        MailSenderModule,
        SecurityApiModule,
        TypeOrmModule.forFeature([AccountEntity, SessionEntity]),
    ],
})
export class AuthApiModule {}
