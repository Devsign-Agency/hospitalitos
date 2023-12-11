import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { LoadingService, ToastService } from '@kaad/layout/webapp/ui';
import { User } from '@kaad/security/ng-common';
import { PasswordService, UserService } from '@kaad/security/webapp/core';
import { AbstractFormComponent, matchValidator } from '@kaad/shared/webapp/ui';
import { tap } from 'rxjs';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent extends AbstractFormComponent<User> {

    isAdmin = false;

    constructor(formBuilder: FormBuilder,
                protected override readonly config: ConfigService,
                protected readonly passwordService: PasswordService,
                protected override readonly route: ActivatedRoute,
                protected override readonly toastService: ToastService,
                protected override readonly loading: LoadingService,
                protected readonly userService: UserService) {
        super(formBuilder, config, loading, route, toastService, userService);
    }

    protected override buildForm(formBuilder: FormBuilder): FormGroup {
        return formBuilder.group({
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

    protected override processId(id?: string): void {
        this.title = id  ? 'Edit User' : 'New User';
        if (id) {
            this.showPasswordInput = false;
            this.form.controls['email'].disable();
            this.form.controls['newpassword'].disable();
            this.form.controls['confirmPassword'].disable();
            this.findItem(id).pipe(
                tap(user => this.isAdmin = !!user.role?.includes(this.config.adminRole))
            )
            .subscribe({
                next: user => this.form.patchValue(user)
            });
        }
    }

    protected override buildEntityToCreate(): unknown {
        const { firstname, lastname, username, email, photoUrl, newpassword } = this.form.getRawValue();
        const role: string[] = [ this.config.userRole, ...(this.isAdmin ? [ this.config.adminRole ] : [] )];
        return { username, email, firstname, lastname, photoUrl, password: newpassword, role };
    }

    protected override buildEntityToUpdate(): unknown {
        const { id, firstname, lastname, username, email, photoUrl } = this.form.getRawValue();
        const role: string[] = [ this.config.userRole, ...(this.isAdmin ? [ this.config.adminRole ] : [] )];
        return { id, firstname, lastname, username, email, photoUrl, role };
    }

    protected override postSave(savedItem: User) {
        super.postSave(savedItem);
        if (this.isNew) {
            this.isAdmin = false;
        }
    }

    resetPassword() {
        const { email } = this.form.getRawValue();
        if (email) {
            this.loading.show();
            const urlCallback = `auth/update-password`;
            this.passwordService.forgot({email, urlCallback}).subscribe({
                next: value => {
                    if (value) {
                        this.toastService.showSuccess('Email sended');
                    }
                    this.loading.hide();
                },
                error: (error) => {
                    this.toastService.showDanger(error.error.message);
                    this.loading.hide();
                }
            })
        }
    }

    toggleAdmin() {
        this.isAdmin = !this.isAdmin;
    }
}
