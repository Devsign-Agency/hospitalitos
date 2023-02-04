/* eslint-disable @typescript-eslint/no-unused-vars */
import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {

    constructor(private authService: AuthService,
        private config: ConfigService,
        private router: Router) { }

    canActivate(
        route: ActivatedRouteSnapshot,
        state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

        return new Promise<boolean | UrlTree>((resolve) => {
            this.authService.isLoggedIn.then(isLoggedIn => {
                if (isLoggedIn) {
                    resolve(true);
                } else {
                    this.authService.cleanSessionData();
                    resolve(this.router.parseUrl(this.config.loginPage));
                }
            }).catch(() => {
                this.authService.cleanSessionData();
                resolve(this.router.parseUrl(this.config.loginPage));
            })
        });
    }

}
