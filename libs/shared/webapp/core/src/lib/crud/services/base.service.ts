import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { Page } from '@kaad/shared/ng-common';
import { Serviceable } from '../interfaces/serviceable.interface';

@Injectable({
    providedIn: 'root'
})
export class BaseService<T> implements Serviceable<T> {

    protected uri: string;

    constructor(protected readonly config: ConfigService,
                protected readonly http: HttpClient) { }

    findAll(page = 1, take = 10, criteria = '') {
        const url = `${this.config.urlApi}/${this.uri}`;
        const params = {
            page,
            take,
            criteria
        }
        return this.http.get<Page<T>>(url, { params });
    }

    findById(id: string) {
        const url = `${this.config.urlApi}/${this.uri}/${id}`;
        return this.http.get<T>(url);
    }

    create(dto: unknown) {
        const url = `${this.config.urlApi}/${this.uri}`;
        return this.http.post<T>(url, dto);
    }

    update(id: string, dto: unknown) {
        const url = `${this.config.urlApi}/${this.uri}/${id}`;
        return this.http.patch<T>(url, dto);
    }

    delete(id: string) {
        const url = `${this.config.urlApi}/${this.uri}/${id}`;
        return this.http.delete<T>(url);
    }
}
