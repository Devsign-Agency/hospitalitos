import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { configuration } from './configuration';
import { validationSchema } from './validation';
import { TypeOrmModule } from '@nestjs/typeorm';

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
        TypeOrmModule.forRootAsync({
            imports: [ConfigModule],
            useFactory: (config: ConfigService) => config.get('databaseConnection'),
            inject: [ConfigService]
        }),
    ]
})
export class ConfigApiModule {}
