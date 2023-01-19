import { Module } from '@nestjs/common';
import { MailModule } from './mail/mail.module';

@Module({
    controllers: [],
    providers: [],
    exports: [],
    imports: [MailModule],
})
export class MailerApiModule {}
