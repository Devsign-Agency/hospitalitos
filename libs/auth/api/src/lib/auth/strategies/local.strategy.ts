import { User } from '@kaad/security/ng-common';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-local';
import { AuthValidator } from '../validators/auth.validator';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
    constructor(private validator: AuthValidator) {
        super();
    }

    public async validate(username: string, password: string): Promise<User> {
        const user: User = await this.validator.validateCredentials(username, password);
        if (!user) {
            throw new UnauthorizedException(null, "invalid credentials");
        }
        return user;
    }

}
