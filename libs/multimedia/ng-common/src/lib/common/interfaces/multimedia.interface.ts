import { BaseDataBase } from "@kaad/shared/ng-common";

export interface Multimedia extends BaseDataBase {
    id: string;
    name: string;
    description: string;
    tags: string[];
}
