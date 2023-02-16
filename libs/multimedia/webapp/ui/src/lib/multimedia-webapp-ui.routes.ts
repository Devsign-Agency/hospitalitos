import { Route } from '@angular/router';
import { MultimediaWebappUiComponent } from './multimedia-webapp-ui.component';

export const multimediaWebappUiRoutes: Route[] = [
    {
        path: 'video',
        component: MultimediaWebappUiComponent,
        data: { breadcrumb: 'video' },
        loadChildren: () =>
            import('./video/video.module').then((m) => m.VideoModule)
    }
];
