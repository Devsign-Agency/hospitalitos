import {
    Body, Controller, Post
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { SendMailerDto } from './dto/send-mailer.dto';
import { MailService } from './mail.service';

@ApiTags('Mailer')
@Controller('mailer')
export class MailController {
    constructor(private readonly mailerService: MailService) {}

    @Post()
    send(@Body() createMailerDto: SendMailerDto) {
        return this.mailerService.message(createMailerDto);
    }
}
