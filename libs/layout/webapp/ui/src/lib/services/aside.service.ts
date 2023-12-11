import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class AsideService {

    private asideOpened: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(true);
    public asideOpened$: Observable<boolean> = this.asideOpened.asObservable();

    toggleOpenedState() {
        this.asideOpened.next(!this.asideOpened.getValue());
    }
}
