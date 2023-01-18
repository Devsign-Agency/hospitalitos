export interface Session {
    id: string;
    ip: string;
    user: string;
    refreshToken: string;
    expiresAt: Date;
}
