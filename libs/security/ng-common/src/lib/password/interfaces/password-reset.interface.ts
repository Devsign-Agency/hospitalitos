import { Auditable } from "@kaad/shared/ng-common";

export interface PasswordReset extends Auditable {
    id: string;
    userId: string;
    createdAt: Date;
    code: string;
}
