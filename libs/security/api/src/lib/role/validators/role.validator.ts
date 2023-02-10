import { CreateRoleDto, Role, UpdateRoleDto } from '@kaad/security/ng-common';
import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository } from 'typeorm';
import { RoleEntity } from '../entities/role.entity';

@Injectable()
export class RoleValidator {

    constructor(@InjectRepository(RoleEntity) private readonly roleRepository: Repository<RoleEntity>) { }

    public async roleExist(id: string): Promise<boolean> {
        const role: Partial<Role> | null = await this.roleRepository.findOne({ where: { id } });
        return !!role;
    }

    public async nameInUse(name: string): Promise<boolean> {
        const role: Partial<Role> | null = await this.roleRepository.findOne({
            select: ['id'],
            where: { name }
        });
        return !!role;
    }

    public async codeInUse(code: string): Promise<boolean> {
        const role: Partial<Role> | null = await this.roleRepository.findOne({
            select: ['id'],
            where: { code }
        });
        return !!role;
    }

    public async codeInUseAndNotMe(code: string, id: string): Promise<boolean> {
        const role: Partial<Role> | null = await this.roleRepository.findOne({
            select: ['id'],
            where: {
                code,
                id: Not(id)
            }
        });
        return !!role;
    }

    public async nameInUseAndNotMe(name: string, id: string): Promise<boolean> {
        const role: Partial<Role> | null = await this.roleRepository.findOne({
            select: ['id'],
            where: {
                name,
                id: Not(id)
            }
        });
        return !!role;
    }

    public async validateRoleExistById(id: string): Promise<boolean> {
        if (!(await this.roleExist(id))) {
            throw new NotFoundException(`role with id "${id}" not found`);
        }

        return true;
    }

    public async validateRoleExistByName(name: string): Promise<boolean> {
        if (!(await this.nameInUse(name))) {
            throw new NotFoundException(`role with name "${name}" not found`);
        }

        return true;
    }

    public async validateRoleExistByCode(code: string): Promise<boolean> {
        if (!(await this.codeInUse(code))) {
            throw new NotFoundException(`role with code "${code}" not found`);
        }

        return true;
    }

    public async validateRequired(role: Partial<CreateRoleDto>): Promise<boolean> {
        if (!role.name) {
            throw new BadRequestException("name must not be empty");
        }

        if (!role.code) {
            throw new BadRequestException("code must not be empty");
        }

        return true;
    }

    public async validateCreationRole(role: CreateRoleDto): Promise<boolean> {

        if (await this.nameInUse(role.name)) {
            throw new BadRequestException("role with that name already exist");
        }

        if (await this.codeInUse(role.code)) {
            throw new BadRequestException("role with that code already exist");
        }

        return await this.validateRequired(role);
    }

    public async validateUpdateRole(id: string, role: UpdateRoleDto): Promise<boolean> {
        if (await this.codeInUseAndNotMe(role.code, id)) {
            throw new BadRequestException('role with that code already exist');
        }

        if (await this.nameInUseAndNotMe(role.name, id)) {
            throw new BadRequestException('role with that name already exist');
        }

        return await this.validateRoleExistById(id);
    }
}
