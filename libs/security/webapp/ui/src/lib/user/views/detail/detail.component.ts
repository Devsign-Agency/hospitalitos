import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { AbstractDetailComponent } from '@kaad/shared/webapp/ui';
import { Observable } from 'rxjs';

@Component({
    selector: 'kaad-detail',
    templateUrl: './detail.component.html',
    styleUrls: ['./detail.component.scss'],
})
export class DetailComponent extends AbstractDetailComponent<User> {

    constructor(protected override readonly activatedRoute: ActivatedRoute,
        protected override readonly config: ConfigService,
        protected readonly userService: UserService) {
        super(activatedRoute, config, userService);
    }
}
