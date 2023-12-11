import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import { ConfigService } from '@kaad/config/webapp/core';
import { ForgotPassword, ResetPassword } from '@kaad/security/ng-common';

@Injectable({
    providedIn: 'root'
})
export class PasswordService {

    constructor(private readonly config: ConfigService,
                private readonly http: HttpClient,
                @Inject(DOCUMENT) private document: any) { }

    public forgot(dto: ForgotPassword) {
        const domain = this.document.location.origin;
        dto.urlCallback = `${domain}/${dto.urlCallback}`;
        const url = `${this.config.urlApi}/password/forgot-password`;
        return this.http.post<boolean>(url, dto);
    }

    public reset(dto: ResetPassword) {
        const url = `${this.config.urlApi}/password/reset-password`;
        return this.http.post<boolean>(url, dto);
    }
}
