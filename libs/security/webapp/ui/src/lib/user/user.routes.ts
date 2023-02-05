import { Route } from '@angular/router';
import { UserComponent } from './user.component';
import { ListComponent } from './views/list/list.component';

export const userRoutes: Route[] = [
    {
        path: '',
        component: UserComponent,
        children: [
            {
                path: '',
                component: ListComponent
            }
        ]
    }
];
