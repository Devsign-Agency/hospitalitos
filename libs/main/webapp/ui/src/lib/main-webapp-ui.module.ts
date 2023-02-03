import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MainWebappUiComponent } from './main-webapp-ui.component';
import { mainWebappUiRoutes } from './main-webapp-ui.routes';
import { RouterModule } from '@angular/router';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';

@NgModule({
    imports: [
        CommonModule,
        LayoutWebappUiModule,
        RouterModule.forChild(mainWebappUiRoutes),
    ],
    declarations: [MainWebappUiComponent],
})
export class MainWebappUiModule { }
