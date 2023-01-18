import { PasswordService, User, UserService } from '@kaad/security/api';
import { Injectable } from '@nestjs/common';
import { compare } from 'bcrypt';
import { SessionService } from '../../session/session.service';

@Injectable()
export class AuthValidator {

    constructor(private passwordService: PasswordService,
        private sessionService: SessionService,
        private userService: UserService) { }

    public async validateCredentials(username: string, password: string): Promise<User> {
        try {
            // buscar usuario por username o email
            const user: User = await this.userService.findByUsernameOrEmail(username);

            // validar contraseña
            const activePassword: string = await this.passwordService.findValueByUserId(user.id);
            const match: boolean = await compare(password, activePassword);
            if (!match) {
                return null
            }

            return user;

        } catch (exception) {
            return null;
        }
    }

    public async validateRefreshToken(userId: string, refreshToken: string): Promise<User> {
        if (await this.sessionService.validateRefreshToken(userId, refreshToken)) {
            return await this.userService.findById(userId);
        }

        return null;
    }
}
