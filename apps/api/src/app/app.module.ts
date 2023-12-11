import { AuthApiModule } from '@kaad/auth/api';
import { ConfigApiModule } from '@kaad/config/api';
import { GcloudApiModule } from '@kaad/gcloud/api';
import { MailSenderModule } from '@kaad/mailer/api';
import { MultimediaApiModule } from '@kaad/multimedia/api';
import { SecurityApiModule } from '@kaad/security/api';
import { Module } from '@nestjs/common';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CategoryModule } from '@kaad/commons/api';

@Module({
    imports: [
        AuthApiModule,
        ConfigApiModule,
        CategoryModule,
        GcloudApiModule,
        MailSenderModule,
        MultimediaApiModule,
        SecurityApiModule,
        ServeStaticModule.forRoot({
            rootPath: join(__dirname, 'assets'),
            serveRoot: '/api/multimedia'
        })
    ],
    controllers: [
        AppController
    ],
    providers: [
        AppService
    ],
})
export class AppModule { }
