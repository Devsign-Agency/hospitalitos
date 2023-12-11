import { PageOptions } from "./page-options";


export interface IPageMetaParameters {
    pageOptions: PageOptions;
    itemCount: number;
}

export interface PageMeta {
    page: number;
    take: number;
    itemCount: number;
    pageCount: number;
    hasPreviousPage: boolean;
    hasNextPage: boolean;
}
