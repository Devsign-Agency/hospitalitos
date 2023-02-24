import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BookComponent } from './book.component';
import { ListComponent } from './views/list/list.component';
import { FormComponent } from './views/form/form.component';
import { DetailComponent } from './views/detail/detail.component';
import { RouterModule } from '@angular/router';
import { bookRoutes } from './book.routes';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(bookRoutes),
        SharedWebappUiModule
    ],
    declarations: [
        BookComponent,
        ListComponent,
        FormComponent,
        DetailComponent,
    ],
    exports: [BookComponent],
})
export class BookModule {}
