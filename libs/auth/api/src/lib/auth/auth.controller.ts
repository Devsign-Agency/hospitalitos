import { AuthResponse, Credentials, RefreshResponse, Register } from '@kaad/auth/ng-common';
import { Public } from '@kaad/shared/api';
import { Body, Controller, Delete, HttpCode, Ip, Post, Query, Request, UseGuards } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ApiTags } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { JwtGuard } from './guards/jwt.guard';
import { LocalGuard } from './guards/local.guard';
import { RefreshGuard } from './guards/refresh.guard';

@ApiTags('Auth')
@Controller('auth')
export class AuthController {

    constructor(private authService: AuthService, private configService: ConfigService) { }

    @UseGuards(LocalGuard)
    @HttpCode(200)
    @Public()
    @Post()
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    public async login(@Request() req, @Ip() ip: string, @Body() _credential: Credentials): Promise<AuthResponse> {
        return this.authService.login(req.user, ip);
    }

    @UseGuards(JwtGuard)
    @Delete()
    public async logout(@Request() req): Promise<boolean> {
        return await this.authService.logout(req.user);
    }

    @UseGuards(RefreshGuard)
    @Post('renew')
    @Public()
    public async refresh(@Request() req): Promise<Partial<RefreshResponse>> {
        return await this.authService.refreshAccessToken(req.user);
    }

    @Post('register')
    @Public()
    public async register(@Body() registerData: Register, @Ip() ip: string): Promise<AuthResponse> {
        return await this.authService.register(registerData, ip);
    }

    @Public()
    @Post('renew/validate')
    public async validateToken(@Body() body: { [key: string]: string }): Promise<boolean> {
        return this.authService.validateToken(body[this.configService.get<string>('JWT_REFRESH_TOKEN_NAME')])
    }

    @Public()
    @Post('signinWithGoogle')
    public async signinWithGoogle(@Ip() ip: string, @Body() { code }: { code: string }) {
        return this.authService.signinWithGoogle(code, ip);
    }
}
