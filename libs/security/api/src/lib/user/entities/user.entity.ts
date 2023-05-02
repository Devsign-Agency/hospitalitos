import { Password, User } from "@kaad/security/ng-common";
import { BaseEntity } from "@kaad/shared/api";
import { Column, Entity, JoinTable, ManyToMany, OneToMany } from "typeorm";
import { PasswordEntity } from "../../password/entities/password.entity";
import { CategoryEntity } from "@kaad/commons/api";
import { Category } from "@kaad/commons/ng-common";

@Entity('user', { schema: 'security' })
export class UserEntity extends BaseEntity implements User {
    @Column({ nullable: true })
    documentId: string;

    @Column({ unique: true, nullable: false })
    username: string;

    @Column({ unique: true, nullable: false })
    email: string;

    @Column({ name: 'email_verified', default: false })
    emailVerified: boolean;

    @Column({ nullable: true })
    firstname: string;

    @Column({ nullable: true })
    lastname: string;

    @Column({ nullable: true })
    photoUrl: string;

    @Column({ type: 'simple-array', nullable: true })
    role: string[];

    @OneToMany(() => PasswordEntity, (password: PasswordEntity) => password.user)
    passwords?: Password[];

    @Column({ nullable: true })
    googleId: string;

    @ManyToMany(() => CategoryEntity)
    @JoinTable({ name: 'user-preference' })
    preferences: Category[]
}
