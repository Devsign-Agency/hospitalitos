import { Role } from "@kaad/security/ng-common";
import { BaseEntity } from "@kaad/shared/api";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ schema: 'security', name: 'role' })
export class RoleEntity extends BaseEntity implements Role {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column({ unique: true, nullable: false })
    code: string;

    @Column({ unique: true, nullable: false })
    name: string;
}
