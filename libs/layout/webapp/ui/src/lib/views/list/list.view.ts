import { Component, ContentChildren, EventEmitter, Input, Output, QueryList } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { HasId } from '@kaad/shared/ng-common';
import { debounceTime } from 'rxjs';
import { ContentDirective } from '../../directives/content.directive';
import { DataTableType } from '../../types/data-table.type';


@Component({
    selector: 'kaad-list-view',
    templateUrl: './list.view.html',
    styleUrls: ['./list.view.scss'],
})
// eslint-disable-next-line @angular-eslint/component-class-suffix
export class ListView<T extends HasId> {

    @Input() items: T[] = [];
    @Input() config: DataTableType<T>;
    @Input() page = 1;
    @Input() pageSize = 10;
    @Input() collectionSize = 0;

    @Output() delete: EventEmitter<string> = new EventEmitter<string>();
    @Output() detail: EventEmitter<string> = new EventEmitter<string>();
    @Output() edit: EventEmitter<string> = new EventEmitter<string>();

    @Output() pageChange: EventEmitter<number> = new EventEmitter<number>();
    @Output() search: EventEmitter<string> = new EventEmitter<string>();

    @ContentChildren(ContentDirective) templates: QueryList<ContentDirective>;

    form: FormGroup;
    showConfirmation = false;
    selectedIds: string[] = [];

    constructor(formBuilder: FormBuilder) {
        this.form = formBuilder.group({
            criteria: ['']
        });

        this.form.controls['criteria'].valueChanges.pipe(
            debounceTime(300)
        ).subscribe({
            next: value => {
                console.log(value);
                this.search.emit(value);
            }
        });
    }

    getTemplate(id?: string) {
        if (!id) { return null; }

        return this.templates ? this.templates.find((t: ContentDirective) => t.id === id) : null;
    }

    gotoPage(page: number) {
        this.page = page;
        this.pageChange.emit(this.page);
    }

    showDetail(item: T) {
        this.detail.emit(item.id);
    }

    showEdit(item: T) {
        this.edit.emit(item.id);
    }

    showDelete(item: T) {
        this.selectedIds.push(item.id);
        this.showConfirmation = true;
    }

    accept() {
        this.showConfirmation = false;
        const id = this.selectedIds.shift();
        if (id) {
            this.delete.emit(id);
        }
    }

    cancel() {
        this.showConfirmation = false;
    }
}
