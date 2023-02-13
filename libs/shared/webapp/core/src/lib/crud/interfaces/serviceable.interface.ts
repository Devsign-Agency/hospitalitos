import { Createable } from "./createable.interface";
import { Deletable } from "./deletable.interface";
import { Findable } from "./findable.interface";
import { Updatable } from "./updatable.interface";

export interface Serviceable<T> extends
    Createable<T>, Updatable<T>, Deletable<T>, Findable<T> {

}
