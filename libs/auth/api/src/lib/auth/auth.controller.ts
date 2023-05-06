import { AuthResponse, RefreshResponse } from '@kaad/auth/ng-common';
import { JwtGuard, LocalGuard, Public, RefreshGuard } from '@kaad/core/api';
import { Body, Controller, Delete, Get, HttpCode, Ip, Post, Request, UseGuards } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ApiTags } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { Credentials } from './dto/credentials.dto';
import { Register, RegisterWithGoogle } from './dto/register.dto';

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

    @UseGuards(JwtGuard)
    @Get()
    public async validateToken(): Promise<boolean> {
        return true;
    }

    @Post('register')
    @Public()
    public async register(@Body() registerData: Register, @Ip() ip: string): Promise<AuthResponse> {
        return await this.authService.register(registerData, ip);
    }

    @Public()
    @Post('renew/validate')
    public async validateRenewToken(@Body() body: { [key: string]: string }): Promise<boolean> {
        return this.authService.validateToken(body[this.configService.get<string>('JWT_REFRESH_TOKEN_NAME')])
    }

    @Public()
    @Post('signinWithGoogle')
    public async signinWithGoogle(@Ip() ip: string, @Body() { code }: { code: string }) {
        return this.authService.signinWithGoogle(code, ip);
    }

    @Public()
    @Post('registerWithGoogle')
    public async registerWithGoogle(@Ip() ip: string, @Body() data: RegisterWithGoogle) {
        return this.authService.registerWithGoogle(data, ip);
    }
}
