import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { Observable } from 'rxjs';

@Component({
    selector: 'kaad-detail',
    templateUrl: './detail.component.html',
    styleUrls: ['./detail.component.scss'],
})
export class DetailComponent implements OnInit {

    user$?: Observable<User>;

    constructor(private readonly route: ActivatedRoute,
                private readonly userService: UserService) { }

    ngOnInit(): void {
        const id = this.route.snapshot.params['id'];
        if (id) {
            this.findUser(id);
        }
    }

    findUser(id: string) {
        this.user$ = this.userService.findById(id);
    }
}
