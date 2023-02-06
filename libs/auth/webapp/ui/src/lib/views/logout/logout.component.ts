import { Component, OnInit } from '@angular/core';
import { AuthService } from '@kaad/auth/webapp/core';

@Component({
    selector: 'kaad-logout',
    template: ''
})
export class LogoutComponent implements OnInit {
    constructor(private readonly authService: AuthService) {}

    ngOnInit(): void {
        this.authService.logout().subscribe();
    }
}
