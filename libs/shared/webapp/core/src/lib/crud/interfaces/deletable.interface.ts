import { Observable } from "rxjs";

export interface Deletable<T> {
    delete: (id: string) => Observable<T>
}
