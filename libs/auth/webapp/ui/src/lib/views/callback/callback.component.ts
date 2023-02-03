import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '@kaad/auth/webapp/core';

@Component({
    selector: 'kaad-callback',
    templateUrl: './callback.component.html',
})
export class CallbackComponent implements OnInit {

    constructor(private readonly route: ActivatedRoute,
                private readonly authService: AuthService) {}

    ngOnInit() {
        const code = this.route.snapshot.queryParams['code'];
        this.authService.googleLogin(code).subscribe({
            next: (value) => {
                // comunicarse con la ventana padre
                console.log(value)
            },
            error: (error) => console.log('error', error)
        })
    }
}
