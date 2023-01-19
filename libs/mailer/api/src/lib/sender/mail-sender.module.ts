import { Module } from '@nestjs/common';
import { MailSenderService } from './mail-sender.service';
import { MailSenderController } from './mail-sender.controller';
import { join } from 'path';
import { MailerModule } from '@nestjs-modules/mailer';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
    controllers: [MailSenderController],
    providers: [MailSenderService],
    imports: [
        MailerModule.forRootAsync({
            imports: [ConfigModule],
            inject: [ConfigService],
            useFactory: (config: ConfigService) => ({
                transport: {
                    host: config.get('mailer.host'),
                    secure: true,
                    ignoreTLS: true,
                    auth: {
                        user: config.get('mailer.user'),
                        pass: config.get('mailer.pass'),
                    },
                },
                defaults: {
                    from: config.get('mailer.from'),
                },
                template: {
                    dir: join(__dirname, 'templates'),
                    adapter: new HandlebarsAdapter(), // or new PugAdapter() or new EjsAdapter()
                    options: {
                        strict: true,
                    },
                }
            })
        })
    ]
})
export class MailSenderModule { }
