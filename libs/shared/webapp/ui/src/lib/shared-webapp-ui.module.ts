import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';
import { AbstractListComponent } from './abstracts/list.component';
import { SecurePipe } from './pipes/secure.pipe';

@NgModule({
    declarations: [
        AbstractListComponent,
        SecurePipe
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
        ReactiveFormsModule,
        SecurePipe
    ]
})
export class SharedWebappUiModule {}
