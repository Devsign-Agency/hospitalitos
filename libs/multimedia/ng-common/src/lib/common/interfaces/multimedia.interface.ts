import { Auditable } from "@kaad/shared/ng-common";

export interface Multimedia extends Auditable {
    id: string;
    name: string;
    description: string;
    tags: string[];
}
