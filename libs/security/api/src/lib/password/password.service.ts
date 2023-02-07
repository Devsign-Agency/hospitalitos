import { MailSenderService, SendMailerDto } from '@kaad/mailer/api';
import { CreatePasswordDto, ForgotPassword, Password, ResetPassword, User } from '@kaad/security/ng-common';
import { BadRequestException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { InjectRepository } from '@nestjs/typeorm';
import { hash } from 'bcrypt';
import { randomUUID } from 'crypto';
import { differenceInHours } from 'date-fns';
import { Repository } from 'typeorm';
import { UserService } from '../user/user.service';
import { PasswordResetEntity } from './entities/password-reset.entity';
import { PasswordEntity } from './entities/password.entity';

@Injectable()
export class PasswordService {
    constructor(
        @InjectRepository(PasswordEntity) private readonly passwordRepository: Repository<PasswordEntity>,
        @InjectRepository(PasswordResetEntity) private readonly passwordResetRepository: Repository<PasswordResetEntity>,
        private readonly config: ConfigService,
        private readonly mailService: MailSenderService,
        private readonly userService: UserService) {}

    public async findByUserId(userId: string): Promise<Password> {
        return await this.passwordRepository.findOne({
            where: {
                user: { id: userId },
                isActive: true
            }
        });
    }

    public async findValueByUserId(userId: string): Promise<string> {
        const activePassword: Password = await this.findByUserId(userId);
        return activePassword ? activePassword.value : '';
    }

    public async disableActives(userId: string): Promise<void> {
        const activePassword: Password = await this.findByUserId(userId);
        if (activePassword) {
            activePassword.isActive = false;
            this.passwordRepository.save(activePassword);
        }
    }

    public async addNewPassword(user: User, password: string): Promise<Password> {
        await this.disableActives(user.id);

        const passwordDto: CreatePasswordDto = {
            user,
            value: await hash(password, 10)
        }
        return await this.passwordRepository.save(passwordDto);
    }

    public async forgotPassword({ email, urlCallback }: ForgotPassword): Promise<boolean> {
        const user: User = await this.userService.findByEmail(email);

        let passwordReset = await this.passwordResetRepository.findOne({ where: { userId: user.id }});
        if (!passwordReset) {
            passwordReset = new PasswordResetEntity();
        }
        passwordReset.code = randomUUID();
        passwordReset.createdAt = new Date();
        passwordReset.userId = user.id;

        await this.passwordResetRepository.save(passwordReset);

        const mailDto: SendMailerDto = {
            to: email,
            subject: 'Reset Password',
            context: {
                companyName: this.config.get('company.name'),
                companyUrl: this.config.get('company.url'),
                companyLogoUrl: this.config.get('company.logo'),
                recoverUrl: `${urlCallback}/${passwordReset.code}`,
            }
        };

        this.mailService.send(mailDto, './recover-password')

        return true;
    }

    public async resetPassword(resetPassword: ResetPassword) {
        const { validationCode, newPassword } = resetPassword;
        const forgotPassword: PasswordResetEntity = await this.passwordResetRepository.findOne({ where: { code: validationCode } });
        if (!forgotPassword) {
            throw new BadRequestException('invalid code');
        }

        const today = new Date();
        const diff = differenceInHours(today, forgotPassword.createdAt);
        const validationLink = this.config.get<number>('validationLink');
        if (diff > validationLink) {
            throw new BadRequestException('link expired')
        }

        const user: User = await this.userService.findById(forgotPassword.userId);
        await this.addNewPassword(user, newPassword);

        await this.passwordResetRepository.delete(forgotPassword);

        return true;
    }
}
