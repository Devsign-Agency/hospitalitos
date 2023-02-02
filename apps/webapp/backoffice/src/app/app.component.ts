import { Component } from '@angular/core';
import { faBars } from '@fortawesome/free-solid-svg-icons';
import { ConfigService } from '@kaad/config/webapp/core';
import { AsideService } from '@kaad/layout/webapp/ui';

@Component({
    selector: 'kaad-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.scss'],
})
export class AppComponent {
    title = 'webapp-backoffice';
    faBars = faBars;
    opened$;

    constructor(private readonly config: ConfigService, private readonly asideService: AsideService) {
        this.opened$ = asideService.asideOpened$;
    }

    closeSideMenu() {
        //
    }

    toggleSideMenu() {
        //
    }

    toggleNotificationsMenu() {
        //
    }

    closeNotificationsMenu() {
        //
    }

    toggleProfileMenu() {
        //
    }

    closeProfileMenu() {
        //
    }
}
