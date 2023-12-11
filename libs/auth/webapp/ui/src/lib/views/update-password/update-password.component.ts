import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '@kaad/layout/webapp/ui';
import { PasswordService } from '@kaad/security/webapp/core';
import { matchValidator } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-update-password',
    templateUrl: './update-password.component.html',
    styleUrls: ['./update-password.component.scss'],
})
export class UpdatePasswordComponent implements OnInit {
    form: FormGroup;
    code?: string;
    loading = false;

    constructor(formbuilder: FormBuilder,
                private readonly passwordService: PasswordService,
                private readonly route: ActivatedRoute,
                private readonly router: Router,
                private readonly toastService: ToastService) {
        this.form = formbuilder.group({
            newPassword: ['', [
                Validators.required,
                Validators.pattern('^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$'),
                Validators.minLength(6),
                Validators.maxLength(25),
                matchValidator('confirmPassword', true)
            ]],
            confirmPassword: ['', [
                Validators.required,
                matchValidator('newPassword')
            ]]
        });
    }

    ngOnInit(): void {
        this.code = this.route.snapshot.params['validationCode'];
    }

    send() {
        if (this.form.valid) {
            this.loading = true;
            const { newPassword } = this.form.value;
            const validationCode = this.code || '';
            this.passwordService.reset({ newPassword, validationCode }).subscribe({
                next: value => {
                    console.log(value);
                    this.loading = false;
                    this.router.navigate(['../../', 'notification', 'forgot'], { relativeTo: this.route })
                },
                error: (error) => {
                    this.loading = false;
                    this.toastService.showDanger(error.error.message);
                }
            });
        }
    }
}
