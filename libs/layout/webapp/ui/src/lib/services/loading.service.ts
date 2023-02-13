import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class LoadingService {

    private visible: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(true);
    public visible$: Observable<boolean> = this.visible.asObservable();

    show() {
        this.visible.next(true);
    }

    hide() {
        this.visible.next(false);
    }
}
