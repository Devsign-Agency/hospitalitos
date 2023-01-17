import { User } from "../../user/interfaces/user.interface";

export class CreatePasswordDto {
    user: User;
    value: string;
}
