
export interface User {
    id: string;
    username: string;
    email: string;
    emailVerified: boolean;
    firstname: string;
    lastname: string;
    photoUrl: string;
    role?: string;
    status?: string;
    documentId: string;
    googleId: string;
}

export const EmptyUser: User = {
    id: '',
    username: '',
    email: '',
    emailVerified: false,
    firstname: '',
    lastname: '',
    photoUrl: '',
    role: '',
    status: '',
    documentId: '',
    googleId: ''
}
