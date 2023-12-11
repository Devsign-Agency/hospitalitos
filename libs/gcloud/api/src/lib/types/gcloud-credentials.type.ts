export type GcloudCredentials = {
    web: {
        auth_provider_x509_cert_url: string,
        auth_uri: string,
        client_id: string,
        client_secret: string,
        project_id: string,
        redirect_uris: string[],
        token_uri: string
    }
};
