import { CreateRoleDto, Role, UpdateRoleDto } from '@kaad/security/ng-common';
import { Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Order } from '@kaad/shared/ng-common';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';
import { RoleEntity } from './entities/role.entity';
import { RoleValidator } from './validators/role.validator';

@Injectable()
export class RoleService {

    constructor(@InjectRepository(RoleEntity) private readonly roleRepository: Repository<RoleEntity>,
                private readonly validator: RoleValidator) {
    }

    async findAll(pageOptions: PageOptions, criteria?: string): Promise<Page<Role>> {

        const queryBuilder = this.roleRepository.createQueryBuilder("role");

        queryBuilder
            .orderBy('role.name', Order.ASC)
            .skip(pageOptions.skip)
            .take(pageOptions.take);

        if (criteria) {
            queryBuilder
                .where('user.code like :criteria', { criteria: `%${criteria}%` })
                .orWhere('user.name like :criteria', { criteria: `%${criteria}%` });
        }

        const itemCount = await queryBuilder.getCount();
        const { entities } = await queryBuilder.getRawAndEntities();

        const pageMetaDto = new PageMeta({ itemCount, pageOptions });

        return new Page(entities, pageMetaDto);
    }

    async findById(id: string): Promise<Role> {
        let role: Role;

        if (await this.validator.validateRoleExistById(id)) {
            role = await this.roleRepository.findOneOrFail({ where: { id} });
        }

        return role;
    }

    async findByCode(code: string): Promise<Role> {
        let role: Role;

        if (await this.validator.validateRoleExistByCode(code)) {
            role = await this.roleRepository.findOneOrFail({ where: { code} });
        }

        return role;
    }

    async findByName(name: string): Promise<Role> {
        let role: Role;

        if (await this.validator.validateRoleExistByName(name)) {
            role = await this.roleRepository.findOneOrFail({ where: { name} });
        }

        return role;
    }

    async create(createRoleDto: CreateRoleDto): Promise<Role> {
        let role: Role;

        if (await this.validator.validateCreationRole(createRoleDto)) {
            role = await this.roleRepository.save(createRoleDto);
        }

        return role;
    }

    async bulkCreation(roles: string[]): Promise<string[]> {
        const preexistingRoles: Role[] = await this.roleRepository.find({ where: { code: In(roles) } });
        const rolesToAdd: string[] = roles.filter(role => !preexistingRoles.find(r => r.code === role));
        const newRoles: RoleEntity[] = rolesToAdd.map(role => {
            const r =new RoleEntity();
            r.code = role.toLowerCase();
            r.name = r.code.charAt(0).toUpperCase() + r.code.slice(1);
            return r;
        })

        if (newRoles && newRoles.length > 0) {
            await this.roleRepository.insert(newRoles);
        }

        return roles;
    }

    async update(id: string, updateRoleDto: UpdateRoleDto): Promise<Role> {
        let role: Role;

        if (await this.validator.validateUpdateRole(id, updateRoleDto)) {
            role = await this.findById(id);

            const { name, code } = updateRoleDto;
            if (name) {
                role.name = name;
            }

            if (code) {
                role.code = code;
            }

            role = await this.roleRepository.save(role);
        }
        return role;
    }

    async remove(id: string): Promise<Role> {
        let role: RoleEntity;

        if (await this.validator.validateRoleExistById(id)) {
            role = await this.findById(id);
            await this.roleRepository.remove(role);
        }

        return role;
    }
}
