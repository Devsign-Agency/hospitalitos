import { BaseDataBase } from '@kaad/shared/ng-common';
import { PrimaryGeneratedColumn } from "typeorm";
import { AuditableEntity } from "./auditable.entity";

export abstract class BaseEntity extends AuditableEntity implements BaseDataBase {
    @PrimaryGeneratedColumn('uuid')
    id: string;
}
