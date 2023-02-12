import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableType } from '@kaad/layout/webapp/ui';
import { Video } from '@kaad/multimedia/ng-common';
import { VideoService } from '@kaad/multimedia/webapp/core';
import { PageMeta } from '@kaad/shared/ng-common';
import { map, Observable, tap } from 'rxjs';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent implements OnInit {

    videoList$?: Observable<Video[]>;

    form: FormGroup;

    page = 1;
    pageSize = 2;
    listCount = 0;
    criteria = '';

    showModal = false;
    selectedIds: string[] = [];

    conf: DataTableType<Video> = {
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

    constructor(private readonly activatedRoute: ActivatedRoute,
        private readonly router: Router,
        private readonly videoService: VideoService) { }

    ngOnInit() {
        this.search();
    }

    search = () => {
        this.videoList$ = this.videoService.findAll(this.page, this.pageSize, this.criteria).pipe(
            tap(page => this.updatePageInfo(page.meta)),
            map(page => page.data)
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

    delete(item: Video) {
        this.videoService.delete(item.id).subscribe({
            next: () => this.search()
        });
    }

    detail(item: Video) {
        this.router.navigate([item.id], { relativeTo: this.activatedRoute });
    }

    edit(item: Video) {
        this.router.navigate([item.id, 'edit'], { relativeTo: this.activatedRoute });
    }
}

