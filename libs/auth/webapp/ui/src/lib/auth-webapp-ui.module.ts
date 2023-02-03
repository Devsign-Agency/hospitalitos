import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { authWebappUiRoutes } from './auth-webapp-ui.routes';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';
import { AuthWebappUiComponent } from './auth-webapp-ui.component';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';

@NgModule({
    imports: [
        CommonModule,
        LayoutWebappUiModule,
        RouterModule.forChild(authWebappUiRoutes),
        SharedWebappUiModule,
    ],
    declarations: [LoginComponent, RegisterComponent, AuthWebappUiComponent],
})
export class AuthWebappUiModule {}
