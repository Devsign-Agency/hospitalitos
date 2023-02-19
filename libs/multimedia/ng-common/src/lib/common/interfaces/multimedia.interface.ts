import { BaseDataBase } from "@kaad/shared/ng-common";

export interface Multimedia extends BaseDataBase {
    title: string;
    url: string;
    description: string;
    synopsis: string;
    thumbnail: string;
    recommended: boolean;
    tags: string[];
}
