import { Module } from '@nestjs/common';
import { AuthController } from './auth/auth.controller';
import { AuthService } from './auth/auth.service';
import { AuthValidator } from './auth/validators/auth.validator';
import { JwtStrategy } from './auth/strategies/jwt.strategy';
import { LocalStrategy } from './auth/strategies/local.strategy';
import { RefreshStrategy } from './auth/strategies/refresh.strategy';
import { JwtUtils } from './jwt/jwt.utils';
import { SessionService } from './session/session.service';

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
    imports: [],
})
export class AuthApiModule {}
