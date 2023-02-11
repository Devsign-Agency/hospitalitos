import { Role } from '@kaad/security/ng-common';
import { Page, PageOptions, SearchOptions } from '@kaad/shared/api';
import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    Query,
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { CreateRoleDto } from './dto/create-role.dto';
import { UpdateRoleDto } from './dto/update-role.dto';
import { RoleService } from './role.service';

@ApiTags('Role')
@Controller('rol')
export class RoleController {
    constructor(private readonly rolService: RoleService) {}

    @Get()
    async findAll(
        @Query() { criteria, ...pageOptions }: SearchOptions): Promise<Page<Role>> {
        return await this.rolService.findAll(new PageOptions(pageOptions), criteria);
    }

    @Get(':criteria')
    async findOne(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<Role> {
        if (findBy === 'name') {
            return await this.rolService.findByName(criteria);
        } else if (findBy === 'code') {
            return await this.rolService.findByCode(criteria);
        } else {
            return await this.rolService.findById(criteria);
        }
    }

    @Post()
    async create(@Body() createRolDto: CreateRoleDto): Promise<Role> {
        return await this.rolService.create(createRolDto);
    }

    @Patch(':id')
    async update(@Param('id') id: string, @Body() updateRolDto: UpdateRoleDto): Promise<Role> {
        return await this.rolService.update(id, updateRolDto);
    }

    @Delete(':id')
    async remove(@Param('id') id: string): Promise<Role> {
        return await this.rolService.remove(id);
    }
}
