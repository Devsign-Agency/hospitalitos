import * as Joi from 'joi';

export const validationSchema = Joi.object({
    NODE_ENV: Joi.string().valid('development', 'production', 'test').required(),
    GLOBAL_PREFIX: Joi.string().default('api/v1'),
    PORT: Joi.number().default(3333),
    CONNECTION_HOST: Joi.string().required(),
    CONNECTION_PORT: Joi.number().required(),
    CONNECTION_USERNAME: Joi.string().required(),
    CONNECTION_PASSWORD: Joi.string().required(),
    CONNECTION_DATABASE: Joi.string().required(),
    CONNECTION_AUTOLOAD_ENTITIES: Joi.boolean().required(),
    CONNECTION_SYNCHRONIZE: Joi.string().default(false),
    JWT_ACCESS_TOKEN_SECRET: Joi.string().required(),
    JWT_ACCESS_TOKEN_EXPIRATION_TIME: Joi.number().required(),
    JWT_REFRESH_TOKEN_SECRET: Joi.string().required(),
    JWT_REFRESH_TOKEN_EXPIRATION_TIME: Joi.number().required(),
    JWT_REFRESH_TOKEN_NAME: Joi.string().default('refresh_token').required(),
    MAIL_DEFAULT_FROM: Joi.string().required(),
    MAIL_TRANSPORT_HOST: Joi.string().required(),
    MAIL_TRANSPORT_AUTH_USER: Joi.string().required(),
    MAIL_TRANSPORT_AUTH_PASS: Joi.string().required()
})
