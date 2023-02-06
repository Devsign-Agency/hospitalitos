import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { debounceTime, map, Observable } from 'rxjs';

@Component({
    selector: 'kaad-list',
    templateUrl: './list.component.html',
    styleUrls: ['./list.component.scss'],
})
export class ListComponent implements OnInit {

    userList$?: Observable<User[]>;

    form: FormGroup;

    page = 1;
    take = 10;
    criteria = '';

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
        this.userList$ = this.userService.findAll(this.page, this.take, this.criteria).pipe(
            map(page => page.data)
        );
    }

    searchCriteria = (value: string) => {
        this.criteria = value;
        this.search();
    }

    gotoPage(page = 1) {
        this.page = page;
        this.search();
    }
}
