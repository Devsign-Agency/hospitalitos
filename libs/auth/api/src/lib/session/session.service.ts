import { User, UserService } from '@kaad/security/api';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { compare, hash } from 'bcrypt';
import * as crypto from 'crypto';
import { addSeconds } from 'date-fns';
import { Repository } from 'typeorm';
import { SessionEntity } from './entities/session.entity';
import { Session } from './interfaces/session.interface';

@Injectable()
export class SessionService {

    constructor(
        @InjectRepository(SessionEntity) private readonly sessionRepository: Repository<SessionEntity>,
        private configService: ConfigService,
        private userService: UserService) { }

    public async findByUserId(userId: string): Promise<Session> {
        return await this.sessionRepository.findOne({
            where: { user: userId }
        });
    }

    public async findByUsername(username: string): Promise<Session> {
        const user: User = await this.userService.findByUsername(username);
        return await this.findByUserId(user.id);
    }

    public async validateRefreshToken(userId: string, refreshToken: string): Promise<boolean> {
        const session: Session = await this.findByUserId(userId);

        const hashed: string = crypto.createHmac('sha256', refreshToken).digest('hex');
        return await compare(hashed, session.refreshToken);
    }

    public async create(userId: string, refreshToken: string, ip: string): Promise<Session> {
        let session: Session = await this.findByUserId(userId);
        if (!session) {
            session = new SessionEntity();
        }

        const hashed = crypto.createHmac('sha256', refreshToken).digest('hex');
        session.refreshToken = await hash(hashed, 10);
        session.user = userId;
        session.ip = ip;
        session.expiresAt = addSeconds(new Date(), this.configService.get<number>('JWT_REFRESH_TOKEN_EXPIRATION_TIME'));

        return await this.sessionRepository.save(session);
    }

    public async delete(userId: string): Promise<boolean> {
        const session: Session = await this.findByUserId(userId);

        if (!session) {
            return false;
        }

        await this.sessionRepository.remove(session);
        return true;
    }
}
