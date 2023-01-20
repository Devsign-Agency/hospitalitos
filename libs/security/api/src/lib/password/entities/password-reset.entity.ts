import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
import { PasswordReset } from "../interfaces/password-reset.interface";

@Entity('password-reset', { schema: 'security' })
export class PasswordResetEntity implements PasswordReset {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    userId: string;

    @Column({ nullable: false, type: 'timestamptz', default: () => "CURRENT_TIMESTAMP" })
    createdAt: Date;

    @Column({ nullable: false })
    code: string;
}
