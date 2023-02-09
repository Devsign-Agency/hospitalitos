import { Video } from '@kaad/multimedia/ng-common';
import { AuditableEntity } from '@kaad/shared/ng-common';
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ schema: 'multimedia', name: 'video' })
export class VideoEntity extends AuditableEntity implements Video {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column({ unique: true, nullable: false })
    code: string;

    @Column({ nullable: false })
    name: string;

    @Column({ nullable: true })
    description: string;

    @Column({ unique: true, nullable: false })
    url: string;

    @Column({ type: 'simple-array', nullable: true })
    tags: string[];
}
