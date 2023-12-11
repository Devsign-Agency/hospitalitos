import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { RouterModule } from '@angular/router';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { CategoryComponent } from './category.component';
import { categoryRoutes } from './category.routes';
import { DetailComponent } from './views/detail/detail.component';
import { FormComponent } from './views/form/form.component';
import { ListComponent } from './views/list/list.component';

@NgModule({
    declarations: [
        CategoryComponent,
        ListComponent,
        FormComponent,
        DetailComponent,
    ],
    imports: [
        CommonModule,
        RouterModule.forChild(categoryRoutes),
        SharedWebappUiModule
    ],
})
export class CategoryModule {}
