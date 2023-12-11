import { Page as IPage } from "@kaad/shared/ng-common";
import { ApiProperty } from "@nestjs/swagger";
import { PageMeta } from "./page-meta";

export class Page<T> implements IPage<T> {

    @ApiProperty({ isArray: true })
    readonly data: T[];

    @ApiProperty({ type: () => PageMeta })
    readonly meta: PageMeta;

    constructor(data: T[], meta: PageMeta) {
        this.data = data;
        this.meta = meta;
    }
}
