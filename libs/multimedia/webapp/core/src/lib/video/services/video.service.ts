import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';
import { CreateVideoDto, UpdateVideoDto, Video } from '@kaad/multimedia/ng-common';
import { Page } from '@kaad/shared/ng-common';

@Injectable({
    providedIn: 'root'
})
export class VideoService {
    constructor(private readonly config: ConfigService,
                private readonly http: HttpClient) { }

    findAll(page = 1, take = 10, criteria = '') {
        const url = `${this.config.urlApi}/video`;
        const params = {
            page,
            take,
            criteria
        }
        return this.http.get<Page<Video>>(url, { params });
    }

    findById(id: string) {
        const url = `${this.config.urlApi}/video/${id}`;
        return this.http.get<Video>(url);
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

    create(dto: CreateVideoDto) {
        const url = `${this.config.urlApi}/video`;
        return this.http.post<Video>(url, dto);
    }

    update(id: string, dto: UpdateVideoDto) {
        const url = `${this.config.urlApi}/video/${id}`;
        return this.http.patch<Video>(url, dto);
    }

    delete(id: string) {
        const url = `${this.config.urlApi}/video/${id}`;
        return this.http.delete<Video>(url);
    }
}
