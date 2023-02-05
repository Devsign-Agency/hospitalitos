import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { CreateUserDto, UpdateUserDto, User } from '@kaad/security/ng-common';
import { catchError, throwError } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class UserService {

    constructor(private readonly config: ConfigService,
                private readonly http: HttpClient) { }

    findAll() {
        //
    }

    findById(id: string) {
        const url = `${this.config.urlApi}/user/${id}`;
        return this.http.get<User>(url);
    }

    findByUsername(username: string) {
        const url = `${this.config.urlApi}/user/${username}`;
        const query = { findBy: 'username' };
        return this.http.get<User>(url, { params: query });
    }

    findByEmail(email: string) {
        const url = `${this.config.urlApi}/user/${email}`;
        const query = { findBy: 'username' };
        return this.http.get<User>(url, { params: query });
    }

    create(dto: CreateUserDto) {
        const url = `${this.config.urlApi}/user`;
        return this.http.post<User>(url, dto);
    }

    update(id: string, dto: UpdateUserDto) {
        const url = `${this.config.urlApi}/user/${id}`;
        return this.http.patch<User>(url, dto);
    }

    delete(id: string) {
        const url = `${this.config.urlApi}/user/${id}`;
        return this.http.delete<User>(url);
    }

    profile() {
        const url = `${this.config.urlApi}/user/profile`;
        return this.http.get<User>(url).pipe(
            catchError(error => {
                console.error('Error: ', error);
                // return of(EmptyUser);
                return throwError(() => error);
            })
        );
    }
}
