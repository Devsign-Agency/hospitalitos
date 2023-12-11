import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { authWebappUiRoutes } from './auth-webapp-ui.routes';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';
import { AuthWebappUiComponent } from './auth-webapp-ui.component';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';
import { CallbackComponent } from './views/callback/callback.component';
import { LogoutComponent } from './views/logout/logout.component';
import { ForgotPasswordComponent } from './views/forgot-password/forgot-password.component';
import { UpdatePasswordComponent } from './views/update-password/update-password.component';
import { NotificationComponent } from './views/notification/notification.component';

@NgModule({
    imports: [
        CommonModule,
        LayoutWebappUiModule,
        RouterModule.forChild(authWebappUiRoutes),
        SharedWebappUiModule,
    ],
    declarations: [
        LoginComponent,
        RegisterComponent,
        AuthWebappUiComponent,
        CallbackComponent,
        LogoutComponent,
        ForgotPasswordComponent,
        UpdatePasswordComponent,
        NotificationComponent,
    ],
})
export class AuthWebappUiModule {}
