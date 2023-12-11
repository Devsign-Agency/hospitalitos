import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { fa0 } from '@fortawesome/free-solid-svg-icons';
import { AuthService } from '@kaad/auth/webapp/core';
import { map } from 'rxjs';

@Component({
    selector: 'kaad-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
    faTest = fa0;
    loading = false;
    googleUrl$;

    form: FormGroup;

    constructor(formBuilder: FormBuilder,
            private readonly authService: AuthService) {
        this.form = formBuilder.group({
            username: ['', Validators.required],
            password: ['', Validators.required]
        });

        this.googleUrl$ = this.authService.getGoogleUrlLogin().pipe(
            map(value => value.authUrl)
        );
    }

    login() {
        if (this.form.valid) {
            this.form.disable();
            this.loading = true;
            this.authService.login(this.form.value).subscribe({
                next: () => {
                    this.form.enable();
                    this.loading = false;
                },
                error: () => {
                    this.form.enable();
                    this.loading = false;
                }
            });
        }
    }
}
