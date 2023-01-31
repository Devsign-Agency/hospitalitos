/* eslint-disable @typescript-eslint/no-unused-vars */
import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { UserService } from '../services/user.service';

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
                next: userData => {
                    if (userData.role?.toLocaleLowerCase() === 'administrator') {
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
