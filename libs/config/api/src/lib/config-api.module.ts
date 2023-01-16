import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { configuration } from './configuration';
import { validationSchema } from './validation';

@Module({
    controllers: [],
    providers: [],
    exports: [],
    imports: [
        ConfigModule.forRoot({
            isGlobal: true,
            load: [configuration],
            validationSchema
        }),
    ]
})
export class ConfigApiModule {}
