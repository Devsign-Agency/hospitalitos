import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { Observable } from 'rxjs';

@Component({
    selector: 'kaad-detail',
    templateUrl: './detail.component.html',
    styleUrls: ['./detail.component.scss'],
})
export class DetailComponent implements OnInit {

    adminRole: string;
    userRole: string;
    user$?: Observable<User>;

    constructor(private readonly config: ConfigService,
                private readonly route: ActivatedRoute,
                private readonly userService: UserService) {
        this.adminRole = this.config.adminRole;
        this.userRole = this.config.userRole;
    }

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
