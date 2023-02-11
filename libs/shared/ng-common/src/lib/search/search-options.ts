import { IPageOptions } from '../pagination/page-options';
export interface ISearchOptions extends IPageOptions {
    criteria: string;
}
