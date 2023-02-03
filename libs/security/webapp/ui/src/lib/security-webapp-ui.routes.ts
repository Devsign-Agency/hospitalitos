import { Route } from '@angular/router';

export const securityWebappUiRoutes: Route[] = [
    {
        path: 'user',
        loadChildren: () =>
            import('./user/user.module').then((m) => m.UserModule)
    }
];
