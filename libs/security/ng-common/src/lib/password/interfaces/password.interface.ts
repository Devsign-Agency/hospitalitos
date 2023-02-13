import { BaseDataBase } from "@kaad/shared/ng-common";
import { User } from "../../user/interfaces/user.interface";

export interface Password extends BaseDataBase {
    id: string;
    user: User;
    date: Date;
    value: string;
    isActive: boolean;
}
