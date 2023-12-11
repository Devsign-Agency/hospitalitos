import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JwtPayload } from '@kaad/auth/ng-common';
import { ConfigService } from '@kaad/config/webapp/core';
import jwt_decode from 'jwt-decode';
import { BehaviorSubject, forkJoin, from, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TokenService {
    private renewingToken = false;
    private refreshToken$: BehaviorSubject<string | null> = new BehaviorSubject<string | null>( null );
    public refreshTokenSubject: Observable<string | null> = this.refreshToken$.asObservable();

    constructor(private config: ConfigService, private http: HttpClient) {}

    set token(jwtToken: string | null) {
        if (jwtToken) {
            localStorage.setItem(this.config.tokenHeaderName, jwtToken);

            // si estamos refrescando el token, avisamos a los observadores que estén a la espera
            if (this.refreshTokenInProgress) {
                this.refreshToken$.next(jwtToken);
            }
        }
    }
    get token(): string | null {
        return localStorage.getItem(this.config.tokenHeaderName);
    }

    set refreshToken(jwtToken: string | null) {
        if (jwtToken) {
            localStorage.setItem(this.config.refreshTokenHeaderName, jwtToken);
        }
    }
    get refreshToken(): string | null {
        return localStorage.getItem(this.config.refreshTokenHeaderName);
    }

    /**
     * verifica que el access token exista y que no haya expirado
     */
    get tokenIsValid(): Promise<boolean> {
        return new Promise((resolve) => {
            resolve(!!this.token && !!this.refreshToken);
        });
    }

    /**
     * verifica que hay access token
     */
    get hasToken(): boolean {
        return !!this.token || !!this.refreshToken;
    }

    /**
     * verifica que el refresh token exista
     */
    get refreshTokenIsValid(): Promise<boolean> {
        return new Promise<boolean>((resolve) => {
            if (this.refreshToken) {
                const url = `${this.config.urlApi}/${this.config.uriRenewToken}/validate`;
                const body: { [key: string] : string } = {};
                body[this.config.refreshTokenHeaderName] = this.refreshToken;
                this.http.post<boolean>(url, body).subscribe({
                    next: (value) => {
                        if (!value) { this.deleteAllToken(); }
                        resolve(!!this.refreshToken);
                    },
                    error: () => {
                        this.deleteAllToken();
                        resolve(false);
                    }
                });
            } else {
                resolve(false);
            }
        });
    }

    /**
     * verifica que el tiempo restante de vida del access token sea mayor a cero
     */
    get tokenHasExpired(): Promise<boolean> {
        return new Promise<boolean>((resolve) => {
            forkJoin([from(this.tokenTimeRemaining)]).subscribe(
                ([tokenTimeRemaining]) => {
                    resolve(!this.token || <number>tokenTimeRemaining <= 0);
                }
            );
        });
    }

    /**
     * setter y getter para el estado de refresh token in progress
     */
    get refreshTokenInProgress() {
        return this.renewingToken;
    }
    set refreshTokenInProgress(value: boolean) {
        this.refreshToken$.next(null);
        this.renewingToken = value;
    }

    /**
     * retorna el tiempo restante de vida del access token
     */
    get tokenTimeRemaining() {
        return new Promise((resolve) => {
            let time = 0;
            if (this.token) {
                const jwtToken: JwtPayload = jwt_decode(this.token);
                const now = new Date().getTime() / 1000;
                time = jwtToken.exp - now;
            }
            resolve(time);
        });
    }

    /**
     * elimina el access token del storage
     */
    public deleteToken() {
        if (localStorage.getItem(this.config.tokenHeaderName)) {
            localStorage.removeItem(this.config.tokenHeaderName);
        }
    }

    /**
     * elimina el refresh token del storage
     */
    public deleteRefreshToken() {
        if (localStorage.getItem(this.config.refreshTokenHeaderName)) {
            localStorage.removeItem(this.config.refreshTokenHeaderName);
        }
    }

    /**
     * elimina todos los token, tanto el access token como el refresh token
     */
    public deleteAllToken() {
        this.deleteToken();
        this.deleteRefreshToken();
    }
}
