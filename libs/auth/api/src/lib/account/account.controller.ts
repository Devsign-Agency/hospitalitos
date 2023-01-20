import { Controller, Get, Param } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AccountService } from './account.service';

@ApiTags('Accounts')
@Controller('account')
export class AccountController {
    constructor(private readonly accountService: AccountService) { }

    @Get(':code')
    public async verifyEmail(@Param('code') code: string) {
        return await this.accountService.verifyEmail(code);
    }
}
