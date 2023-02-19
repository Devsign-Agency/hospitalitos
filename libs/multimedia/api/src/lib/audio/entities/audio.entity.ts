import { Audio } from '@kaad/multimedia/ng-common';
import { Column, Entity } from "typeorm";
import { MultimediaEntity } from '../../common/entities/multimedia.entity';

@Entity({ schema: 'multimedia', name: 'video' })
export class AudioEntity extends MultimediaEntity implements Audio {
    @Column({ unique: true, nullable: false })
    code: string;
}
