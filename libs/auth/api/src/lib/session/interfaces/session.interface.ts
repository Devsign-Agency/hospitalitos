import { Auditable } from "@kaad/shared/ng-common";

export interface Session extends Auditable {
    id: string;
    ip: string;
    user: string;
    refreshToken: string;
    expiresAt: Date;
}
