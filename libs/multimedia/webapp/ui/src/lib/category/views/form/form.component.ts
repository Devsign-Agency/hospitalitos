import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { LoadingService, ToastService } from '@kaad/layout/webapp/ui';
import { Category } from '@kaad/multimedia/ng-common';
import { CategoryService } from '@kaad/multimedia/webapp/core';
import { AbstractFormComponent } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent extends AbstractFormComponent<Category> {

    constructor(formBuilder: FormBuilder,
        protected override readonly config: ConfigService,
        protected override readonly route: ActivatedRoute,
        protected override readonly toastService: ToastService,
        protected override readonly loading: LoadingService,
        protected readonly categoryService: CategoryService) {
        super(formBuilder, config, loading, route, toastService, categoryService);
    }

    protected override buildForm(formBuilder: FormBuilder): FormGroup {
        return formBuilder.group({
            id: [null],
            name: ['', Validators.required]
        });
    }

    protected override processId(id?: string): void {
        this.title = id ? 'Edit Category' : 'New Category';
        if (id) {
            this.findItem(id).subscribe({
                next: video => this.form.patchValue(video)
            });
        }
    }

    protected override buildEntityToCreate(): unknown {
        const { name } = this.form.getRawValue();

        return { name };
    }

    protected override buildEntityToUpdate(): unknown {
        const { id, name } = this.form.getRawValue();
        return { id, name };
    }

}
