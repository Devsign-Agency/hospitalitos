import { Module } from '@nestjs/common';
import { YoutubeController } from './youtube/youtube.controller';
import { YoutubeService } from './youtube/youtube.service';
import { AuthenticationController } from './authentication/authentication.controller';
import { AuthenticationService } from './authentication/authentication.service';
import { GoogleStrategy } from './authentication/strategies/google.strategy';

@Module({
    controllers: [YoutubeController, AuthenticationController],
    providers: [YoutubeService, AuthenticationService, GoogleStrategy],
    exports: [ AuthenticationService, GoogleStrategy, YoutubeService],
})
export class GcloudApiModule {}
