import { AuthResponse, RefreshResponse, Register } from '@kaad/auth/ng-common';
import { AuthenticationService } from '@kaad/gcloud/api';
import { MailSenderService } from '@kaad/mailer/api';
import { PasswordService, UserService } from '@kaad/security/api';
import { User } from '@kaad/security/ng-common';
import { Injectable, Logger, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Credentials } from 'google-auth-library';
import { oauth2_v2 } from 'googleapis';
import { AccountService } from '../account/account.service';
import { Account } from '../account/interfaces/account.interface';
import { JwtUtils } from '../jwt/jwt.utils';
import { SessionService } from '../session/session.service';

@Injectable()
export class AuthService {

    constructor(private readonly accountService: AccountService,
        private readonly config: ConfigService,
        private readonly gcloudService: AuthenticationService,
        private readonly jwtUtils: JwtUtils,
        private readonly passwordService: PasswordService,
        private readonly mailSenderService: MailSenderService,
        private readonly sessionService: SessionService,
        private readonly userService: UserService) {}

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

        const account: Account = await this.accountService.register(user.id);

        const globalUrl = this.config.get('globalUrl');
        const port = this.config.get('port');
        const globalPrefix = this.config.get('globalPrefix');

        const obj = {
            to: user.email,
            subject: 'Please confirm your email',
            context: {
                companyName: this.config.get('company.name'),
                companyUrl: this.config.get('company.url'),
                companyLogoUrl: this.config.get('company.logo'),
                confirmUrl: `${globalUrl}:${port}/${globalPrefix}/account/${account.verificationCode}`,
            }
        };
        const template = './register';

        this.mailSenderService.send(obj, template);

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

    public async signinWithGoogle(code: string, ip: string): Promise<AuthResponse> {
        try {
            const tokenData = await this.gcloudService.getGoogleToken(code);
            const userInfo = await this.gcloudService.getUserInfo(tokenData);
            return await this.signinOrRegisterWithGoogle(userInfo, ip);

        } catch (error) {
            throw new UnauthorizedException(null, "invalid credentials")
        }
    }

    private async signinOrRegisterWithGoogle(userData: oauth2_v2.Schema$Userinfo, ip: string) {
        try {
            const user = await this.userService.findByGoogleId(userData.id);
            return await this.login(user, ip);
        } catch (error) {
            const user = await this.userService.registerWithGoogle(userData);
            return await this.login(user, ip);
        }
    }
}
