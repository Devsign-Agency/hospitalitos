import { Controller, Get, Ip, Post, Query, Req } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AuthenticationService } from './authentication.service';

@ApiTags('GCloud Authentication')
@Controller('gAuth')
export class AuthenticationController {
    constructor(private readonly authService: AuthenticationService) { }

    @Get()
    async getAuthUrl() {
        return await this.authService.getAuthUrl();
    }

    @Get('callback')
    async googleAuthCallback(@Query('code') code: string, @Ip() ip: string, @Req() req) {
        return this.authService.getGoogleToken(code);
    }
}
