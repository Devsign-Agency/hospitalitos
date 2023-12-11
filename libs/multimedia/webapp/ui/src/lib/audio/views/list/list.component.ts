import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableType, LoadingService } from '@kaad/layout/webapp/ui';
import { Audio } from '@kaad/multimedia/ng-common';
import { AudioService } from '@kaad/multimedia/webapp/core';
import { AbstractListComponent } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent extends AbstractListComponent<Audio> {

    override conf: DataTableType<Audio> = {
        columns: [
            {
                title: 'Title',
                field: 'title',
                css: 'w-32 max-w-32 overflow-x-hidden',
                wrapperCss: 'w-36 max-w-36'
            },
            {
                title: 'File',
                field: 'code',
                templateId: 'code'
            },
            {
                title: 'Tags',
                field: 'tags',
                templateId: 'tags',
                css: 'w-32 max-w-32 overflow-x-auto',
                wrapperCss: 'w-36 max-w-36'
            },
            {
                title: 'Categories',
                field: 'categories',
                templateId: 'categories',
                css: 'w-32 max-w-32 overflow-x-auto',
                wrapperCss: 'w-36 max-w-36'
            },
            {
                title: 'Uploaded At',
                field: 'createdAt',
                templateId: 'date',
                css: 'w-24 max-w-24',
                wrapperCss: 'w-32 max-w-32'
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
    }

    constructor(protected override readonly activatedRoute: ActivatedRoute,
                protected override readonly loading: LoadingService,
                protected override readonly router: Router,
                protected readonly audioService: AudioService) {
        super(activatedRoute, loading, router, audioService);
    }
}
