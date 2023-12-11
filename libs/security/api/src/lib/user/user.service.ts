import { CreateUserDto, UpdateUserDto, User } from '@kaad/security/ng-common';
import { Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Category } from '@kaad/commons/ng-common';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { oauth2_v2 } from 'googleapis';
import { Repository } from 'typeorm';
import { RoleService } from '../role/role.service';
import { UserEntity } from './entities/user.entity';
import { UserValidator } from './validators/user.validator';
import { CategoryService } from '@kaad/commons/api';

const INITIAL_ROLE = 'user';

@Injectable()
export class UserService {
    constructor(@InjectRepository(UserEntity) private readonly userRepository: Repository<UserEntity>,
        private readonly categoryService: CategoryService,
        private readonly roleService: RoleService,
        private readonly validator: UserValidator) { }

    public async findAll(pageOptions: PageOptions, criteria?: string): Promise<Page<User>> {

        const queryBuilder = this.userRepository.createQueryBuilder("user");

        queryBuilder
            .orderBy('user.createdAt', pageOptions.order)
            .skip(pageOptions.skip)
            .take(pageOptions.take);

        if (criteria) {
            queryBuilder
                .where('user.email like :criteria', { criteria: `%${criteria}%` })
                .orWhere('user.username like :criteria', { criteria: `%${criteria}%` })
                .orWhere('user.firstname like :criteria', { criteria: `%${criteria}%` })
                .orWhere('user.lastname like :criteria', { criteria: `%${criteria}%` })
        }

        const itemCount = await queryBuilder.getCount();
        const { entities } = await queryBuilder.getRawAndEntities();

        const pageMetaDto = new PageMeta({ itemCount, pageOptions });

        return new Page(entities, pageMetaDto);
    }

    public async findById(id: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistById(id)) {
            user = await this.userRepository.findOneOrFail({
                relations: { preferences: true },
                where: { id }
            });
        }

        return user;
    }

    public async findByGoogleId(gId: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByGoogleId(gId)) {
            user = await this.userRepository.findOneOrFail({
                relations: { preferences: true },
                where: { googleId: gId }
            })
        }

        return user;
    }

    public async findByUsername(username: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByUsername(username)) {
            user = await this.userRepository.findOneOrFail({
                relations: { preferences: true },
                where: { username }
            });
        }

        return user;
    }

    public async findByEmail(email: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByEmail(email)) {
            user = await this.userRepository.findOneOrFail({
                relations: { preferences: true },
                where: { email }
            });
        }

        return user;
    }

    public async findByUsernameOrEmail(value: string): Promise<User> {
        let user: User;

        if (await this.validator.validateUserExistByUsernameOrEmail(value)) {
            user = await this.userRepository.findOneOrFail({
                relations: { preferences: true },
                where: [
                    { username: value },
                    { email: value }
                ]
            })
        }

        return user;
    }

    public async create({preferences, ...userData}: CreateUserDto): Promise<User> {
        let user: User;
        if (await this.validator.validateCreationUser(userData)) {
            let categories: Category[] = [];
            if (preferences && preferences.length > 0) {
                categories = await this.categoryService.findAllIn(preferences);
            }
            const toAdd = { ...userData, preferences: categories, role: [ INITIAL_ROLE ] };
            user = await this.userRepository.save(toAdd);
        }
        return user;
    }

    public async registerWithGoogle(userData: oauth2_v2.Schema$Userinfo): Promise<User> {
        let user: User;

        if (await this.validator.emailInUse(userData.email)) {
            user = await this.findByEmail(userData.email);
            user.googleId = userData.id;
            user.photoUrl = userData.picture;
        } else {
            const dto: CreateUserDto = {
                firstname: userData.given_name,
                lastname: userData.family_name,
                email: userData.email,
                username: userData.email,
                photoUrl: userData.picture
            };
            user = await this.create(dto);
        }

        user.googleId = userData.id;
        user.emailVerified = userData.verified_email;
        return await this.userRepository.save(user);
    }

    public async update(id: string, userData: UpdateUserDto): Promise<User> {
        let user: User;

        if (await this.validator.validateUpdateUser(id, userData)) {
            user = await this.userRepository.findOne({ where: { id } });

            const { username, emailVerified, email, firstname, lastname, photoUrl, role } = userData;

            if (username) {
                user.username = username;
            }

            if (email) {
                if (emailVerified === true || emailVerified === false) {
                    user.emailVerified = (user.email !== userData.email) ? false : emailVerified;
                }
                user.email = email;
            }

            if (firstname) {
                user.firstname = firstname;
            }

            if (lastname) {
                user.lastname = lastname;
            }

            if (photoUrl) {
                user.photoUrl = photoUrl;
            }

            if (role) {
                user.role = await this.roleService.bulkCreation(role);
            }

            user = await this.userRepository.save(user);
        }

        return user;
    }

    public async delete(id: string): Promise<User> {
        let user: UserEntity;
        if (await this.validator.validateUserExistById(id)) {
            user = await this.userRepository.findOne({ where: { id } });
            await this.userRepository.remove(user);
        }

        return user;
    }
}
