import { HttpClient, HttpContext, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AuthResponse, Credentials, RefreshResponse, Register } from '@kaad/auth/ng-common';
import { ConfigService } from '@kaad/config/webapp/core';
import { ToastService } from '@kaad/layout/webapp/ui';
import { BehaviorSubject, catchError, Observable, tap, throwError } from 'rxjs';
import { BYPASS_JWT_TOKEN } from '../interceptors/jwt.interceptor';
import { TokenService } from './token.service';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    private loggedIn: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
    public loggedIn$: Observable<boolean> = this.loggedIn.asObservable();

    constructor(
        private config: ConfigService,
        private http: HttpClient,
        private router: Router,
        private tokenService: TokenService,
        private toastService: ToastService
    ) {
        this.isLoggedIn.then((value) => this.loggedIn.next(value));
    }

    /**
     * retorna el valor del estado para sesión iniciada.
     * para esto, se verifica si existe token y si este no ha expirado.
     */
    get isLoggedIn() {
        return this.tokenService.tokenIsValid;
    }

    /**
     * gestiona los errores de conexión ocurridos en las solicitudes de seguridad
     * @param error error.
     */
    private errorHandle = (error: HttpErrorResponse) => {
        if (error.status === 401) {
            this.tokenService.deleteAllToken();
            this.router.navigate([this.config.homePage]);
        }
        this.toastService.showDanger(error.error.message);
        return throwError(() => error);
    }

    private hasError(response: AuthResponse) {
        return !response.accessToken;
    }

    /**
     * gestiona la respuesta a la solicitud de inicio de sesión.
     * @param response: la respuesta que llega del backend
     */
    private loginHandle(response: AuthResponse) {
        // si hay un error en el response
        if (this.hasError(response)) {
            // eliminamos la sesión activa, en caso de existir
            this.tokenService.deleteAllToken();
            this.loggedIn.next(false);
        } else {
            // si no hay error en el response

            // guardamos los datos de del token y el refresh token
            this.tokenService.token = response.accessToken;
            this.tokenService.refreshToken = response.refreshToken;
            this.loggedIn.next(true);
            this.router.navigateByUrl(this.config.homePage);
        }
    }

    /**
     * método para iniciar sesión
     * @param credentials: credenciales para inicio de sesión
     */
    public login(credentials: Credentials) {
        const { rememberMe, ...credential } = credentials;
        this.tokenService.deleteAllToken();
        const url = `${this.config.urlApi}/${this.config.uriLogin}`;
        const loginRequest = this.http
            .post<AuthResponse>(url, credential, {
                context: new HttpContext().set(BYPASS_JWT_TOKEN, true),
                withCredentials: rememberMe
            })
            .pipe(
                tap((response) => this.loginHandle(response)),
                catchError(this.errorHandle)
            );

        return loginRequest;
    }

    public cleanSessionData = () => {
        this.tokenService.deleteAllToken();
        this.loggedIn.next(false);
    }

    /**
     * gestiona la respuesta a la solicitud de finalizar sesión
     */
    private logoutHandle = () => {
        this.cleanSessionData();
        this.router.navigate([this.config.homePage], { onSameUrlNavigation: 'reload' });
    };

    /**
     * gestiona los errores de conexión ocurridos en las solicitudes de seguridad
     * @param error error.
     */
    private logoutErrorHandle = (error: HttpErrorResponse) => {
        this.logoutHandle();
        return throwError(() => error);
    }

    /**
     * método que finaliza la sesión actual
     */
    public logout(method?: string, body?: { [key: string]: string }) {
        let logoutRequest: Observable<boolean>;
        const url = `${this.config.urlApi}/${this.config.uriLogout}`;
        const options = {
            headers: new HttpHeaders()
                .set('Content-Type', 'application/json')
        };
        const httpMethod = !method ? 'delete' : method.toLocaleLowerCase();

        switch (httpMethod) {
            case 'post':
                // asignamos valor a body en caso de ser nulo
                if (!body) {
                    body = {};
                }
                logoutRequest = this.http.post<boolean>(url, body, options);
                break;
            case 'delete':
                logoutRequest = this.http.delete<boolean>(url, options);
                break;
            case 'get':
            default:
                logoutRequest = this.http.get<boolean>(url, options);
                break;
        }

        return logoutRequest.pipe(
            tap(this.logoutHandle),
            catchError(this.logoutErrorHandle)
        );
    }

    private handleRenewToken(refreshResponse: RefreshResponse) {
        // si data es nulo, eliminamos los token
        if (!refreshResponse || !refreshResponse.accessToken) {
            this.tokenService.deleteAllToken();
            this.loggedIn.next(false);
        } else {
            this.tokenService.token = refreshResponse.accessToken;
            if (refreshResponse.refreshToken) {
                this.tokenService.refreshToken = refreshResponse.refreshToken;
            }
        }
        this.tokenService.refreshTokenInProgress = false;
    }

    public renewToken() {
        // renovamos el token utilizando el refresh token
        this.tokenService.refreshTokenInProgress = true;

        const url = `${this.config.urlApi}/${this.config.uriRenewToken}`;
        const body = {
            access_token: '',
            expires_in: 360,
            token_type: 'Bearer',
            refresh_token: this.tokenService.refreshToken,
        };

        return this.http
            .post<RefreshResponse>(url, body, {
                context: new HttpContext().set(BYPASS_JWT_TOKEN, true),
            })
            .pipe(
                tap((response) => {
                    this.handleRenewToken(response);
                }),
                catchError((error) => {
                    this.tokenService.refreshTokenInProgress = false;
                    return this.errorHandle(error);
                })
            );
    }

    public register(register: Register) {
        const url = `${this.config.urlApi}/${this.config.uriRegister}`;
        return this.http
            .post<AuthResponse>(url, register, {
                context: new HttpContext().set(BYPASS_JWT_TOKEN, true),
            })
            .pipe(
                tap((response) => this.loginHandle(response)),
                catchError(this.errorHandle)
            );
    }

    public validateSession() {
        this.loggedIn.next(this.tokenService.hasToken);
    }

    public getGoogleUrlLogin() {
        const url = `${this.config.urlApi}/gAuth`;
        const loginRequest = this.http
            .get<{ authUrl: string}>(url, {
                context: new HttpContext().set(BYPASS_JWT_TOKEN, true)
            });

        return loginRequest;
    }

    public googleLogin(code: string) {
        this.tokenService.deleteAllToken();
        const url = `${this.config.urlApi}/${this.config.uriLogin}/signinWithGoogle`;
        const params = { code }
        const loginRequest = this.http
            .post<AuthResponse>(url, params, {
                context: new HttpContext().set(BYPASS_JWT_TOKEN, true)
            })
            .pipe(
                tap((response) => this.loginHandle(response)),
                catchError(this.errorHandle)
            );

        return loginRequest;
    }
}
