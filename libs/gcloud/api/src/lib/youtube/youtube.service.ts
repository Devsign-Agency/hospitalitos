import { Injectable, InternalServerErrorException, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as fs from 'fs';
import { OAuth2Client } from 'google-auth-library';
import { google } from 'googleapis';
import { BaseService } from '../common/base.service';
import { MetadataVideo } from '../dto/metadata-video.dto';
import { UploadVideoResponse } from '../dto/upload-video.response';

const SCOPES = [
    'https://www.googleapis.com/auth/youtube.upload',
    'https://www.googleapis.com/auth/youtube.readonly'
];

@Injectable()
export class YoutubeService extends BaseService {

    constructor(readonly configService: ConfigService) {
        super(configService, SCOPES);
        this.URI_INDEX = 1;
    }

    private async loadTokenCredentials() {
        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        const token = fs.readFileSync(this.TOKEN_PATH);
        oauth2Client.credentials = JSON.parse(token.toString());

        return oauth2Client;
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
                resolve(true);
            });
        });
    }

    public async upload(file: Express.Multer.File, metadata: MetadataVideo): Promise<UploadVideoResponse> {
        const { title, description, tags, defaultLanguage, defaultAudioLanguage } = metadata;
        const auth: OAuth2Client = await this.loadTokenCredentials();
        const service = google.youtube({ version: 'v3', auth: auth });

        return new Promise<UploadVideoResponse>((resolve, reject) => {
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

                    fs.rmSync(file.path);

                    if (error) {
                        Logger.error(error, 'YoutubeService:upload');
                        reject(error);
                        throw new InternalServerErrorException(error)
                    }

                    const code = data.data.id;

                    const urlVideo = `https://www.youtube.com/watch?v=${code}`;
                    Logger.log(`url video: ${urlVideo}`, 'YoutubeService:upload');
                    resolve({ code, urlVideo });
                }
            );
        });
    }
}
