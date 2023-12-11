import { PageOptions as IPageOptions, Order } from "@kaad/shared/ng-common";
import { ApiPropertyOptional } from "@nestjs/swagger";

export class PageOptions implements IPageOptions {
    constructor(options: IPageOptions) {
        this.order = options.order || Order.ASC;
        this.page = options.page || 1;
        this.take = options.take || 10;
    }

    @ApiPropertyOptional({ enum: Order, default: Order.ASC })
    readonly order?: Order = Order.ASC;

    @ApiPropertyOptional({
        minimum: 1,
        default: 1,
    })
    readonly page: number = 1;

    @ApiPropertyOptional({
        minimum: 1,
        maximum: 50,
        default: 10,
    })
    readonly take: number = 10;

    get skip(): number {
        return (this.page - 1) * this.take;
    }
}
