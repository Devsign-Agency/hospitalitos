import {
    Body, Controller, Delete, Get, Param, Patch, Post, Query
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './interfaces/user.interface';
import { UserService } from './user.service';

@ApiTags('User')
@Controller('user')
export class UserController {

    constructor(private userService: UserService) { }

    @Get()
    public async getAll(): Promise<User[]> {
        return await this.userService.findAll();
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
