import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { faChartSimple } from '@fortawesome/free-solid-svg-icons';
import { ConfigService } from '@kaad/config/webapp/core';
import { ICONS } from '../../icons/svg/icons';
import { Menu } from '../../menu/menu.interface';

@Component({
    selector: 'kaad-aside',
    templateUrl: './aside.component.html',
    styleUrls: ['./aside.component.scss'],
})
export class AsideComponent {
    faChart = faChartSimple;

    icons = ICONS;

    menu: Menu = {
        name: 'aside',
        items: [
            {
                name: 'Dashboard',
                type: 'item',
                icon: 'dashboard',
                uri: '/dashboard'
            },
            {
                name: 'Multimedia',
                type: 'menu',
                icon: 'kanban',
                uri: 'multimedia',
                items: [
                    {
                        name: 'Videos',
                        type: 'item',
                        icon: 'video',
                        uri: 'multimedia/video'
                    },
                    {
                        name: 'Audios',
                        type: 'item',
                        icon: 'audio',
                        uri: 'multimedia/audio'
                    },
                    {
                        name: 'Books',
                        type: 'item',
                        icon: 'book',
                        uri: 'multimedia/book'
                    }
                ]
            },
            {
                name: 'Users',
                type: 'item',
                icon: 'users',
                uri: 'security/user'
            }
        ]
    }

    constructor(private readonly config: ConfigService,
                private readonly router: Router) {
    }

    logout() {
        this.router.navigate([this.config.loginPage]);
    }
}
