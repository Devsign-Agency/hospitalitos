import { Public } from '@kaad/shared/api';
import { Body, Controller, Delete, HttpCode, Ip, Post, Request, UseGuards } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { AuthService } from './auth.service';
import { AuthResponse } from './dtos/auth-response.dto';
import { RefreshResponse } from './dtos/refresh-response.dto';
import { Register } from './dtos/register.dto';
import { JwtGuard } from './guards/jwt.guard';
import { LocalGuard } from './guards/local.guard';
import { RefreshGuard } from './guards/refresh.guard';

@Controller('auth')
export class AuthController {

    constructor(private authService: AuthService, private configService: ConfigService) { }

    @UseGuards(LocalGuard)
    @HttpCode(200)
    @Public()
    @Post()
    public async login(@Request() req, @Ip() ip: string): Promise<AuthResponse> {
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
        return this.authService.register(registerData, ip);
    }

    @Public()
    @Post("renew/validate")
    public async validateToken(@Body() body: { [key: string]: string }): Promise<boolean> {
        return this.authService.validateToken(body[this.configService.get<string>('JWT_REFRESH_TOKEN_NAME')])
    }
}
