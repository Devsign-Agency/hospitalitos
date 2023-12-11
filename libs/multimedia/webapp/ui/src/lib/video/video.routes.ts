import { Route } from "@angular/router";
import { DataResolver } from "@kaad/shared/webapp/ui";
import { VideoComponent } from "./video.component";
import { DetailComponent } from "./views/detail/detail.component";
import { FormComponent } from "./views/form/form.component";
import { ListComponent } from "./views/list/list.component";

export const videoRoutes: Route[] = [
    {
        path: '',
        component: VideoComponent,
        children: [
            {
                path: '',
                component: ListComponent
            },
            {
                path: 'new',
                component: FormComponent,
                data: { breadcrumb: 'new' },
            },
            {
                path: ':id',
                resolve: { breadcrumb: DataResolver },
                children: [
                    {
                        path: '',
                        component: DetailComponent,
                    },
                    {
                        path: 'edit',
                        component: FormComponent,
                        data: { breadcrumb: 'edit' },
                    }
                ]
            }
        ]
    }
];
