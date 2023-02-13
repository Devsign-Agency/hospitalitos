import { Auditable } from './auditable.interface';
import { HasId } from './has-id.interface';

export interface BaseDataBase extends Auditable, HasId {
}