import { Auditable } from "@kaad/shared/ng-common";
import { User } from "../../user/interfaces/user.interface";

export interface Password extends Auditable {
    id: string;
    user: User;
    date: Date;
    value: string;
    isActive: boolean;
}
