import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
    selector: 'kaad-notification',
    templateUrl: './notification.component.html',
    styleUrls: ['./notification.component.scss'],
})
export class NotificationComponent implements OnInit {

    title = '';
    message = '';

    constructor(private readonly route: ActivatedRoute) {}

    ngOnInit() : void {
        const code = this.route.snapshot.params['code'];
        this.getTitle(code);
        this.getMessage(code);
    }

    private getTitle(code?: string) {
        switch (code) {
            case 'forgot':
                this.title = 'Email sended'
            break;
            case 'reset':
                this.title = 'Password Reset'
            break;
        }
    }

    private getMessage(code?: string) {
        switch (code) {
            case 'forgot':
                this.message = `
                    <p>Se ha enviado un enlace a su dirección de correo electrónico.</p>
                    <p>Siga las instrucciones indicadas en el correo para reestablecer su contraseña.</p
                `;
            break;
            case 'reset':
                this.message = `
                    <p>Su contraseña se ha reestablecido correctamente.</p>
                    <p>Puede iniciar sesión utilizando su nueva contraseña.</p>
                `;
            break;
        }
    }
}
