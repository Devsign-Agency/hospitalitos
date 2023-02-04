import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivateChild, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

@Injectable({
    providedIn: 'root'
})
export class AuthChildGuard implements CanActivateChild {

    constructor(private authService: AuthService,
        private config: ConfigService,
        private router: Router) { }

    canActivateChild(
        childRoute: ActivatedRouteSnapshot,
        state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

            return new Promise<boolean | UrlTree>((resolve) => {
                this.authService.isLoggedIn.then(isLoggedIn => {
                    if (isLoggedIn) {
                        resolve(true);
                    } else {
                        resolve(this.router.parseUrl(this.config.loginPage));
                    }
                }).catch(() => {
                    resolve(this.router.parseUrl(this.config.loginPage));
                })
            });
    }

}
