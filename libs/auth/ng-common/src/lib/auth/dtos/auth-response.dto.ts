import { User } from "@kaad/security/api";

export interface AuthResponse {
    userId: string;
    user: User;
    accessToken: string;
    refreshToken: string;
}
