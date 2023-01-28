import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { PasswordEntity } from "../../password/entities/password.entity";
import { Password } from "../../password/interfaces/password.interface";
import { User } from "../interfaces/user.interface";

@Entity('user', { schema: 'security' })
export class UserEntity implements User {
    @PrimaryGeneratedColumn('uuid')
    id: string;

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

    @OneToMany(() => PasswordEntity, (password: PasswordEntity) => password.user)
    passwords?: Password[];

    @Column({ nullable: true })
    googleId: string;
}
