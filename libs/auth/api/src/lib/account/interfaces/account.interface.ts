import { Auditable } from "@kaad/shared/ng-common";

export interface Account extends Auditable {
    id: string;
    user: string;
    createdAt: Date;
    verifiedAt: Date;
    verificationCode: string;
}
