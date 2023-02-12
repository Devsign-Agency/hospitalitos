import { Component, ContentChildren, EventEmitter, Input, Output, QueryList } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ContentDirective, DataTableType } from '@kaad/layout/webapp/ui';
import { debounceTime } from 'rxjs';


@Component({
    selector: 'kaad-list-layout',
    templateUrl: './list.view.html',
    styleUrls: ['./list.view.scss'],
})
// eslint-disable-next-line @angular-eslint/component-class-suffix
export class ListView<T> {

    @Input() items: T[] = [];
    @Input() config: DataTableType<T>;
    @Input() page = 1;
    @Input() pageSize = 10;
    @Input() collectionSize = 0;

    @Output() delete: EventEmitter<T> = new EventEmitter<T>();
    @Output() detail: EventEmitter<T> = new EventEmitter<T>();
    @Output() edit: EventEmitter<T> = new EventEmitter<T>();

    @Output() pageChange: EventEmitter<number> = new EventEmitter<number>();
    @Output() search: EventEmitter<string> = new EventEmitter<string>();

    @ContentChildren(ContentDirective) templates: QueryList<ContentDirective>;

    form: FormGroup;
    showConfirmation = false;
    selectedItems: T[] = [];

    constructor(formBuilder: FormBuilder) {
        this.form = formBuilder.group({
            criteria: ['']
        });

        this.form.controls['criteria'].valueChanges.pipe(
            debounceTime(300)
        ).subscribe(this.search.emit)
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
        this.detail.emit(item);
    }

    showEdit(item: T) {
        this.edit.emit(item);
    }

    showDelete(item: T) {
        this.selectedItems.push(item);
        this.showConfirmation = true;
    }

    accept() {
        this.showConfirmation = false;
        const item = this.selectedItems.shift();
        if (item) {
            this.delete.emit(item);
        }
    }

    cancel() {
        this.showConfirmation = false;
    }
}
