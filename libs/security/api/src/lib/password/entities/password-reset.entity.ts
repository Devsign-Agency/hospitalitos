import { PasswordReset } from "@kaad/security/ng-common";
import { AuditableEntity } from "@kaad/shared/ng-common";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('password-reset', { schema: 'security' })
export class PasswordResetEntity extends AuditableEntity implements PasswordReset {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    userId: string;

    @Column({ nullable: false, type: 'timestamptz', default: () => "CURRENT_TIMESTAMP" })
    createdAt: Date;

    @Column({ nullable: false })
    code: string;
}
