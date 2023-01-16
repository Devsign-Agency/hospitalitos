/**
 * This is not a production server yet!
 * This is only a minimal backend to get started.
 */

import { Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { WinstonModule } from 'nest-winston';
import * as winston from 'winston';

import { AppModule } from './app/app.module';

async function bootstrap() {
    const app = await NestFactory.create(AppModule, {
        logger: WinstonModule.createLogger({
            // options (same as WinstonModule.forRoot() options)
            level: 'info',
            format: winston.format.combine(
                winston.format.colorize(),
                winston.format.timestamp(),
                winston.format.ms(),
                winston.format.printf((info) => {
                    const { timestamp, level, message, ...args } = info;

                    const ts = timestamp.slice(0, 19).replace('T', ' ');
                    return `${ts} [${level}]: ${args.context ? ('[' + args.context + ']') : ''} ${message} `;
                }),
            ),
            defaultMeta: { service: 'api' },
            transports: [
                new winston.transports.File({ dirname: 'logs', filename: 'error.log', level: 'error' }),
                new winston.transports.File({ dirname: 'logs', filename: 'api.log' }),
                new winston.transports.Console()
            ]
        })
    });
    const config = app.get(ConfigService);
    const globalPrefix = `${config.get('globalPrefix')}`;
    app.setGlobalPrefix(globalPrefix);
    app.enableCors({ origin: '*' })

    const port = process.env.PORT || 3333;
    await app.listen(port);

    Logger.log(
        `🚀 Application is running on: http://localhost:${port}/${globalPrefix}`
    );
}

bootstrap();
