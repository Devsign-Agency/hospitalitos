import { ConfigService } from "@nestjs/config";
import * as fs from 'fs';
import { OAuth2Client } from 'google-auth-library';
import { GcloudCredentials } from "../types/gcloud-credentials.type";

export class BaseService {

    protected TOKEN_DIR: string;
    protected CREDENTIAL_PATH: string;
    protected TOKEN_PATH: string;

    constructor(private readonly config: ConfigService) {
        this.TOKEN_DIR = `${this.config.get('gcloud.tokenDir')}`;
        this.CREDENTIAL_PATH = `${this.TOKEN_DIR}/${this.config.get('gcloud.credentials')}`;
        this.TOKEN_PATH = `${this.TOKEN_DIR}/${this.config.get('gcloud.tokenFile')}`;
    }

    protected async getOauth2Client(): Promise<OAuth2Client> {
        const content: Buffer = fs.readFileSync(this.CREDENTIAL_PATH);
        const credentials: GcloudCredentials = JSON.parse(content.toString()); // credential

        // authentication
        const { client_secret, client_id, redirect_uris } = credentials.web;
        const oauth2Client: OAuth2Client = new OAuth2Client(client_id, client_secret, redirect_uris[0]);
        return oauth2Client;
    }
}
