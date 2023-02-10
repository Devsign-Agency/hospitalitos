import { Auditable } from "@kaad/shared/ng-common";

export interface Role extends Auditable {
    id: string;
    name: string;
    code: string;
}
