import { Book } from "@kaad/multimedia/ng-common";
import { Column, Entity } from "typeorm";
import { MultimediaEntity } from "../../common/entities/multimedia.entity";

@Entity({ schema: 'multimedia', name: 'book' })
export class BookEntity extends MultimediaEntity implements Book {
    @Column({ unique: true, nullable: false })
    code: string;
}
