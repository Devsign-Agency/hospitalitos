import { Category } from "@kaad/commons/ng-common";
import { BaseDataBase } from "@kaad/shared/ng-common";
export interface User extends BaseDataBase {
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
    preferences?: Category[];
}
