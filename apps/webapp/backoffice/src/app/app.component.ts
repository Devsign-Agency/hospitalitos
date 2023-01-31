import { Component } from '@angular/core';
import { ConfigService } from '@kaad/config/webapp/core';

@Component({
    selector: 'kaad-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.scss'],
})
export class AppComponent {
    title = 'webapp-backoffice';

    constructor(private readonly config: ConfigService) {}
}
