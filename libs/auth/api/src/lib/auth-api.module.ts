import { Module } from '@nestjs/common';
import { AuthController } from './auth/auth.controller';
import { AuthService } from './auth/auth.service';
import { AuthValidator } from './auth/validators/auth.validator';
import { JwtStrategy } from './auth/strategies/jwt.strategy';
import { LocalStrategy } from './auth/strategies/local.strategy';
import { RefreshStrategy } from './auth/strategies/refresh.strategy';
import { JwtUtils } from './jwt/jwt.utils';
import { SessionService } from './session/session.service';
import { SecurityApiModule } from '@kaad/security/api';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SessionEntity } from './session/entities/session.entity';

@Module({
    controllers: [
        AuthController
    ],
    providers: [
        AuthService,
        AuthValidator,
        JwtStrategy,
        JwtUtils,
        LocalStrategy,
        RefreshStrategy,
        SessionService
    ],
    exports: [],
    imports: [
        JwtModule.registerAsync({
            imports: [ConfigModule],
            useFactory: (config: ConfigService) =>
                config.get('jwtConfiguration'),
            inject: [ConfigService],
        }),
        SecurityApiModule,
        TypeOrmModule.forFeature([SessionEntity])
    ],
})
export class AuthApiModule {}
