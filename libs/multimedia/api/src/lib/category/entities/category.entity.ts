import { Category } from "@kaad/multimedia/ng-common";
import { BaseEntity } from "@kaad/shared/api";
import { Column, Entity } from "typeorm";

@Entity({ schema: 'multimedia', name: 'category' })
export class CategoryEntity extends BaseEntity implements Category {
    @Column({ unique: true, nullable: false })
    name: string;
}
