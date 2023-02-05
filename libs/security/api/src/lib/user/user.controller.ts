import { JwtGuard } from '@kaad/core/api';
import { CreateUserDto, User } from '@kaad/security/ng-common';
import {
    Body, Controller, Delete, Get, Param, Patch, Post, Query, Req, UseGuards
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { UserService } from './user.service';

@ApiTags('User')
@Controller('user')
@UseGuards(JwtGuard)
export class UserController {

    constructor(private userService: UserService) { }

    @Get()
    public async getAll(): Promise<User[]> {
        return await this.userService.findAll();
    }

    @Get('profile')
    public async findProfile(@Req() req) {
        return await this.userService.findById(req.user.id);
    }

    @Get(':criteria')
    public async findById(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<User> {
        if (findBy === 'username') {
            return await this.userService.findByUsername(criteria);
        } else if (findBy === 'email') {
            return await this.userService.findByEmail(criteria);
        } else {
            return await this.userService.findById(criteria);
        }
    }

    @Post()
    public async create(@Body() user: CreateUserDto): Promise<User> {
        return await this.userService.create(user);
    }

    @Patch(':id')
    public async update(@Param('id') id: string, @Body() user: User): Promise<User> {
        return this.userService.update(id, user);
    }

    @Delete(':id')
    public async delete(@Param('id') id: string): Promise<User> {
        return await this.userService.delete(id);
    }
}
