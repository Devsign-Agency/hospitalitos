import { DEFAULT_ADMIN_ROLE, DEFAULT_USER_ROLE } from '@kaad/shared/ng-common';
import * as Joi from 'joi';

export const validationSchema = Joi.object({
    NODE_ENV: Joi.string().valid('development', 'production', 'test').required(),
    GLOBAL_PREFIX: Joi.string().default('api/v1'),
    GLOBAL_URL: Joi.string().default('http://localhost'),
    PORT: Joi.number().default(3333),
    VALIDATION_LINK: Joi.number().default(24),
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
    MAIL_TRANSPORT_AUTH_PASS: Joi.string().required(),
    COMPANY_NAME: Joi.string().required(),
    COMPANY_URL: Joi.string().required(),
    COMPANY_LOGO_URL: Joi.string().required(),
    GCLOUD_TOKEN_DIR: Joi.string().required(),
    GCLOUD_TOKEN_FILE: Joi.string().required(),
    GCLOUD_CREDENTIAL_FILE: Joi.string().required(),
    ADMIN_ROLE: Joi.string().required().default(DEFAULT_ADMIN_ROLE),
    USER_ROLE: Joi.string().required().default(DEFAULT_USER_ROLE)
})
