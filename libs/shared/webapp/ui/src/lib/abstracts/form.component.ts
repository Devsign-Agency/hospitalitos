import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import { ActivatedRoute } from "@angular/router";
import { ConfigService } from "@kaad/config/webapp/core";
import { LoadingService, ToastService } from "@kaad/layout/webapp/ui";
import { HasId } from "@kaad/shared/ng-common";
import { BaseService } from "@kaad/shared/webapp/core";
import { catchError, Observable, tap, throwError } from "rxjs";

@Component({
    selector: 'kaad-base-detail',
    template: ''
})
export class AbstractFormComponent<T extends HasId> implements OnInit {

    protected entityName: string;
    protected item: T;

    form: FormGroup;
    showPasswordInput = true;
    title = '';

    protected get isNew(): boolean { return !this.item; }

    public get f() {
        return this.form.controls;
    }

    constructor(formBuilder: FormBuilder,
        protected readonly config: ConfigService,
        protected readonly loading: LoadingService,
        protected readonly route: ActivatedRoute,
        protected readonly toastService: ToastService,
        protected readonly service: BaseService<T>) {
        this.form = this.buildForm(formBuilder);
    }

    protected buildForm(formBuilder: FormBuilder): FormGroup {
        return formBuilder.group({});
    }

    ngOnInit() {
        const id = this.route.snapshot.params['id'];
        this.title = id ? `Edit ${this.entityName}` : `New ${this.entityName}`;
        this.processId(id);
    }

    protected processId(id?: string): void {
        if (id) {
            this.findItem(id);
        }
    }

    protected findItem(id: string) {
        this.loading.show();
        return this.service.findById(id).pipe(
            tap(item => this.item = item),
            tap(() => this.loading.hide()),
            catchError((error) => {
                this.loading.hide();
                return throwError(() => error);
            })
        );
    }

    save() {
        if (this.form.valid) {
            this.loading.show();
            const observable: Observable<T> = !this.isNew
                ? this.service.update(this.item.id, this.buildEntityToUpdate())
                : this.service.create(this.buildEntityToCreate());
            observable.subscribe({
                next: savedItem => {
                    this.postSave(savedItem);
                    this.loading.hide();
                },
                error: (error) => {
                    console.log(error);
                    this.toastService.showDanger(error.error.message);
                    this.loading.hide()
                }
            })
        }
    }

    protected buildEntityToCreate(): unknown {
        return null;
    }

    protected buildEntityToUpdate(): unknown {
        return null;
    }

    protected postSave(savedItem: T): void {
        this.toastService.showSuccess('Save Success!');
        if (this.isNew) {
            this.form.reset();
        }
    }
}
