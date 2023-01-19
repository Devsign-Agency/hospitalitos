import { MailerService } from '@nestjs-modules/mailer';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { SendMailerDto } from './dto/send-mailer.dto';

@Injectable()
export class MailSenderService {

    constructor(
        private config: ConfigService,
        private mailerService: MailerService) {}

    async send(sendMailDto: SendMailerDto, template: string) {
        const { to, subject, context, from } = sendMailDto;

        await this.mailerService.sendMail({
            to,
            from,
            subject,
            template,
            context,
        });
    }

    async message(sendMailDto: SendMailerDto) {
        const template = './message';
        sendMailDto.from = this.config.get<string>('MAIL_DEFAULT_FROM');

        return this.send(sendMailDto, template);
    }
}
