import { AuthApiModule } from '@kaad/auth/api';
import { ConfigApiModule } from '@kaad/config/api';
import { SecurityApiModule } from '@kaad/security/api';
import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
    imports: [
        AuthApiModule,
        ConfigApiModule,
        SecurityApiModule
    ],
    controllers: [
        AppController
    ],
    providers: [
        AppService
    ],
})
export class AppModule { }
