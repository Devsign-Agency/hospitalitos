import { Observable } from "rxjs";

export interface Createable<T> {
    create: (item: unknown) => Observable<T>;
}
