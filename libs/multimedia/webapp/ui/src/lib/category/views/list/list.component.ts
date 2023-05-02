import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableType, LoadingService } from '@kaad/layout/webapp/ui';
import { Category } from '@kaad/commons/ng-common';
import { CategoryService } from '@kaad/multimedia/webapp/core';
import { AbstractListComponent } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent extends AbstractListComponent<Category> {
    override conf: DataTableType<Category> = {
        columns: [
            {
                title: 'Name',
                field:'name'
            }
        ],
        actions: [
            {
                label: 'Edit',
                iconUrl: '',
                actionIdToReturn: 'edit',
                showOption: () => true
            }
        ]
    };

    constructor(protected override readonly activatedRoute: ActivatedRoute,
                protected override readonly loading: LoadingService,
                protected override readonly router: Router,
                protected readonly categoryService: CategoryService) {
        super(activatedRoute, loading, router, categoryService);
    }
}
