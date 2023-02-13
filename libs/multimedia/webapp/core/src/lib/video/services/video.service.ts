import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { Video } from '@kaad/multimedia/ng-common';
import { BaseService } from '@kaad/shared/webapp/core';

@Injectable({
    providedIn: 'root'
})
export class VideoService extends BaseService<Video> {

    constructor(protected override readonly config: ConfigService,
                protected override readonly http: HttpClient) {
        super(config, http);
        this.uri = 'video';
    }

    findByName(name: string) {
        const url = `${this.config.urlApi}/video/${name}`;
        const query = { findBy: 'name' };
        return this.http.get<Video>(url, { params: query });
    }

    findByCode(code: string) {
        const url = `${this.config.urlApi}/video/${code}`;
        const query = { findBy: 'code' };
        return this.http.get<Video>(url, { params: query });
    }
}
