import { Component, HostBinding } from '@angular/core';
import { Observable } from 'rxjs';
import { LoadingService } from '../../services/loading.service';

@Component({
    selector: 'kaad-loading',
    templateUrl: './loading.component.html',
    styleUrls: ['./loading.component.scss'],
})
export class LoadingComponent {
    @HostBinding('class.absolute') cssAbsolute = true;
    @HostBinding('class.inset-0') cssInset0 = true;
    @HostBinding('class.hidden') cssHidden = true;

    show$: Observable<boolean>;

    constructor(private readonly loading: LoadingService) {
        this.loading.visible$.subscribe({
            next: show => this.cssHidden = !show
        });
    }
}
