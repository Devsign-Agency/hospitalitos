import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { PageMeta } from '@kaad/shared/ng-common';
import { debounceTime, map, Observable, tap } from 'rxjs';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent implements OnInit {

    userList$?: Observable<User[]>;

    form: FormGroup;

    page = 1;
    pageSize = 10;
    listCount = 0;
    criteria = '';

    showModal = false;
    selectedIds: string[] = [];


    constructor(formBuilder: FormBuilder,
        private readonly userService: UserService) {
        this.form = formBuilder.group({
            criteria: ['']
        });

        this.form.controls['criteria'].valueChanges.pipe(
            debounceTime(300)
        ).subscribe(this.searchCriteria)
    }

    ngOnInit() {
        this.search();
    }

    search = () => {
        this.userList$ = this.userService.findAll(this.page, this.pageSize, this.criteria).pipe(
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

    delete(id: string) {
        this.selectedIds.push(id);
        this.openModal();
    }

    openModal() {
        this.showModal = true;
    }

    accept() {
        this.showModal = false;
        const id = this.selectedIds.shift();
        if (id) {
            this.userService.delete(id).subscribe({
                next: () => this.search()
            });
        }
    }

    cancel() {
        this.showModal = false;
    }
}
