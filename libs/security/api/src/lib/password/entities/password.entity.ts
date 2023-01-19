import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { UserEntity } from "../../user/entities/user.entity";
import { User } from "../../user/interfaces/user.interface";
import { Password } from "../interfaces/password.interface";

@Entity('password', { schema: 'security' })
export class PasswordEntity implements Password {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @ManyToOne(() => UserEntity, (user: UserEntity) => user.passwords, { cascade: true, onDelete: 'CASCADE' })
    user: User;

    @Column({ nullable: false, type: 'timestamptz', default: () => "CURRENT_TIMESTAMP" })
    date: Date;

    @Column({ nullable: false })
    value: string;

    @Column({ default: true })
    isActive: boolean;
}
