import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';
import { MainWebappUiComponent } from './main-webapp-ui.component';
import { mainWebappUiRoutes } from './main-webapp-ui.routes';

@NgModule({
    imports: [
        CommonModule,
        LayoutWebappUiModule,
        RouterModule.forChild(mainWebappUiRoutes),
    ],
    declarations: [MainWebappUiComponent],
})
export class MainWebappUiModule { }
