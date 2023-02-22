import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { LoadingService, ToastService } from '@kaad/layout/webapp/ui';
import { Audio } from '@kaad/multimedia/ng-common';
import { AudioService, VideoService } from '@kaad/multimedia/webapp/core';
import { AbstractFormComponent } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent extends AbstractFormComponent<Audio> {

    isAdmin = false;

    constructor(formBuilder: FormBuilder,
        protected override readonly config: ConfigService,
        protected override readonly route: ActivatedRoute,
        protected override readonly toastService: ToastService,
        protected override readonly loading: LoadingService,
        protected readonly audioService: AudioService) {
        super(formBuilder, config, loading, route, toastService, audioService);
    }

    protected override buildForm(formBuilder: FormBuilder): FormGroup {
        return formBuilder.group({
            id: [null],
            title: ['', Validators.required],
            tags: ['', Validators.required],
            description: [''],
            code: [''],
            url: [''],
            file: [''],
            fileSource: [''],
            fileName: [''],
            synopsis: [''],
            recommended: [false],
            thumbnailImage: [''],
            thumbnailSource: [''],
            thumbnailName: ['']
        });
    }

    protected override processId(id?: string | undefined): void {
        this.title = id ? 'Edit Audio' : 'New Audio';
        if (id) {
            this.findItem(id).subscribe({
                next: video => this.form.patchValue(video)
            });
        }
    }

    protected override buildEntityToCreate(): unknown {
        const { title, description, synopsis, tags, fileSource, fileName, thumbnailName, thumbnailSource } = this.form.getRawValue();
        const formData = new FormData();
        formData.append('file', fileSource, fileName);
        formData.append('thumbnailImage', thumbnailSource, thumbnailName);
        formData.append('title', title);
        formData.append('description', description);
        formData.append('synopsis', synopsis)
        formData.append('tags', tags);

        return formData;
    }

    protected override buildEntityToUpdate(): unknown {
        const { id, title, description, synopsis, recommended, tags } = this.form.getRawValue();
        return { id, title, description, synopsis, recommended, tags };
    }

    protected override postSave(savedItem: Audio): void {
        super.postSave(savedItem);
        if (this.isNew) {
            this.isAdmin = false;
        }
    }

    onFileChange(event: any) {

        if (event.target.files.length > 0) {
            const file = event.target.files[0];
            this.form.patchValue({
                fileSource: file,
                fileName: file.name
            });
        }
    }

    onThumbnailChange(event: any) {
        if (event.target.files.length > 0) {
            const file = event.target.files[0];
            this.form.patchValue({
                thumbnailSource: file,
                thumbnailName: file.name
            });
        }
    }
}
