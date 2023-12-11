import { Route } from '@angular/router';
import { MultimediaWebappUiComponent } from './multimedia-webapp-ui.component';

export const multimediaWebappUiRoutes: Route[] = [
    {
        path: 'audio',
        component: MultimediaWebappUiComponent,
        data: { breadcrumb: 'audio' },
        loadChildren: () => import('./audio/audio.module').then((m) => m.AudioModule)
    },
    {
        path: 'book',
        component: MultimediaWebappUiComponent,
        data: { breadcrumb: 'book' },
        loadChildren: () => import('./book/book.module').then((m) => m.BookModule)
    },
    {
        path: 'category',
        component: MultimediaWebappUiComponent,
        data: { breadcrumb: 'category' },
        loadChildren: () => import('./category/category.module').then((m) => m.CategoryModule)
    },
    {
        path: 'video',
        component: MultimediaWebappUiComponent,
        data: { breadcrumb: 'video' },
        loadChildren: () =>
            import('./video/video.module').then((m) => m.VideoModule)
    }
];
