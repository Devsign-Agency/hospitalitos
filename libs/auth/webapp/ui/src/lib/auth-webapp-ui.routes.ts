import { Routes } from "@angular/router";
import { AuthWebappUiComponent } from "./auth-webapp-ui.component";
import { LoginComponent } from "./views/login/login.component";
import { RegisterComponent } from "./views/register/register.component";

export const routes: Routes = [{
    path: '',
    component: AuthWebappUiComponent,
    children: [
        { path: 'login', component: LoginComponent },
        { path: 'register', component: RegisterComponent },
    ]
}];
