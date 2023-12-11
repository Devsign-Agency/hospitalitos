import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

export type ToastType = 'success' | 'danger' | 'warning';

export interface Toast {
    message: string;
    type: ToastType;
    title: string | null | undefined;
    visible?: boolean;
}

const emptyToast: Toast = {
    message: '',
    title: null,
    type: 'success',
    visible: false
}

@Injectable({
    providedIn: 'root'
})
export class ToastService {

    private toast: BehaviorSubject<Toast> = new BehaviorSubject<Toast>(emptyToast);
    public toast$: Observable<Toast> = this.toast.asObservable();

    private show(toast: Toast) {
        this.toast.next(toast);
    }

    showSuccess(message: string, title?: string) {
        const toast: Toast = {
            type: 'success',
            message,
            title,
            visible: true
        }
        this.show(toast);
    }

    showDanger(message: string, title?: string) {
        const toast: Toast = {
            type: 'danger',
            message,
            title,
            visible: true
        }
        this.show(toast);
    }

    showWarning(message: string, title?: string) {
        const toast: Toast = {
            type: 'warning',
            message,
            title,
            visible: true
        }
        this.show(toast);
    }
}
