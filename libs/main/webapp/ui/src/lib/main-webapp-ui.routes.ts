import { Routes } from "@angular/router";
import { MainWebappUiComponent } from "./main-webapp-ui.component";

export const mainWebappUiRoutes: Routes = [
    {
        path: '',
        component: MainWebappUiComponent,
        children: [
            {
                path: 'multimedia',
                data: { breadcrumb: 'multimedia' },
                loadChildren: () => import('@kaad/multimedia/webapp/ui').then((m) => m.MultimediaWebappUiModule)
            },
            {
                path: 'security',
                loadChildren: () => import('@kaad/security/webapp/ui').then((m) => m.SecurityWebappUiModule)
            }
        ]
    }
];
