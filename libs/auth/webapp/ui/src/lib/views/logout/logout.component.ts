import { Component, OnInit } from '@angular/core';
import { AuthService } from '@kaad/auth/webapp/core';

@Component({
    selector: 'kaad-logout',
    template: `
    <div class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-white">
        <div class="flex-auto px-4 py-10">
            <h1 class="text-2xl">Logout.</h1>
            <span>please await while we close session...</span>
        </div>
    </div>
    `
})
export class LogoutComponent implements OnInit {
    constructor(private readonly authService: AuthService) {}

    ngOnInit(): void {
        this.authService.logout().subscribe();
    }
}
