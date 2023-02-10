import { Auditable } from "@kaad/shared/ng-common";
export interface User extends Auditable {
    id: string;
    username: string;
    email: string;
    emailVerified: boolean;
    firstname: string;
    lastname: string;
    photoUrl: string;
    role?: string[];
    status?: string;
    documentId: string;
    googleId: string;
}
