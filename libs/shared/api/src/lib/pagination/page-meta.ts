import { PageMeta as IPageMeta, IPageMetaParameters } from "@kaad/shared/ng-common";
import { ApiProperty } from "@nestjs/swagger";


export class PageMeta implements IPageMeta {

    @ApiProperty()
    readonly page: number;

    @ApiProperty()
    readonly take: number;

    @ApiProperty()
    readonly itemCount: number;

    @ApiProperty()
    readonly pageCount: number;

    @ApiProperty()
    readonly hasPreviousPage: boolean;

    @ApiProperty()
    readonly hasNextPage: boolean;

    constructor({ pageOptions, itemCount }: IPageMetaParameters) {
        this.page = pageOptions.page;
        this.take = pageOptions.take;
        this.itemCount = itemCount;
        this.pageCount = Math.ceil(this.itemCount / this.take);
        this.hasPreviousPage = this.page > 1;
        this.hasNextPage = this.page < this.pageCount;
    }
}
