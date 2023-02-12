import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { multimediaWebappUiRoutes } from './multimedia-webapp-ui.routes';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(multimediaWebappUiRoutes),
    ],
})
export class MultimediaWebappUiModule {}
