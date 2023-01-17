import {
    Body, Controller, Logger, Post
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ForgotPassword } from './dto/forgot-password.dto';
import { ResetPassword } from './dto/reset-password.dto';

@ApiTags('Password')
@Controller('password')
export class PasswordController {

    // @Public()
    @Post("forgot-password")
    public forgotPassword(@Body() forgotDto: ForgotPassword) {
        Logger.log(forgotDto, 'PasswordController::forgotPassword');
    }

    @Post("reset-password")
    public resetPassword(@Body() resetDto: ResetPassword) {
        Logger.log(resetDto, 'PasswordController::resetPassword');
    }
}
