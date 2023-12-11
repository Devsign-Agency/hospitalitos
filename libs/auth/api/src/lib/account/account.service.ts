import { UserService } from '@kaad/security/api';
import { UpdateUserDto } from '@kaad/security/ng-common';
import { BadRequestException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { randomUUID } from 'crypto';
import { differenceInHours } from 'date-fns';
import { Repository } from 'typeorm';
import { AccountEntity } from './entities/account.entity';

@Injectable()
export class AccountService {
    constructor(
        @InjectRepository(AccountEntity) private readonly accountRepository: Repository<AccountEntity>,
        private readonly config: ConfigService,
        private readonly userService: UserService) {}

    async register(userId: string) {
        const account: AccountEntity = new AccountEntity();
        account.user = userId;
        account.verificationCode = randomUUID();
        account.createdAt = new Date();
        return await this.accountRepository.save(account);
    }

    async verifyEmail(verificationCode: string) {
        const today = new Date();
        const account = await this.accountRepository.findOne({ where: { verificationCode } });
        const validationLink = this.config.get<number>('validationLink');
        if (!!account && !account.verifiedAt && differenceInHours(today, account.createdAt) < validationLink) {
            account.verifiedAt = today;
            const user = await this.userService.findById(account.user);
            const preferences = user.preferences ? user.preferences.map(p => p.id) : [];
            user.emailVerified = true;
            const toUpdate = { preferences, ...user };

            await this.userService.update(user.id, toUpdate as UpdateUserDto);
            return this.accountRepository.save(account);
        } else if (!!account && account.verifiedAt) {
            throw new BadRequestException('link used');
        } else if (!!account && !account.verifiedAt) {
            await this.accountRepository.delete(account);
            throw new BadRequestException('link expired');
        } else {
            throw new BadRequestException('invalid link');
        }
    }

    unregister() {
        //
    }
}

