import { Routes } from "@angular/router";
import { AuthWebappUiComponent } from "./auth-webapp-ui.component";
import { CallbackComponent } from "./views/callback/callback.component";
import { LoginComponent } from "./views/login/login.component";
import { RegisterComponent } from "./views/register/register.component";

export const authWebappUiRoutes: Routes = [{
    path: '',
    component: AuthWebappUiComponent,
    children: [
        { path: 'callback', component: CallbackComponent },
        { path: 'login', component: LoginComponent },
        { path: 'register', component: RegisterComponent },
    ]
}];
