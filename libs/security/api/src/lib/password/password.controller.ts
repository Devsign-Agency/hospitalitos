import {
    Body, Controller, Post
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ForgotPassword } from './dto/forgot-password.dto';
import { ResetPassword } from './dto/reset-password.dto';
import { PasswordService } from './password.service';

@ApiTags('Password')
@Controller('password')
export class PasswordController {

    constructor(private readonly passwordService: PasswordService) {}

    // @Public()
    @Post("forgot-password")
    public forgotPassword(@Body() forgotDto: ForgotPassword) {
        return this.passwordService.forgotPassword(forgotDto);
    }

    @Post("reset-password")
    public resetPassword(@Body() resetDto: ResetPassword) {
        return this.passwordService.resetPassword(resetDto);
    }
}
