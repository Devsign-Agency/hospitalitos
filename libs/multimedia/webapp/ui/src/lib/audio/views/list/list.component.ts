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
                field: 'title'
            },
            {
                title: 'Code',
                field: 'code',
                templateId: 'code'
            },
            {
                title: 'Tags',
                field: 'tags',
                templateId: 'tags'
            },
            {
                title: 'Uploaded At',
                field: 'createdAt',
                templateId: 'date'
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
