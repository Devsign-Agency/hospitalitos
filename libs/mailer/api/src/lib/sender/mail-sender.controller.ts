import {
    Body, Controller, Post
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { SendMailerDto } from './dto/send-mailer.dto';
import { MailSenderService } from './mail-sender.service';

@ApiTags('MailerSender')
@Controller('mailer')
export class MailSenderController {
    constructor(private readonly mailerService: MailSenderService) {}

    @Post()
    send(@Body() createMailerDto: SendMailerDto) {
        return this.mailerService.message(createMailerDto);
    }
}
