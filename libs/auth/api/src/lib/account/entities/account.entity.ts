import { AuditableEntity } from "@kaad/shared/ng-common";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
import { Account } from "../interfaces/account.interface";

@Entity('account', { schema: 'auth' })
export class AccountEntity extends AuditableEntity implements Account {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    user: string;

    @Column({ type: "timestamptz", nullable: true })
    createdAt: Date;

    @Column({ type: "timestamptz", nullable: true })
    verifiedAt: Date;

    @Column()
    verificationCode: string;
}
