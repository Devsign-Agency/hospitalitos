import { Route } from '@angular/router';
import { AuthGuard } from '@kaad/auth/webapp/core';

export const appRoutes: Route[] = [
    {
        path: '',
        canActivate: [AuthGuard],
        runGuardsAndResolvers: 'always',
        data: { breadcrumb: 'Home' },
        loadChildren: () =>
            import('@kaad/main/webapp/ui').then((m) => m.MainWebappUiModule)
    },
    {
        path: 'auth',
        loadChildren: () =>
            import('@kaad/auth/webapp/ui').then((m) => m.AuthWebappUiModule)
    }
];
