import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { AuthResponse } from '@kaad/auth/ng-common';
import { AuthService } from '@kaad/auth/webapp/core';
import { ToastService } from '@kaad/layout/webapp/ui';
import { User } from '@kaad/security/ng-common';
import { PasswordService, UserService } from '@kaad/security/webapp/core';
import { matchValidator } from '@kaad/shared/webapp/ui';
import { Observable, tap } from 'rxjs';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent implements OnInit {

    form: FormGroup;
    showPasswordInput = true;
    title = '';
    isAdmin = false;

    constructor(formBuilder: FormBuilder,
                private readonly auth: AuthService,
                private readonly passwordService: PasswordService,
                private readonly route: ActivatedRoute,
                private readonly toastService: ToastService,
                private readonly userService: UserService) {
        this.form = formBuilder.group({
            id: [null],
            firstname: [''],
            lastname: [''],
            email: ['', [Validators.required, Validators.email]],
            username: ['', Validators.required],
            photoUrl: [''],
            newpassword: ['', [
                Validators.required,
                Validators.pattern('^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$'),
                Validators.minLength(6),
                Validators.maxLength(25),
                matchValidator('confirmPassword', true)
              ]],
              confirmPassword: ['', [
                Validators.required,
                matchValidator('newpassword')
              ]]
        });
    }

    ngOnInit(): void {
        const id = this.route.snapshot.params['id'];
        this.title = id  ? 'Edit User' : 'New User';
        if (id) {
            this.showPasswordInput = false;
            this.form.controls['email'].disable();
            this.form.controls['newpassword'].disable();
            this.form.controls['confirmPassword'].disable();
            this.userService.findById(id).pipe(
                tap(user => this.isAdmin = !!user.role?.includes('admin'))
            )
            .subscribe({
                next: user => this.form.patchValue(user)
            });
        }
    }

    save() {
        if (this.form.valid) {
            const { id, firstname, lastname, username, email, photoUrl, newpassword } = this.form.getRawValue();
            const role: string[] = [ 'user', ...(this.isAdmin ? [ 'admin' ] : [] )];

            const observable: Observable<User> = id
                ? this.userService.update(id, { id, firstname, lastname, username, email, photoUrl, role })
                : this.userService.create({ username, email, firstname, lastname, photoUrl, password: newpassword });
            observable.subscribe({
                next: () => {
                    this.toastService.showSuccess('Save Success!');
                    if (!id) {
                        this.form.reset();
                    }
                }
            })
        }
    }

    resetPassword() {
        const { email } = this.form.getRawValue();
        if (email) {

            const urlCallback = `auth/update-password`;
            this.passwordService.forgot({email, urlCallback}).subscribe({
                next: value => {
                    if (value) {
                        this.toastService.showSuccess('Email sended');
                    }
                },
                error: (error) => {
                    this.toastService.showDanger(error.error.message);
                }
            })
        }
    }

    toggleAdmin() {
        this.isAdmin = !this.isAdmin;
    }
}
