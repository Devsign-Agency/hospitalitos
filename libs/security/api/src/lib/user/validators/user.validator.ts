import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository } from 'typeorm';
import { UserEntity } from '../entities/user.entity';
import { CreateGoogleUserDto, CreateUserDto, UpdateUserDto, User, UserDto } from '@kaad/security/ng-common';

@Injectable()
export class UserValidator {

    constructor(@InjectRepository(UserEntity) private readonly userRepository: Repository<UserEntity>) { }

    public async userExist(id: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({ where: {id} });
        return !!user;
    }

    public async googleIdExist(gId: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({ where: { googleId: gId } });
        return !!user;
    }

    public async usernameInUse(username: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({
            select: ['id'],
            where: { username }
        });
        return !!user;
    }

    public async emailInUse(email: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({
            select: ['id'],
            where: { email }
        });
        return !!user;
    }

    public async usernameOrEmailInUse(value: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({
            select: ['id'],
            where: [
                { username: value },
                { email: value }
            ]
        });
        return !!user;
    }

    public async usernameInUseAndNotMe(username: string, id: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({
            select: ['id'],
            where: {
                username,
                id: Not(id)
            }
        });
        return !!user;
    }

    public async emailInUseAndNotMe(email: string, id: string): Promise<boolean> {
        const user: Partial<User> | null = await this.userRepository.findOne({
            select: ['id'],
            where: {
                email,
                id: Not(id)
            }
        });
        return !!user;
    }

    public async validateUserExistById(id: string): Promise<boolean> {
        if (!(await this.userExist(id))) {
            throw new NotFoundException(`user with id "${id}" not found`);
        }

        return true;
    }

    public async validateUserExistByGoogleId(gId: string): Promise<boolean> {
        if (!(await this.googleIdExist(gId))) {
            throw new NotFoundException(`user with googleId "${gId}" not found`);
        }
        return true;
    }

    public async validateUserExistByUsername(username: string): Promise<boolean> {
        if (!(await this.usernameInUse(username))) {
            throw new NotFoundException(`user with username "${username}" not found`);
        }

        return true;
    }

    public async validateUserExistByEmail(email: string): Promise<boolean> {
        if (!(await this.emailInUse(email))) {
            throw new NotFoundException(`user with email "${email}" not found`);
        }

        return true;
    }

    public async validateUserExistByUsernameOrEmail(value: string): Promise<boolean> {
        if (!(await this.usernameOrEmailInUse(value))) {
            throw new NotFoundException(`user with username or email "${value}" not found`);
        }

        return true;
    }

    public async validateRequiredAndPassword(user: Partial<CreateUserDto>, password: string): Promise<boolean> {

        if (!password) {
            throw new BadRequestException("password must not be empty");
        }

        return await this.validateRequired(user);
    }

    public async validateRequired(user: Partial<UserDto>): Promise<boolean> {
        if (!user.username) {
            throw new BadRequestException("username must not be empty");
        }

        if (!user.email) {
            throw new BadRequestException("email must not be empty");
        }

        return true;
    }

    public async validateCreationUser(user: CreateUserDto): Promise<boolean> {

        if (await this.usernameInUse(user.username)) {
            throw new BadRequestException("user with that username already exist");
        }

        if (await this.emailInUse(user.email)) {
            throw new BadRequestException("user with that email already exist");
        }

        return await this.validateRequired(user);
    }

    public async validateCreationUserWithGoogle(user: CreateGoogleUserDto): Promise<boolean> {

        if (await this.usernameInUse(user.username)) {
            throw new BadRequestException("user with that username already exist");
        }

        if (await this.emailInUse(user.email)) {
            throw new BadRequestException("user with that email already exist");
        }

        return await this.validateRequired(user);
    }

    public async validateUpdateUser(id:string, user: UpdateUserDto): Promise<boolean> {

        if (user.username && await this.usernameInUseAndNotMe(user.username, id)) {
            throw new BadRequestException("user with that username already exist");
        }

        if (user.email && await this.emailInUseAndNotMe(user.email, id)) {
            throw new BadRequestException("user with that email already exist");
        }

        return await this.validateUserExistById(id);
    }
}
