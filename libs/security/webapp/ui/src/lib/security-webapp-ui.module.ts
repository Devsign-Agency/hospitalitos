import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { securityWebappUiRoutes } from './security-webapp-ui.routes';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(securityWebappUiRoutes)
    ],
})
export class SecurityWebappUiModule {}
