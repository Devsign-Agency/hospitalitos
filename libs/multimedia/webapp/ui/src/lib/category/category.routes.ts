import { Route } from "@angular/router";
import { DataResolver } from "@kaad/shared/webapp/ui";
import { CategoryComponent } from "./category.component";
import { DetailComponent } from "./views/detail/detail.component";
import { FormComponent } from "./views/form/form.component";
import { ListComponent } from "./views/list/list.component";

export const categoryRoutes: Route[] = [
    {
        path: '',
        component: CategoryComponent,
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
