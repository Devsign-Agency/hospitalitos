import { IPageMeta } from "./page-meta";

export interface IPage<T> {
    readonly data: T[];
    readonly meta: IPageMeta;
}
