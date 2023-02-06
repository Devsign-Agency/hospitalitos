import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { distinctUntilChanged, filter } from 'rxjs';

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

    isRefreshed = true; // dummy variable flag

    constructor(private router: Router, private activatedRoute: ActivatedRoute) {
        this.router.events
            .pipe(
                filter((event) => event instanceof NavigationEnd),
                distinctUntilChanged()
            )
            .subscribe(() => {
                //Build your breadcrumb starting with the root route of your current activated route. will call only on navigation change
                this.isRefreshed = false;
                this.menuItems = this.createBreadcrumbs(this.activatedRoute.root);
            });
    }

    ngOnInit(): void {
        if (this.isRefreshed) {
            //will call only when page reload happens
            this.menuItems = this.createBreadcrumbs(this.activatedRoute.root);
        }
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
