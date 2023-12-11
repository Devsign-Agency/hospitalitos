import { BaseDataBase } from "@kaad/shared/ng-common";

export interface Session extends BaseDataBase {
    id: string;
    ip: string;
    user: string;
    refreshToken: string;
    expiresAt: Date;
}
