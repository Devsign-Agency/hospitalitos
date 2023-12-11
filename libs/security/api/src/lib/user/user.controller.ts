import { JwtGuard } from '@kaad/core/api';
import { User } from '@kaad/security/ng-common';
import { Page, PageOptions, SearchOptions } from '@kaad/shared/api';
import {
    Body, Controller, Delete, Get, Param, Patch, Post, Query, Req, UseGuards
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { PasswordService } from '../password/password.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UserService } from './user.service';

@ApiTags('User')
@Controller('user')
// @UseGuards(JwtGuard)
export class UserController {

    constructor(private readonly passwordService: PasswordService,
                private readonly userService: UserService) { }

    @Get()
    public async getAll(
            @Query() { criteria, ...pageOptions}: SearchOptions): Promise<Page<User>> {
        return await this.userService.findAll(new PageOptions(pageOptions), criteria);
    }

    @Get('profile')
    public async findProfile(@Req() req) {
        return await this.userService.findById(req.user.id);
    }

    @Get(':criteria')
    public async findOne(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<User> {
        if (findBy === 'username') {
            return await this.userService.findByUsername(criteria);
        } else if (findBy === 'email') {
            return await this.userService.findByEmail(criteria);
        } else {
            return await this.userService.findById(criteria);
        }
    }

    @Post()
    public async create(@Body() userData: CreateUserDto): Promise<User> {
        const { password, ...user } = userData;
        const newUser = await this.userService.create(user);

        if (password) {
            await this.passwordService.addNewPassword(newUser, password);
        }

        return newUser;
    }

    @Patch(':id')
    public async update(@Param('id') id: string, @Body() user: UpdateUserDto): Promise<User> {
        return this.userService.update(id, user);
    }

    @Delete(':id')
    public async delete(@Param('id') id: string): Promise<User> {
        return await this.userService.delete(id);
    }
}
