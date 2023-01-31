import { Route } from '@angular/router';

export const appRoutes: Route[] = [
    {
        path: 'auth',
        loadChildren: () =>
            import('@kaad/auth/webapp/ui').then((m) => m.AuthWebappUiModule)
    }
];
