import { Component } from '@angular/core';
import { AsideService } from '../../services/aside.service';

@Component({
    selector: 'kaad-main',
    templateUrl: './main.component.html',
    styleUrls: ['./main.component.scss'],
})
export class MainComponent {
    opened$;

    constructor(private readonly asideService: AsideService) {
        this.opened$ = asideService.asideOpened$;
    }
}
