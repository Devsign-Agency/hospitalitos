import { UserService } from '@kaad/security/api';
import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { randomUUID } from 'crypto';
import { differenceInHours } from 'date-fns';
import { Repository } from 'typeorm';
import { AccountEntity } from './entities/account.entity';

@Injectable()
export class AccountService {
    constructor(
        @InjectRepository(AccountEntity) private readonly accountRepository: Repository<AccountEntity>,
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
        if (!!account && !account.verifiedAt && differenceInHours(today, account.createdAt) < 24) {
            account.verifiedAt = today;
            const user = await this.userService.findById(account.user);
            user.emailVerified = true;
            await this.userService.update(user.id, user);
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
