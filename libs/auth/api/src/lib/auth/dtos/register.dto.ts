import { User } from "@kaad/security/api";

export interface Register extends Partial<User> {
    username: string;
    password: string;
    email: string;
    firstname: string;
    lastname: string;
    photoUrl: string;
}
