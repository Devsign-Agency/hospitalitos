import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserComponent } from './user.component';
import { RouterModule } from '@angular/router';
import { userRoutes } from './user.routes';
import { ListComponent } from './views/list/list.component';
import { DetailComponent } from './views/detail/detail.component';
import { FormComponent } from './views/form/form.component';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(userRoutes),
        SharedWebappUiModule
    ],
    declarations: [
        UserComponent,
        ListComponent,
        DetailComponent,
        FormComponent,
    ],
    exports: [UserComponent],
})
export class UserModule {}
