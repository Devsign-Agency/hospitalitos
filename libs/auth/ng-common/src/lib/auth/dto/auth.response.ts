import { User } from "@kaad/security/ng-common";

export interface AuthResponse {
    userId: string;
    user: User;
    accessToken: string;
    refreshToken: string;
}
