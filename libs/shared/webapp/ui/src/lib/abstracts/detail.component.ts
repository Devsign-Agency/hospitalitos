import { Component, OnInit } from "@angular/core";
import { ActivatedRoute } from "@angular/router";
import { ConfigService } from "@kaad/config/webapp/core";
import { BaseService } from "@kaad/shared/webapp/core";
import { Observable } from "rxjs";

@Component({
    selector: 'kaad-base-detail',
    template: ''
})
export class AbstractDetailComponent<T> implements OnInit {

    item$?: Observable<T>;

    constructor(protected readonly activatedRoute: ActivatedRoute,
        protected readonly config: ConfigService,
        protected readonly service: BaseService<T>) { }

    ngOnInit() {
        const id = this.activatedRoute.snapshot.params['id'];
        if (id) {
            this.findItem(id);
        }
    }

    findItem(id: string) {
        this.item$ = this.service.findById(id);
    }
}
