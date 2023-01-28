import { BadRequestException, Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { OAuth2Client } from 'google-auth-library';
import { BaseService } from '../common/base.service';

const SCOPES = ['email', 'profile'];

@Injectable()
export class AuthenticationService extends BaseService {
    constructor(readonly config: ConfigService) {
        Logger.log('por acá', 'AuthenticationService::constructor');
        super(config, SCOPES);
        this.URI_INDEX = 2;
    }

    async signInWithGoogle(code: string) {

        const oauth2Client: OAuth2Client = await this.getOauth2Client();

        try {
            const token = await new Promise((resolve, reject) => {
                oauth2Client.getToken(code, (err, token) => {
                    if (err) {
                        const error = err['data']?.error || err.message || err['statusText'];
                        Logger.error(`Error while trying to retrieve access token: ${error}`, 'AuthenticationService::signinWithGoogle');
                        reject(err['data']?.error || err.message || err['statusText']);
                    } else {
                        Logger.log(token);
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
}
