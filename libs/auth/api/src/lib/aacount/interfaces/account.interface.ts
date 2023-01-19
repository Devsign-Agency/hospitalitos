
export interface Account {
    id: string;
    user: string;
    createdAt: Date;
    verifiedAt: Date;
    verificationCode: string;
}
