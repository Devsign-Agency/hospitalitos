import { JwtPayload } from '@kaad/auth/ng-common';
import { User } from '@kaad/security/ng-common';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class JwtUtils {
    constructor(private configService: ConfigService,
        private jwtService: JwtService) { }

    public generateAccessToken(user: Partial<User>): string {
        const payloadAccess: Partial<JwtPayload> = {
            username: user.username,
            sub: user.id.toString(),
            data: { user }
        };
        return this.jwtService.sign(payloadAccess);
    }

    public generateRefreshToken(user: Partial<User>): string {
        const payloadRefresh: Partial<JwtPayload> = {
            username: user.username,
            sub: user.id.toString()
        };
        return this.jwtService.sign(payloadRefresh, {
            secret: this.configService.get<string>('JWT_REFRESH_TOKEN_SECRET'),
            expiresIn: `${this.configService.get<number>('JWT_REFRESH_TOKEN_EXPIRATION_TIME')}s`
        });
    }

    public validateToken(token: string, secret: string): boolean {
        let valid = false;
        try {
            const obj = this.jwtService.verify(token, { secret });
            valid = !!obj;
        } catch (error) {
            valid = false;
        }

        return valid;
    }

    public validateAccessToken(token: string): boolean {
        return this.validateToken(token, this.configService.get<string>('JWT_ACCESS_TOKEN_SECRET'));
    }

    public validateRefreshToken(token: string): boolean {
        return this.validateToken(token, this.configService.get<string>('JWT_REFRESH_TOKEN_SECRET'));
    }
}
