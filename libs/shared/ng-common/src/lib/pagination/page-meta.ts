import { IPageOptions } from "./page-options";


export interface IPageMetaParameters {
    pageOptions: IPageOptions;
    itemCount: number;
}

export interface IPageMeta {
    page: number;
    take: number;
    itemCount: number;
    pageCount: number;
    hasPreviousPage: boolean;
    hasNextPage: boolean;
}
