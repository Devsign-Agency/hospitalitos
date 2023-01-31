import { User } from "@kaad/security/api";

export interface JwtPayload {
    iss: string;
    sub: string;
    exp: number;
    iat: number;
    username: string;
    data: { user: Partial<User> }
}
