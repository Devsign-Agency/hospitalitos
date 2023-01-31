import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { routes } from './auth-webapp-ui.routes';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(routes),
        SharedWebappUiModule
    ],
    declarations: [
        LoginComponent,
        RegisterComponent
    ],
})
export class AuthWebappUiModule {}
