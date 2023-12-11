import { User } from "../../user/interfaces/user.interface";

export interface CreatePasswordDto {
    user: User;
    value: string;
}
