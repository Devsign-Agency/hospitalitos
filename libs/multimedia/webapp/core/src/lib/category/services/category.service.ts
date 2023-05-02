import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { Category } from '@kaad/commons/ng-common';
import { BaseService } from '@kaad/shared/webapp/core';

@Injectable({
    providedIn: 'root'
})
export class CategoryService extends BaseService<Category> {

    constructor(protected override readonly config: ConfigService,
                protected override readonly http: HttpClient) {
        super(config, http);
        this.uri = 'category';
    }

    findByName(name: string) {
        const url = `${this.config.urlApi}/${this.uri}/${name}`;
        const query = { findBy: 'name' };
        return this.http.get<Category>(url, { params: query });
    }
}
