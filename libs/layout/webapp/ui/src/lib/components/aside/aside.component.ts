import { Component } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { faChartSimple } from '@fortawesome/free-solid-svg-icons';
import { ConfigService } from '@kaad/config/webapp/core';
import { distinctUntilChanged, filter } from 'rxjs';
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
    routes: string[] = [];

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
                    },
                    {
                        name: 'Categories',
                        type: 'item',
                        icon: 'category',
                        uri: 'multimedia/category'
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
                private readonly activatedRoute: ActivatedRoute,
                private readonly router: Router) {
        this.router.events
            .pipe(
                filter((event) => event instanceof NavigationEnd),
                distinctUntilChanged()
            )
            .subscribe(() => {
                this.routes = this.findRoutes(this.activatedRoute.root);
                this.updateMenuItemStatus();
            });
    }

    findRoutes(route: ActivatedRoute) {
        const routes: string[] = [];

        const child = route.firstChild;
        if (child) {
            const routeURL: string = child.snapshot.url.map(segment => segment.path).join('/');
            if (routeURL !== '') {
                routes.push(routeURL);
            }

            const newItems: string[] = this.findRoutes(child);
            if (newItems) {
                newItems.forEach(newItem => {
                    if (!routes.find(item => item === newItem)) {
                        routes.push(newItem)
                    }
                })
            }
        }

        return routes;
    }

    updateMenuItemStatus() {
        this.menu.items
            .filter(item => item.type === 'menu')
            .forEach(item => {
                item.active = this.routes.includes(item.uri || '_-_-_-_');
            });
    }

    logout() {
        this.router.navigate([this.config.logoutPage]);
    }
}
