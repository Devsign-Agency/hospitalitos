/* eslint-disable @typescript-eslint/no-unused-vars */
import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class AdminGuard implements CanActivate {

    constructor(private userService: UserService,
        private router: Router) { }

    canActivate(
        route: ActivatedRouteSnapshot,
        state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

        return new Promise<boolean | UrlTree>((resolve) => {
            this.userService.profile().subscribe({
                next: (userData: User) => {
                    if (userData.role?.includes('admin')) {
                        resolve(true);
                    } else {
                        resolve(this.router.parseUrl('/'));
                    }
                },
                error: () => {
                    resolve(this.router.parseUrl('/'));
                }
            })
        });
    }

}
