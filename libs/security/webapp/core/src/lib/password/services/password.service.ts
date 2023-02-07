import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { ForgotPassword, ResetPassword } from '@kaad/security/ng-common';

@Injectable({
    providedIn: 'root'
})
export class PasswordService {

    constructor(private readonly config: ConfigService,
                private readonly http: HttpClient) { }

    public forgot(dto: ForgotPassword) {
        const url = `${this.config.urlApi}/password/forgot-password`;
        return this.http.post<boolean>(url, dto);
    }

    public reset(dto: ResetPassword) {
        const url = `${this.config.urlApi}/password/reset-password`;
        return this.http.post<boolean>(url, dto);
    }
}
