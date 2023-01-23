import { Injectable, InternalServerErrorException, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as fs from 'fs';
import { OAuth2Client } from 'google-auth-library';
import { google } from 'googleapis';
import { MetadataVideo } from '../dto/metadata-video.dto';

const SCOPES = [
    'https://www.googleapis.com/auth/youtube.upload',
    'https://www.googleapis.com/auth/youtube.readonly'
];

type Credential = {
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

@Injectable()
export class YoutubeService {
    private TOKEN_DIR: string;
    private CREDENTIAL_PATH: string;
    private TOKEN_PATH: string;

    constructor(private readonly config: ConfigService) {
        this.TOKEN_DIR = `${this.config.get('gcloud.tokenDir')}`;
        this.CREDENTIAL_PATH = `${this.TOKEN_DIR}/${this.config.get('gcloud.credentials')}`;
        this.TOKEN_PATH = `${this.TOKEN_DIR}/${this.config.get('gcloud.tokenFile')}`;
    }

    private async getOauth2Client(): Promise<OAuth2Client> {
        const content: Buffer = fs.readFileSync(this.CREDENTIAL_PATH);
        const credentials: Credential = JSON.parse(content.toString()); // credential

        // authentication
        const { client_secret, client_id, redirect_uris } = credentials.web;
        const oauth2Client: OAuth2Client = new OAuth2Client(client_id, client_secret, redirect_uris[0]);
        return oauth2Client;
    }

    private async loadTokenCredentials() {
        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        const token = fs.readFileSync(this.TOKEN_PATH);
        oauth2Client.credentials = JSON.parse(token.toString());

        return oauth2Client;
    }

    public async getAuthUrl() {
        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        //get new token
        const authUrl = oauth2Client.generateAuthUrl({
            access_type: 'offline',
            scope: SCOPES
        });

        return { authUrl };
    }

    public async login(code: string) {
        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        return new Promise((resolve, reject) => {
            oauth2Client.getToken(code, (err, token) => {
                if (err) {
                    console.log('Error while trying to retrieve access token', err);
                    reject('Invalid code');
                }

                oauth2Client.credentials = token;

                try {
                    fs.mkdirSync(this.TOKEN_DIR);
                } catch (err) {
                    if (err.code != 'EEXIST') reject('File system error');
                }

                fs.writeFileSync(this.TOKEN_PATH, JSON.stringify(token));
                console.log('Token stored to ' + this.TOKEN_PATH);
                resolve(true);
            });
        });
    }

    public async upload(file: Express.Multer.File, metadata: MetadataVideo) {
        const { title, description, tags, defaultLanguage, defaultAudioLanguage } = metadata;
        const auth: OAuth2Client = await this.loadTokenCredentials();
        const service = google.youtube({ version: 'v3', auth: auth });

        return new Promise((resolve, reject) => {
            service.videos.insert(
                {
                    part: ['snippet,contentDetails,status'],

                    requestBody: {
                        // Video title and description
                        snippet: {
                            title,
                            description,
                            tags,
                            defaultLanguage,
                            defaultAudioLanguage
                        },
                        // I set to private for tests
                        status: {
                            privacyStatus: 'private'
                        }
                    },

                    // Create the readable stream to upload the video
                    media: {
                        body: fs.createReadStream(file.path) // Change here to your real video
                    }
                },
                (error, data) => {
                    if (error) {
                        Logger.error(error, 'YoutubeService:upload');
                        reject(error);
                        throw new InternalServerErrorException(error)
                    }

                    fs.rmSync(file.path);

                    const urlVideo = `https://www.youtube.com/watch?v=${data.data.id}`
                    Logger.log(`url video: ${urlVideo}`, 'YoutubeService:upload');
                    resolve(urlVideo);
                }
            );
        });
    }
}
