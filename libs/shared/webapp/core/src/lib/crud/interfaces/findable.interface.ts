import { Page } from "@kaad/shared/ng-common";
import { Observable } from "rxjs";

export interface Findable<T> {
    findAll: (page: number, take: number, criteria: string) => Observable<Page<T>>;
    findById: (id: string) => Observable<T>;
}
