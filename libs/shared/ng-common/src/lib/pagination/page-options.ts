import { ApiPropertyOptional } from "@nestjs/swagger";
import { Order } from "./order.enum";

export interface IPageOptions {
    order?: Order;
    page: number;
    take: number;
}

export class PageOptions implements IPageOptions {
    constructor(options: IPageOptions) {
        this.order = options.order || Order.ASC;
        this.page = options.page;
        this.take = options.take;
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
