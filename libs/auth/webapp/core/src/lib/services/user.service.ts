import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { User } from '@kaad/security/ng-common';
import { catchError, throwError } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class UserService {

    constructor(private config: ConfigService, private http: HttpClient) { }

    profile() {
        const url = `${this.config.urlApi}/profile`;
        return this.http.get<User>(url).pipe(
            catchError(error => {
                console.error('Error: ', error);
                // return of(EmptyUser);
                return throwError(() => error);
            })
        );
    }
}
