import { HttpClient, HttpContext } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BYPASS_CONTENT_TYPE } from '@kaad/auth/webapp/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { Audio } from '@kaad/multimedia/ng-common';
import { BaseService } from '@kaad/shared/webapp/core';

@Injectable({
    providedIn: 'root'
})
export class AudioService extends BaseService<Audio> {

    constructor(protected override readonly config: ConfigService,
                protected override readonly http: HttpClient) {
        super(config, http);
        this.uri = 'audio';
    }

    findByTitle(title: string) {
        const url = `${this.config.urlApi}/${this.uri}/${title}`;
        const query = { findBy: 'title' };
        return this.http.get<Audio>(url, { params: query });
    }

    override create(dto: FormData) {
        const options = {
            context: new HttpContext().set(BYPASS_CONTENT_TYPE, true)
        }

        return super.create(dto, options);
    }
}
