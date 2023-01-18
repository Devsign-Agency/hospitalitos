import { PasswordService, User, UserService } from '@kaad/security/api';
import { Injectable } from '@nestjs/common';
import { JwtUtils } from '../jwt/jwt.utils';
import { SessionService } from '../session/session.service';
import { AuthResponse } from './dtos/auth-response.dto';
import { RefreshResponse } from './dtos/refresh-response.dto';
import { Register } from './dtos/register.dto';

@Injectable()
export class AuthService {

    constructor(private jwtUtils: JwtUtils,
        private passwordService: PasswordService,
        private sessionService: SessionService,
        private userService: UserService) {}

    public async login(user: User, ip: string): Promise<AuthResponse> {
        const accessToken: string = this.jwtUtils.generateAccessToken(user);
        const refreshToken: string = this.jwtUtils.generateRefreshToken(user);

        await this.sessionService.create(user.id, refreshToken, ip);

        return {
            user,
            userId: user.id,
            accessToken,
            refreshToken
        }
    }

    public async logout(user: User): Promise<boolean> {
        return await this.sessionService.delete(user.id);
    }

    public async register(registerData: Register, ip: string): Promise<AuthResponse> {

        const { password, ...userData } = registerData;

        const user: User = await this.userService.create(userData);
        await this.passwordService.addNewPassword(user, password);

        const accessToken: string = this.jwtUtils.generateAccessToken(user);
        const refreshToken: string = this.jwtUtils.generateRefreshToken(user);

        await this.sessionService.create(user.id, refreshToken, ip);

        return {
            user,
            userId: user.id,
            accessToken,
            refreshToken
        }
    }

    public async refreshAccessToken(user: User): Promise<Partial<RefreshResponse>> {
        const accessToken: string = this.jwtUtils.generateAccessToken(user);
        return { accessToken };
    }

    public async validateToken(token: string): Promise<boolean> {
        return this.jwtUtils.validateRefreshToken(token);
    }
}
