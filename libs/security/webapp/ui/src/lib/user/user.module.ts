import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserComponent } from './user.component';
import { RouterModule } from '@angular/router';
import { userRoutes } from './user.routes';
import { ListComponent } from './views/list/list.component';

@NgModule({
    imports: [CommonModule, RouterModule.forChild(userRoutes)],
    declarations: [UserComponent, ListComponent],
    exports: [UserComponent],
})
export class UserModule {}
