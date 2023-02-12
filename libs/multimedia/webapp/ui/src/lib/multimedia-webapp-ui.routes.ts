import { Route } from '@angular/router';

export const multimediaWebappUiRoutes: Route[] = [
    {
        path: 'video',
        data: { breadcrumb: 'video' },
        loadChildren: () =>
            import('./video/video.module').then((m) => m.VideoModule)
    }
];
