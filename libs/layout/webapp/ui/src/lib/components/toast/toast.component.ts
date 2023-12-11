import { Component, OnInit } from '@angular/core';
import { ICONS } from '../../icons/svg/icons';
import { ToastService, ToastType } from '../../services/toast.service';

@Component({
    selector: 'kaad-toast',
    templateUrl: './toast.component.html',
    styleUrls: ['./toast.component.scss'],
})
export class ToastComponent implements OnInit {
    title: string | null | undefined;
    message: string | null;
    type: ToastType;
    toastClass = '';
    iconClass = '';
    icons = ICONS;
    show = false;

    constructor(private readonly toastService: ToastService) {
    }

    ngOnInit() {
        this.toastService.toast$.subscribe({
            next: toast => {
                this.message = toast.message;
                this.type = toast.type;
                this.title = toast.title;

                switch (toast.type) {
                    case 'success':
                        this.toastClass = 'bg-green-500 text-white';
                        this.iconClass = 'text-green-500 bg-green-100 dark:bg-green-800 dark:text-green-200';
                        break;
                    case 'danger':
                        this.toastClass = 'bg-red-500 text-white';
                        this.iconClass = 'text-red-500 bg-red-100 dark:bg-red-800 dark:text-red-200';
                        break;
                    case 'warning':
                        this.toastClass = 'bg-yellow-500 text-white';
                        this.iconClass = 'text-yellow-500 bg-yellow-100 dark:bg-yellow-700 dark:text-yellow-200';
                        break;
                }

                this.show = !!toast.visible;

                setTimeout(() => this.show = false, 10000)
            }
        });
    }

    hide() {
        this.show = false;
    }
}
