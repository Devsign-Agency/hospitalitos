import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';
import { AbstractListComponent } from './abstracts/list.component';

@NgModule({
    declarations: [
        AbstractListComponent
    ],
    imports: [
        FontAwesomeModule,
        FormsModule,
        LayoutWebappUiModule,
        ReactiveFormsModule
    ],
    exports: [
        AbstractListComponent,
        FontAwesomeModule,
        FormsModule,
        LayoutWebappUiModule,
        ReactiveFormsModule
    ]
})
export class SharedWebappUiModule {}
