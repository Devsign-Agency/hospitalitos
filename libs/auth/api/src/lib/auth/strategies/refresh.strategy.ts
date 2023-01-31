import { JwtPayload } from '@kaad/auth/ng-common';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { AuthValidator } from '../validators/auth.validator';

@Injectable()
export class RefreshStrategy extends PassportStrategy(Strategy, 'refresh-token') {
    constructor(private validator: AuthValidator, private configService: ConfigService) {
        super({
            jwtFromRequest: ExtractJwt.fromBodyField(configService.get<string>('JWT_REFRESH_TOKEN_NAME')),
            ignoreExpiration: false,
            secretOrKey: configService.get<string>('JWT_REFRESH_TOKEN_SECRET'),
            passReqToCallback: true
        });
    }

    public async validate(request: Request, payload: Partial<JwtPayload>) {
        const refreshToken: string = request.body[this.configService.get<string>('JWT_REFRESH_TOKEN_NAME')];
        return await this.validator.validateRefreshToken(payload.sub, refreshToken);
    }
}
