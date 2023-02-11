import { User } from '@kaad/security/ng-common';
import { DEFAULT_ADMIN_ROLE } from '@kaad/shared/ng-common';
import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Observable } from 'rxjs';

@Injectable()
export class AdminGuard implements CanActivate {
    constructor(private readonly config: ConfigService) {}

    canActivate(
        context: ExecutionContext
    ): boolean | Promise<boolean> | Observable<boolean> {
        const request = context.switchToHttp().getRequest();
        const user = request.user as User;
        const adminRole: string = this.config.get<string>('auth.adminRole') || DEFAULT_ADMIN_ROLE;
        return user?.role.includes(adminRole);
    }
}
