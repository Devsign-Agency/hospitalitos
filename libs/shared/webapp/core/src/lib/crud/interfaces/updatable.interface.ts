import { Observable } from "rxjs";

export interface Updatable<T> {
    update: (id: string, item: unknown) => Observable<T>;
}
