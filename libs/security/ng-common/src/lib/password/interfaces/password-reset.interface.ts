import { BaseDataBase } from "@kaad/shared/ng-common";

export interface PasswordReset extends BaseDataBase {
    id: string;
    userId: string;
    createdAt: Date;
    code: string;
}
