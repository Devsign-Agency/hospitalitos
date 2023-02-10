import { Role } from "@kaad/security/ng-common";
import { AuditableEntity } from "@kaad/shared/ng-common";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ schema: 'security', name: 'role' })
export class RoleEntity extends AuditableEntity implements Role {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column({ unique: true, nullable: false })
    code: string;

    @Column({ unique: true, nullable: false })
    name: string;
}
