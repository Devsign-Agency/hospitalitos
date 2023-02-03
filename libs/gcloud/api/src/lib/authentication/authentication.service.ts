import { BadRequestException, Injectable, Logger, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Credentials, OAuth2Client, TokenInfo } from 'google-auth-library';
import { google, oauth2_v2 } from 'googleapis';
import { BaseService } from '../common/base.service';

const SCOPES = ['email', 'profile'];

@Injectable()
export class AuthenticationService extends BaseService {
    constructor(readonly config: ConfigService) {
        super(config, SCOPES);
        this.URI_INDEX = 2;
    }

    async getGoogleToken(code: string): Promise<Credentials> {

        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        try {
            const token = await new Promise((resolve, reject) => {
                oauth2Client.getToken(code, (err, token) => {
                    if (err) {
                        const error = err['data']?.error || err.message || err['statusText'];
                        Logger.error(`Error while trying to retrieve access token: ${error}`, 'AuthenticationService::signinWithGoogle');
                        reject(err['data']?.error || err.message || err['statusText']);
                    } else {
                        Logger.log(token, 'AuthenticationService::signinWithGoogle');
                        oauth2Client.credentials = token;
                        resolve(token);
                    }
                });
            });
            return token;

        } catch (error) {
            throw new BadRequestException(error);
        }
    }

    async getTokenInfo(credentials: Credentials): Promise<TokenInfo> {
        try {
            const oauth2Client: OAuth2Client = await this.getOauth2Client();
            oauth2Client.setCredentials(credentials);
            return await oauth2Client.getTokenInfo(credentials.access_token);
        } catch (error) {
            throw new BadRequestException(error);
        }
    }

    async getUserInfo(credentials: Credentials): Promise<oauth2_v2.Schema$Userinfo> {
        try {
            const userInfoClient = google.oauth2('v2').userinfo;

            const oauth2Client: OAuth2Client = await this.getOauth2Client();
            oauth2Client.setCredentials(credentials);

            const userInfoResponse = await userInfoClient.get({
                auth: oauth2Client
            });

            return userInfoResponse.data;
        } catch (error) {
            throw new BadRequestException(error);
        }
    }
}
