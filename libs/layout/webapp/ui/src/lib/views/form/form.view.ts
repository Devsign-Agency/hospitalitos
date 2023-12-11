import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
    selector: 'kaad-form-view',
    templateUrl: './form.view.html',
    styleUrls: ['./form.view.scss'],
})
// eslint-disable-next-line @angular-eslint/component-class-suffix
export class FormView {
    @Input() title?: string;
    @Input() disabled = true;

    @Output() save: EventEmitter<boolean> = new EventEmitter<boolean>();

    doSave() {
        this.save.emit(true);
    }
}
