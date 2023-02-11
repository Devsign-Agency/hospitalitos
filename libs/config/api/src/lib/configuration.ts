export const configuration = () => ({
    environment: process.env.NODE_ENV,
    globalPrefix: process.env.GLOBAL_PREFIX || 'api/v1',
    globalUrl: process.env.GLOBAL_URL || `http://localhost`,
    port: process.env.PORT,
    validationLink: process.env.VALIDATION_LINK,
    auth: {
        adminRole: process.env.ADMIN_ROLE,
        userRole: process.env.USER_ROLE
    },
    company: {
        name: process.env.COMPANY_NAME,
        url: process.env.COMPANY_URL,
        logo: process.env.COMPANY_LOGO_URL
    },
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
    gcloud: {
        tokenDir: process.env.GCLOUD_TOKEN_DIR,
        tokenFile: process.env.GCLOUD_TOKEN_FILE,
        credentials: process.env.GCLOUD_CREDENTIAL_FILE
    }
})
