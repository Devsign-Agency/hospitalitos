import { Video } from '@kaad/multimedia/ng-common';
import { Column, Entity } from "typeorm";
import { MultimediaEntity } from '../../common/entities/multimedia.entity';

@Entity({ schema: 'multimedia', name: 'video' })
export class VideoEntity extends MultimediaEntity implements Video {
    @Column({ unique: true, nullable: false })
    code: string;
}
