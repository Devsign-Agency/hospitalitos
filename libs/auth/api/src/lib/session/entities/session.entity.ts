import { BaseEntity } from "@kaad/shared/api";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
import { Session } from "../interfaces/session.interface";


@Entity('session', { schema: 'auth' })
export class SessionEntity extends BaseEntity implements Session {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    ip: string;

    @Column()
    user: string;

    @Column()
    refreshToken: string;

    @Column({ type: "timestamptz" })
    expiresAt: Date;
}
