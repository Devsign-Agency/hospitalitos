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
                title: 'Name',
                field: 'name'
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

    override ngOnInit() {
        this.search();
    }

    override search = () => {
        import('rxjs').then(({ of }) => {
            this.itemList$ = of([
                { id: '1', name: 'Hospitalitos de la Fe - Introducción', code: 'HF-001', tags: 'Fe, Introducción', createdAt: new Date() },
                { id: '2', name: 'Estudio de la Biblia - Génesis', code: 'BIB-001', tags: 'Biblia, Antiguo Testamento', createdAt: new Date() },
                { id: '3', name: 'Material Católico - El Rosario', code: 'CAT-001', tags: 'Rosario, Oración', createdAt: new Date() },
                { id: '4', name: 'Misa Dominical Especial', code: 'MIS-001', tags: 'Misa, Domingo', createdAt: new Date() },
                { id: '5', name: 'Reflexiones sobre la Fe Católica', code: 'REF-001', tags: 'Reflexión, Fe', createdAt: new Date() },
            ]) as any;
        });
    }
}

