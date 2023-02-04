import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { AsideComponent } from './components/aside/aside.component';
import { MenuComponent } from './components/menu/menu.component';
import { MainComponent } from './layouts/main/main.component';
import { SecurityComponent } from './layouts/security/security.component';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { RouterModule } from '@angular/router';
import { ToastComponent } from './components/toast/toast.component';

@NgModule({
    imports: [CommonModule, RouterModule, SharedWebappUiModule],
    declarations: [
        HeaderComponent,
        FooterComponent,
        AsideComponent,
        MenuComponent,
        MainComponent,
        SecurityComponent,
        ToastComponent,
    ],
    exports: [
        AsideComponent,
        HeaderComponent,
        MainComponent,
        SecurityComponent,
        ToastComponent,
    ],
})
export class LayoutWebappUiModule {}
