import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { filter } from 'rxjs';

type MenuItem = { label: string, url: string };

@Component({
    selector: 'kaad-breadcrumb',
    templateUrl: './breadcrumb.component.html',
    styleUrls: ['./breadcrumb.component.scss'],
})
export class BreadcrumbComponent implements OnInit {
    static readonly ROUTE_DATA_BREADCRUMB = 'breadcrumb';
    readonly home = { icon: 'pi pi-home', url: 'home' };
    menuItems: MenuItem[];

    constructor(private router: Router, private activatedRoute: ActivatedRoute) { }

    ngOnInit(): void {
        this.router.events
            .pipe(filter(event => event instanceof NavigationEnd))
            .subscribe(() => this.menuItems = this.createBreadcrumbs(this.activatedRoute.root));
    }

    private createBreadcrumbs(route: ActivatedRoute, url: string = ''): MenuItem[] {
        const breadcrumbs: MenuItem[] = [];

        const child = route.firstChild;
        if (child) {
            const routeURL: string = child.snapshot.url.map(segment => segment.path).join('/');
            if (routeURL !== '') {
                url += `/${routeURL}`;

                const label = child.snapshot.data[BreadcrumbComponent.ROUTE_DATA_BREADCRUMB];
                if (label) {
                    breadcrumbs.push({ label, url });
                }
            }

            const newItems: MenuItem[] = this.createBreadcrumbs(child, url);
            if (newItems) {
                newItems.forEach(newItem => {
                    if (!breadcrumbs.find(item => item.label === newItem.label && item.url === newItem.url)) {
                        breadcrumbs.push(newItem)
                    }
                })
            }
        }

        return breadcrumbs;
    }
}
