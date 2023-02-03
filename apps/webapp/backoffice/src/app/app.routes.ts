import { Route } from '@angular/router';

export const appRoutes: Route[] = [
    {
        path: '',
        loadChildren: () =>
            import('@kaad/main/webapp/ui').then((m) => m.MainWebappUiModule)
    },
    {
        path: 'auth',
        loadChildren: () =>
            import('@kaad/auth/webapp/ui').then((m) => m.AuthWebappUiModule)
    }
];
