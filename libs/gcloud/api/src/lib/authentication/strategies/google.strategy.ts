import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { Profile, Strategy } from 'passport-google-oauth20';
import * as fs from 'fs';
import { GcloudCredentials } from '../../types/gcloud-credentials.type';

const SCOPES = ['email', 'profile'];

@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy, 'google') {
    constructor(readonly config: ConfigService) {
        super(GoogleStrategy.loadConfigvalues(config));
    }

    async validate(
        _accessToken: string,
        _refreshToken: string,
        profile: Profile,
    ) {
        const { id, name, emails } = profile;

        // Here a custom User object is returned. In the the repo I'm using a UsersService with repository pattern, learn more here: https://docs.nestjs.com/techniques/database
        return {
            provider: 'google',
            providerId: id,
            name: name.givenName,
            username: emails[0].value,
        };
    }

    static loadConfigvalues(config: ConfigService) {
        const TOKEN_DIR = `${config.get('gcloud.tokenDir')}`;
        const CREDENTIAL_PATH = `${TOKEN_DIR}/${config.get('gcloud.credentials')}`;
        const content: Buffer = fs.readFileSync(CREDENTIAL_PATH);
        const credentials: GcloudCredentials = JSON.parse(content.toString());

        const { client_secret, client_id, redirect_uris } = credentials.web;

        return {
            clientID: client_id,
            clientSecret: client_secret,
            callbackURL: redirect_uris[0],
            scope: SCOPES
        }
    }
}
