import { Component, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { DataTableType, LoadingService } from "@kaad/layout/webapp/ui";
import { PageMeta } from "@kaad/shared/ng-common";
import { BaseService } from "@kaad/shared/webapp/core";
import { catchError, map, Observable, tap, throwError } from "rxjs";

@Component({
    selector: 'kaad-base-list',
    template: ''
})
export class AbstractListComponent<T> implements OnInit {

    itemList$?: Observable<T[]>;

    page = 1;
    pageSize = 10;
    listCount = 0;
    criteria = '';

    selectedIds: string[] = [];

    conf: DataTableType<T> = {
        columns: [
        ],
        actions: [
        ]
    }

    constructor(protected readonly activatedRoute: ActivatedRoute,
        protected readonly loading: LoadingService,
        protected readonly router: Router,
        protected readonly service: BaseService<T>) { }

    ngOnInit() {
        this.search();
    }

    search = () => {
        this.loading.show();
        this.itemList$ = this.service.findAll(this.page, this.pageSize, this.criteria).pipe(
            tap(page => this.updatePageInfo(page.meta)),
            map(page => page.data),
            tap(() => this.loading.hide()),
            catchError((error) => {
                this.loading.hide();
                return throwError(() => error);
            })
        );
    }

    updatePageInfo = (pageInfo: PageMeta) => {
        this.page = +pageInfo.page;
        this.pageSize = +pageInfo.take;
        this.listCount = +pageInfo.itemCount;
    }

    searchCriteria = (value: string) => {
        this.criteria = value;
        this.search();
    }

    gotoPage(page = 1) {
        this.page = page;
        this.search();
    }

    delete(id: string) {
        this.service.delete(id).subscribe({
            next: () => this.search()
        });
    }

    detail(id: string) {
        this.router.navigate([id], { relativeTo: this.activatedRoute });
    }

    edit(id: string) {
        this.router.navigate([id, 'edit'], { relativeTo: this.activatedRoute });
    }
}
