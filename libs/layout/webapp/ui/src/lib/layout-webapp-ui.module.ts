import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { AsideComponent } from './components/aside/aside.component';
import { MenuComponent } from './components/menu/menu.component';
import { MainComponent } from './layouts/main/main.component';
import { SecurityComponent } from './layouts/security/security.component';
import { RouterModule } from '@angular/router';
import { ToastComponent } from './components/toast/toast.component';
import { BreadcrumbComponent } from './components/breadcrumb/breadcrumb.component';
import { PaginationComponent } from './components/pagination/pagination.component';
import { ModalComponent } from './components/modal/modal.component';

@NgModule({
    imports: [CommonModule, RouterModule],
    declarations: [
        AsideComponent,
        BreadcrumbComponent,
        FooterComponent,
        HeaderComponent,
        MainComponent,
        MenuComponent,
        ModalComponent,
        PaginationComponent,
        SecurityComponent,
        ToastComponent,
    ],
    exports: [
        AsideComponent,
        HeaderComponent,
        MainComponent,
        ModalComponent,
        PaginationComponent,
        SecurityComponent,
        ToastComponent,
    ],
})
export class LayoutWebappUiModule {}
