import { BaseDataBase } from "@kaad/shared/ng-common";

export interface Account extends BaseDataBase {
    id: string;
    user: string;
    createdAt: Date;
    verifiedAt: Date;
    verificationCode: string;
}
