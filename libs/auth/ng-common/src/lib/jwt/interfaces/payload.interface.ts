import { User } from "@kaad/security/ng-common";

export interface JwtPayload {
    iss: string;
    sub: string;
    exp: number;
    iat: number;
    username: string;
    data: { user: Partial<User> }
}
