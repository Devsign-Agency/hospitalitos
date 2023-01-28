import { Controller, Get, Ip, Query, Req, UseGuards } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AuthenticationService } from './authentication.service';
import { GoogleGuard } from './guards/google.guard';

@ApiTags('GCloud Authentication')
@Controller('gAuth')
export class AuthenticationController {
    constructor(private readonly authService: AuthenticationService) { }

    @Get()
    // @UseGuards(GoogleGuard)
    async getAuthUrl() {
        return await this.authService.getAuthUrl();
    }

    @Get('callback')
    async googleAuthCallback(@Query('code') code: string, @Ip() ip: string, @Req() req) {
        return this.authService.signInWithGoogle(code);
    }
}
