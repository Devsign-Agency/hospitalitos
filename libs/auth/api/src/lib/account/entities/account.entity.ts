import { BaseEntity } from "@kaad/shared/api";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
import { Account } from "../interfaces/account.interface";

@Entity('account', { schema: 'auth' })
export class AccountEntity extends BaseEntity implements Account {
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
