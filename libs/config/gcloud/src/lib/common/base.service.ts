import { Logger } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import * as fs from 'fs';
import { OAuth2Client } from 'google-auth-library';
import { GcloudCredentials } from "../types/gcloud-credentials.type";

export class BaseService {

    protected SCOPES: string[];
    protected URI_INDEX = 0;

    protected TOKEN_DIR: string;
    protected CREDENTIAL_PATH: string;
    protected TOKEN_PATH: string;

    constructor(readonly config: ConfigService, readonly scopes: string[]) {
        this.SCOPES = scopes;
        this.TOKEN_DIR = `${config.get('gcloud.tokenDir')}`;
        this.CREDENTIAL_PATH = `${this.TOKEN_DIR}/${config.get('gcloud.credentials')}`;
        this.TOKEN_PATH = `${this.TOKEN_DIR}/${config.get('gcloud.tokenFile')}`;
    }

    protected async getOauth2Client(): Promise<OAuth2Client> {
        const content: Buffer = fs.readFileSync(this.CREDENTIAL_PATH);
        const credentials: GcloudCredentials = JSON.parse(content.toString()); // credential

        // authentication
        const { client_secret, client_id, redirect_uris } = credentials.web;
        const oauth2Client: OAuth2Client = new OAuth2Client(client_id, client_secret, redirect_uris[this.URI_INDEX]);
        return oauth2Client;
    }

    public async getAuthUrl() {
        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        //get new token
        const authUrl = oauth2Client.generateAuthUrl({
            access_type: 'offline',
            scope: this.SCOPES
        });

        return { authUrl };
    }
}
