import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class LoadingService {

    private visible: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
    public visible$: Observable<boolean> = this.visible.asObservable();

    show() {
        console.log('show');
        this.visible.next(true);
    }

    hide() {
        console.log('hide');
        this.visible.next(false);
    }
}
