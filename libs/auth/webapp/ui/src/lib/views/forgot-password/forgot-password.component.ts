import { Component, Inject } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ToastService } from '@kaad/layout/webapp/ui';
import { PasswordService } from '@kaad/security/webapp/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
    selector: 'kaad-forgot-password',
    templateUrl: './forgot-password.component.html',
    styleUrls: ['./forgot-password.component.scss'],
})
export class ForgotPasswordComponent {

    loading = false;

    form: FormGroup;

    constructor(formBuilder: FormBuilder,
                private readonly passwordService: PasswordService,
                private readonly route: ActivatedRoute,
                private readonly router: Router,
                private readonly toastService: ToastService,
                @Inject(DOCUMENT) private document: any) {
        this.form = formBuilder.group({
            email: ['', [Validators.required, Validators.email]]
        });
    }

    send() {
        if (this.form.valid) {
            this.loading = true;
            const { email } = this.form.value;
            const domain = this.document.location.origin;
            const urlCallback = `${domain}/auth/update-password`;
            this.passwordService.forgot({email, urlCallback}).subscribe({
                next: value => {
                    this.loading = false;
                    if (value) {
                        this.router.navigate(['..', 'notification', 'forgot'], { relativeTo: this.route })
                    }
                },
                error: (error) => {
                    this.toastService.showDanger(error.error.message);
                    this.loading = false;
                    this.router.navigate(['..', 'notification', 'forgot'], { relativeTo: this.route })
                }
            })
        }
    }
}
