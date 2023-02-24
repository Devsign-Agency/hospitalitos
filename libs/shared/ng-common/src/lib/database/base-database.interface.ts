import { Auditable } from './auditable.interface';
import { HasId } from './has-id.interface';
import { Selectable } from './selectable.interface';

export interface BaseDataBase extends Auditable, HasId, Selectable {
}
