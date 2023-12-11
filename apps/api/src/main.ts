/**
 * This is not a production server yet!
 * This is only a minimal backend to get started.
 */

import { Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { WinstonModule } from 'nest-winston';
import * as winston from 'winston';
import { json, urlencoded } from 'body-parser';

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
    app.setGlobalPrefix(globalPrefix);``
    app.enableCors({ origin: '*' })

    app.use(json({ limit: '50mb' }));
    app.use(urlencoded({ limit: '50mb', extended: true }))

    if (config.get('environment') != 'production') {
        const swaggerConfig = new DocumentBuilder()
            .setTitle('Kaad API')
            .setDescription('Kaad RESTful API')
            .setVersion('1.0')
            .build();
        const document = SwaggerModule.createDocument(app, swaggerConfig);
        SwaggerModule.setup('api/swagger', app, document);
    }

    const port = process.env.PORT || 3333;
    await app.listen(port);

    const globalUrl = config.get('globalUrl');
    Logger.log(
        `🚀 Application is running on: ${globalUrl}:${port}/${globalPrefix}`
    );
}

bootstrap();
