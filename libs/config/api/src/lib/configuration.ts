export const configuration = () => ({
    environment: process.env.NODE_ENV,
    globalPrefix: process.env.GLOBAL_PREFIX || 'api/v1',
    port: process.env.PORT,
    databaseConnection: {
        type: 'postgres',
        host: process.env.CONNECTION_HOST,
        port: parseInt(process.env.CONNECTION_PORT || "55432", 10),
        username: process.env.CONNECTION_USERNAME,
        password: process.env.CONNECTION_PASSWORD,
        database: process.env.CONNECTION_DATABASE,
        autoLoadEntities: process.env.CONNECTION_AUTOLOAD_ENTITIES,
        synchronize: process.env.CONNECTION_SYNCHRONIZE
    },
    jwtConfiguration: {
        secret: process.env.JWT_ACCESS_TOKEN_SECRET,
        signOptions: { expiresIn: `${process.env.JWT_ACCESS_TOKEN_EXPIRATION_TIME}s`}
    },
    mailer: {
        from: process.env.MAIL_DEFAULT_FROM,
        host: process.env.MAIL_TRANSPORT_HOST,
        user: process.env.MAIL_TRANSPORT_AUTH_USER,
        pass: process.env.MAIL_TRANSPORT_AUTH_PASS,
    },

})
