import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { LoadingService, ToastService } from '@kaad/layout/webapp/ui';
import { Video } from '@kaad/multimedia/ng-common';
import { VideoService } from '@kaad/multimedia/webapp/core';
import { AbstractFormComponent } from '@kaad/shared/webapp/ui';
import { tap } from 'rxjs';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent extends AbstractFormComponent<Video> {

    isAdmin = false;

    constructor(formBuilder: FormBuilder,
        protected override readonly config: ConfigService,
        protected override readonly route: ActivatedRoute,
        protected override readonly toastService: ToastService,
        protected override readonly loading: LoadingService,
        protected readonly videoService: VideoService) {
        super(formBuilder, config, loading, route, toastService, videoService);
    }

    protected override buildForm(formBuilder: FormBuilder): FormGroup {
        return formBuilder.group({
            id: [null],
            name: ['', Validators.required],
            tags: ['', Validators.required],
            description: [''],
            code: [''],
            url: [''],
            file: [''],
            fileSource: [''],
            fileName: ['']
        });
    }

    protected override processId(id?: string): void {
        this.title = id ? 'Edit Video' : 'New Video';
        if (id) {
            this.findItem(id).pipe(
                tap(video => this.isAdmin = !!video.tags?.includes(this.config.adminRole))
            )
                .subscribe({
                    next: video => this.form.patchValue(video)
                });
        }
    }

    protected override buildEntityToCreate(): unknown {
        const { name, description, tags, fileSource, fileName } = this.form.getRawValue();
        const formData = new FormData();
        formData.append('file', fileSource, fileName);
        formData.append('name', name);
        formData.append(description, 'description');
        formData.append('tags', tags);

        return { formData, params: { name, description, tags } };
    }

    protected override buildEntityToUpdate(): unknown {
        const { id, name, description, tags } = this.form.getRawValue();
        return { id, name, description, tags };
    }

    protected override postSave(savedItem: Video) {
        super.postSave(savedItem);
        if (this.isNew) {
            this.isAdmin = false;
        }
    }

    onFileChange(event: any) {

        if (event.target.files.length > 0) {
            console.log('nano');
            const file = event.target.files[0];
            this.form.patchValue({
                fileSource: file,
                fileName: file.name
            });
        }
    }
}
