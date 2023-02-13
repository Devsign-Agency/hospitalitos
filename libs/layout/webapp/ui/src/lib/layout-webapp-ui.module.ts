import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { AsideComponent } from './components/aside/aside.component';
import { BreadcrumbComponent } from './components/breadcrumb/breadcrumb.component';
import { FooterComponent } from './components/footer/footer.component';
import { HeaderComponent } from './components/header/header.component';
import { MenuComponent } from './components/menu/menu.component';
import { ModalComponent } from './components/modal/modal.component';
import { PaginationComponent } from './components/pagination/pagination.component';
import { ToastComponent } from './components/toast/toast.component';
import { MainComponent } from './layouts/main/main.component';
import { SecurityComponent } from './layouts/security/security.component';
import { ListView } from './views/list/list.view';
import { ContentDirective } from './directives/content.directive';
import { DetailView } from './views/detail/detail.view';
import { FormView } from './views/form/form.view';

@NgModule({
    imports: [CommonModule, FormsModule, ReactiveFormsModule, RouterModule],
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
        ListView,
        ContentDirective,
        DetailView,
        FormView,
    ],
    exports: [
        AsideComponent,
        HeaderComponent,
        MainComponent,
        ModalComponent,
        PaginationComponent,
        SecurityComponent,
        ToastComponent,
        ListView,
        ContentDirective,
        DetailView,
        FormView,
    ],
})
export class LayoutWebappUiModule {}
