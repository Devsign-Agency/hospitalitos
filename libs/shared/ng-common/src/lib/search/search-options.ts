import { PageOptions } from '../pagination/page-options';
export interface SearchOptions extends PageOptions {
    criteria: string;
}
