import { Component } from '@angular/core';
import { faChartSimple } from '@fortawesome/free-solid-svg-icons';
import { AuthService } from '@kaad/auth/webapp/core';
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
                name: 'Kanban',
                type: 'item',
                icon: 'kanban',
                uri: 'auth/login'
            },
            {
                name: 'Users',
                type: 'item',
                icon: 'users',
                uri: 'security/user'
            }
        ]
    }

    constructor(private readonly authService: AuthService) {
    }

    logout() {
        this.authService.logout().subscribe();
    }
}