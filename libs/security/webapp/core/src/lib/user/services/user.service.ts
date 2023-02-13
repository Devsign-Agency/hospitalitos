import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { User } from '@kaad/security/ng-common';
import { BaseService } from '@kaad/shared/webapp/core';
import { catchError, throwError } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class UserService extends BaseService<User> {

    constructor(protected override readonly config: ConfigService,
                protected override readonly http: HttpClient) {
        super(config, http);
        this.uri = 'user';
    }

    findByUsername(username: string) {
        const url = `${this.config.urlApi}/user/${username}`;
        const query = { findBy: 'username' };
        return this.http.get<User>(url, { params: query });
    }

    findByEmail(email: string) {
        const url = `${this.config.urlApi}/user/${email}`;
        const query = { findBy: 'email' };
        return this.http.get<User>(url, { params: query });
    }

    profile() {
        const url = `${this.config.urlApi}/user/profile`;
        return this.http.get<User>(url).pipe(
            catchError(error => {
                console.error('Error: ', error);
                return throwError(() => error);
            })
        );
    }
}
