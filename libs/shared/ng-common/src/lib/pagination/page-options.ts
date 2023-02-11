import { Order } from "./order.enum";

export interface IPageOptions {
    order?: Order;
    page: number;
    take: number;
}
