import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';

@NgModule({
    imports: [CommonModule],
    declarations: [LoginComponent, RegisterComponent],
})
export class AuthWebappUiModule {}
