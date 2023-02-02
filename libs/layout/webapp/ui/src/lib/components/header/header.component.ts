import { Component } from '@angular/core';
import { AsideService } from '../../services/aside.service';

@Component({
    selector: 'kaad-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss'],
})
export class HeaderComponent {

    asideOpened$;

    constructor(private readonly asideService: AsideService) {
        this.asideOpened$ = asideService.asideOpened$;
    }

    toggleAside() {
        this.asideService.toggleOpenedState();
    }
}
