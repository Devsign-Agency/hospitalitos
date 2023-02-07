import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '@kaad/auth/webapp/core';
import { User } from '@kaad/security/ng-common';
import { UserService } from '@kaad/security/webapp/core';
import { matchValidator } from '@kaad/shared/webapp/ui';
import { Observable } from 'rxjs';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent implements OnInit {

    form: FormGroup;
    title = '';

    constructor(formBuilder: FormBuilder,
                private readonly auth: AuthService,
                private readonly route: ActivatedRoute,
                private readonly userService: UserService) {
        this.form = formBuilder.group({
            id: [null],
            firstname: [''],
            lastname: [''],
            email: ['', [Validators.required, Validators.email]],
            username: ['', Validators.required],
            photoUrl: [''],
            newpassword: ['', [
                // Validators.required,
                // Validators.pattern('^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$'),
                // Validators.minLength(6),
                // Validators.maxLength(25),
                matchValidator('confirmPassword', true)
              ]],
              confirmPassword: ['', [
                // Validators.required,
                matchValidator('newpassword')
              ]]
        });
    }

    ngOnInit(): void {
        const id = this.route.snapshot.params['id'];
        this.title = id  ? 'Edit User' : 'New User';
        if (id) {
            this.form.controls['email'].disable();
            this.userService.findById(id).subscribe({
                next: user => this.form.patchValue(user)
            });
        }
    }

    save() {
        if (this.form.valid) {
            const { id, firstname, lastname, username, email, photoUrl, password } = this.form.getRawValue();
            const observable: Observable<User> = id
                ? this.userService.update(id, { id, firstname, lastname, username, email, photoUrl })
                : this.userService.create({ username, email, firstname, lastname, photoUrl });
            observable.subscribe({
                next: user => {
//
                }
            })
        }
    }
}
