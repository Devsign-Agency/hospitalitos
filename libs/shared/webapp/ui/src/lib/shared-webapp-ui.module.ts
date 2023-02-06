import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';

@NgModule({
    imports: [
        FontAwesomeModule,
        FormsModule,
        LayoutWebappUiModule,
        ReactiveFormsModule
    ],
    exports: [
        FontAwesomeModule,
        FormsModule,
        LayoutWebappUiModule,
        ReactiveFormsModule
    ]
})
export class SharedWebappUiModule {}
