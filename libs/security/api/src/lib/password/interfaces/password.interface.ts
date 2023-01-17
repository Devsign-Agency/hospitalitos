import { User } from "../../user/interfaces/user.interface";

export interface Password {
    id: string;
    user: User;
    date: Date;
    value: string;
    isActive: boolean;
}
