import { CreateGoogleUserDto, CreateUserDto, User } from '@kaad/security/ng-common';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserEntity } from './entities/user.entity';
import { UserValidator } from './validators/user.validator';

@Injectable()
export class UserService {
    constructor(@InjectRepository(UserEntity) private readonly userRepository: Repository<UserEntity>,
        private validator: UserValidator) { }

    public async findAll(): Promise<User[]> {
        return await this.userRepository.find();
    }

    public async findById(id: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistById(id)) {
            user = await this.userRepository.findOneOrFail({ where: {id} });
        }

        return user;
    }

    public async findByUsername(username: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByUsername(username)) {
            user = await this.userRepository.findOneOrFail({
                where: { username }
            });
        }

        return user;
    }

    public async findByEmail(email: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByEmail(email)) {
            user = await this.userRepository.findOneOrFail({
                where: { email }
            });
        }

        return user;
    }

    public async findByUsernameOrEmail(value: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByUsernameOrEmail(value)) {
            user = await this.userRepository.findOneOrFail({
                where: [
                    { username: value },
                    { email: value }
                ]
            })
        }

        return user;
    }

    public async create(userData: CreateUserDto): Promise<User> {
        let user: User;
        if (await this.validator.validateCreationUser(userData)) {

            user = await this.userRepository.save(userData);
        }
        return user;
    }

    public async createWithGoogle(userData: CreateGoogleUserDto): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByEmail(userData.email)) {
            // asociar googleId a user
        } else if (await this.validator.validateCreationUser(userData)) {
            user = await this.userRepository.save(userData);
        }
        return user;
    }

    public async update(id: string, userData: User): Promise<User> {
        let user: User;

        if (await this.validator.validateUpdateUser(id, userData)) {
            user = await this.userRepository.findOne({ where: {id} });

            user.username = userData.username;
            user.emailVerified = (user.email !== userData.email) ? false : userData.emailVerified;
            user.email = userData.email;
            user.firstname = userData.firstname;
            user.lastname = userData.lastname;
            user.photoUrl = userData.photoUrl;

            user = await this.userRepository.save(user);
        }

        return user;
    }

    public async delete(id: string): Promise<User> {
        let user: User;
        await this.userRepository.findOne({ where: {id} });
        if (await this.validator.validateUserExistById(id)) {
            user = await this.userRepository.findOne({ where: {id} });
            await this.userRepository.remove(user);
        }

        return user;
    }
}
