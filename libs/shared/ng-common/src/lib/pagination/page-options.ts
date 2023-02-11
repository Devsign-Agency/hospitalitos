import { Order } from "./order.enum";

export interface PageOptions {
    order?: Order;
    page: number;
    take: number;
}
