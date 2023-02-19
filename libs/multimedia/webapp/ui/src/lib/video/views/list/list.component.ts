import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableType, LoadingService } from '@kaad/layout/webapp/ui';
import { Video } from '@kaad/multimedia/ng-common';
import { VideoService } from '@kaad/multimedia/webapp/core';
import { AbstractListComponent } from '@kaad/shared/webapp/ui';
import { Observable } from 'rxjs';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent extends AbstractListComponent<Video> {

    videoList$?: Observable<Video[]>;

    override conf: DataTableType<Video> = {
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
                protected readonly videoService: VideoService) {
        super(activatedRoute, loading, router, videoService);
    }
}

