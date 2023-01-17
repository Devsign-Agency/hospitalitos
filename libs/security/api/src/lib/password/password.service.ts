import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { hash } from 'bcrypt';
import { Repository } from 'typeorm';
import { User } from '../user/interfaces/user.interface';
import { CreatePasswordDto } from './dto/create-password.dto';
import { UpdatePasswordDto } from './dto/update-password.dto';
import { PasswordEntity } from './entities/password.entity';
import { Password } from './interfaces/password.interface';

@Injectable()
export class PasswordService {
    constructor(@InjectRepository(PasswordEntity) private readonly passwordRepository: Repository<PasswordEntity>) {}

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
}
