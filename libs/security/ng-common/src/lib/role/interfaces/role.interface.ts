import { BaseDataBase } from "@kaad/shared/ng-common";

export interface Role extends BaseDataBase {
    id: string;
    name: string;
    code: string;
}
