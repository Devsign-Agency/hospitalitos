import { Component, EventEmitter, Input, OnChanges, Output, SimpleChanges } from '@angular/core';

@Component({
    selector: 'kaad-pagination',
    templateUrl: './pagination.component.html',
    styleUrls: ['./pagination.component.scss'],
})
export class PaginationComponent {
    @Input() collectionSize = 0;
    @Input() page = 1;
    @Input() pageSize = 10;
    @Output() pageChange: EventEmitter<number> = new EventEmitter<number>();

    get array() {
        return Array.from(Array(this.pageCount).keys()).map(x => x + 1);
    }

    get pageCount() {
        return Math.ceil(this.collectionSize / this.pageSize);
    }

    get hasPrevPage() {
        return this.page > 1;
    }

    get hasNextPage() {
        return this.page < this.pageCount;
    }

    nextPage() {
        this.page++;
        this.emitEvent();
    }

    prevPage() {
        this.page--;
        this.emitEvent();
    }

    gotoPage(page: number) {
        this.page = page;
        this.emitEvent();
    }

    emitEvent() {
        this.pageChange.emit(this.page);
    }
}
