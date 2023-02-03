import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

@NgModule({
    imports: [
        FontAwesomeModule,
        FormsModule,
        ReactiveFormsModule
    ],
    exports: [
        FontAwesomeModule,
        FormsModule,
        ReactiveFormsModule
    ]
})
export class SharedWebappUiModule {}
