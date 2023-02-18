import { Video } from '@kaad/multimedia/ng-common';
import { BaseEntity } from '@kaad/shared/api';
import { Column, Entity } from "typeorm";

@Entity({ schema: 'multimedia', name: 'video' })
export class VideoEntity extends BaseEntity implements Video {
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
