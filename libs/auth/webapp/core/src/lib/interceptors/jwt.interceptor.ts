import {
    HttpContextToken,
    HttpHandler,
    HttpInterceptor,
    HttpRequest,
    HTTP_INTERCEPTORS,
} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import {
    catchError,
    filter,
    from,
    of,
    reduce,
    switchMap,
    take,
    throwError,
} from 'rxjs';
import { AuthService } from '../services/auth.service';
import { TokenService } from '../services/token.service';

export const BYPASS_JWT_TOKEN: HttpContextToken<boolean> = new HttpContextToken(() => false);
export const BYPASS_CONTENT_TYPE: HttpContextToken<boolean> = new HttpContextToken(() => false);

@Injectable()
export class JwtInterceptor implements HttpInterceptor {
    constructor(
        private authService: AuthService,
        private config: ConfigService,
        private router: Router,
        private tokenService: TokenService
    ) {}

    private addToken(
        request: HttpRequest<{ [header: string]: string | string[] }>,
        token: string | null
    ): HttpRequest<{[header: string]: string | string[] }> {
        return request.clone({
            setHeaders: { Authorization: `Bearer ${token}` },
        });
    }

    intercept(request: HttpRequest<{ [header: string]: string | string[] }>, next: HttpHandler) {
        return of(this.tokenService.token).pipe(
            switchMap((token) => {
                // si el token es válido, agregamos el token al header del request
                if (!request.context.get(BYPASS_JWT_TOKEN) === true && token) {
                    request = this.addToken(request, token.toString());
                }

                if (!request.headers.has('Content-Type') && !request.context.get(BYPASS_CONTENT_TYPE) === true) {
                    request = request.clone({
                        headers: request.headers.set('Content-Type', 'application/json'),
                    });
                }

                request = request.clone({
                    headers: request.headers.set('Accept', 'application/json'),
                });

                return next.handle(request).pipe(
                    catchError((error) => {
                        if (error.status === 401 && error.url !==  `${this.config.urlApi}/${this.config.uriRenewToken}`) {
                            return from(this.tokenService.refreshTokenIsValid).pipe(
                                switchMap((refreshIsValid) => {
                                    if (refreshIsValid) {
                                        return this.handle401Error(request, next);
                                    } else {
                                        this.router.navigateByUrl(this.config.homePage);
                                        return throwError(() => error);
                                    }
                              })
                            );
                        } else {
                            return throwError(() => error);
                        }
                    })
                );
            })
        );
    }

    private handle401Error(request: HttpRequest<{ [header: string]: string | string[] }>, next: HttpHandler) {
        if (!this.tokenService.refreshTokenInProgress) {
            return this.authService.renewToken().pipe(
                switchMap(() =>
                    this.tokenService.token ? this.tokenService.token : ''
                ),
                reduce((acc: string, val: string) => acc + val),
                switchMap((token) => {
                    return next.handle(this.addToken(request, token));
                }),
                catchError(error => {
                    return throwError(() => error);
                })
            );
        } else {
            return this.tokenService.refreshTokenSubject.pipe(
                // reduce((acc: string, val: string) => acc + val),
                filter((token) => token !== null),
                take(1),
                switchMap((token) => next.handle(this.addToken(request, token))),
                catchError(error => throwError(() => error))
            );
        }
    }
}

export const KS_HTTP_INTERCEPTOR = {
    provide: HTTP_INTERCEPTORS,
    useClass: JwtInterceptor,
    multi: true,
};
