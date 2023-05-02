import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Category } from '@kaad/commons/ng-common';
import { ConfigService } from '@kaad/config/webapp/core';
import { LoadingService, ToastService } from '@kaad/layout/webapp/ui';
import { Audio } from '@kaad/multimedia/ng-common';
import { AudioService, CategoryService } from '@kaad/multimedia/webapp/core';
import { AbstractFormComponent } from '@kaad/shared/webapp/ui';
import { firstValueFrom, map } from 'rxjs';

@Component({
    selector: 'kaad-form',
    templateUrl: './form.component.html',
    styleUrls: ['./form.component.scss'],
})
export class FormComponent extends AbstractFormComponent<Audio> {

    categoryList: Category[] = [];

    constructor(formBuilder: FormBuilder,
                protected override readonly config: ConfigService,
                protected override readonly route: ActivatedRoute,
                protected override readonly toastService: ToastService,
                protected override readonly loading: LoadingService,
                protected readonly audioService: AudioService,
                protected readonly categoryService: CategoryService) {
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

    private findCategories() {
        return this.categoryService.findAll(1, 100).pipe(map(page => page.data));
    }

    protected override async processId(id?: string | undefined): Promise<void> {
        this.title = id ? 'Edit Audio' : 'New Audio';
        this.categoryList = await( firstValueFrom(this.findCategories()) );
        if (id) {
            const video = await ( firstValueFrom(this.findItem(id)) );
            this.form.patchValue(video);
            this.categoryList.map(category => {
                const inUse = (video.categories || []).find(c => c.id === category.id);
                category.selected = !!inUse;
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

        this.categoryList
            .filter(c => c.selected)
            .forEach((c, i) => {
                formData.append(`category[${i}].id`, c.id);
                formData.append(`category[${i}].name`, c.name);
            });

        return formData;
    }

    protected override buildEntityToUpdate(): unknown {
        const { id, title, description, synopsis, recommended, tags } = this.form.getRawValue();
        const categories = this.categoryList.filter(c => c.selected);
        return { id, title, description, synopsis, recommended, tags, categories };
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

    toggleSelected(category: Category) {
        category.selected = !category.selected;
    }
}
