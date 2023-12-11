import { Route } from '@angular/router';

export const securityWebappUiRoutes: Route[] = [
    {
        path: 'user',
        data: { breadcrumb: 'user' },
        loadChildren: () =>
            import('./user/user.module').then((m) => m.UserModule)
    }
];
