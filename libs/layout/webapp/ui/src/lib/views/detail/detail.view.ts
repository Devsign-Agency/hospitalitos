import { Component, Input } from '@angular/core';

@Component({
    selector: 'kaad-detail-view',
    templateUrl: './detail.view.html',
    styleUrls: ['./detail.view.scss'],
})
// eslint-disable-next-line @angular-eslint/component-class-suffix
export class DetailView<T> {

    @Input() item?: T;

}
