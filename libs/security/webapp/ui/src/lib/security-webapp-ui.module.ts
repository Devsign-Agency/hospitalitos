import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { securityWebappUiRoutes } from './security-webapp-ui.routes';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(securityWebappUiRoutes),
        SharedWebappUiModule
    ],
})
export class SecurityWebappUiModule {}
