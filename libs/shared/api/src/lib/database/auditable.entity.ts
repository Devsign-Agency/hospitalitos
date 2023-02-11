import { Column } from "typeorm";
import { Auditable } from '@kaad/shared/ng-common';

export abstract class AuditableEntity implements Auditable {
    @Column({ type: "timestamptz", default: () => "CURRENT_TIMESTAMP" })
    createdAt: Date;

    @Column({ type: "timestamptz", default: () => "CURRENT_TIMESTAMP", onUpdate: "CURRENT_TIMESTAMP" })
    updatedAt: Date;
}
