import { Routes } from "@angular/router";
import { AuthWebappUiComponent } from "./auth-webapp-ui.component";
import { CallbackComponent } from "./views/callback/callback.component";
import { ForgotPasswordComponent } from "./views/forgot-password/forgot-password.component";
import { LoginComponent } from "./views/login/login.component";
import { LogoutComponent } from "./views/logout/logout.component";
import { NotificationComponent } from "./views/notification/notification.component";
import { RegisterComponent } from "./views/register/register.component";
import { UpdatePasswordComponent } from "./views/update-password/update-password.component";

export const authWebappUiRoutes: Routes = [{
    path: '',
    component: AuthWebappUiComponent,
    children: [
        { path: 'callback', component: CallbackComponent },
        { path: 'login', component: LoginComponent },
        { path: 'logout', component: LogoutComponent },
        { path: 'register', component: RegisterComponent },
        { path: 'forgot-password', component: ForgotPasswordComponent },
        { path: 'update-password/:validationCode', component: UpdatePasswordComponent },
        { path: 'notification/:code', component: NotificationComponent }
    ]
}];
