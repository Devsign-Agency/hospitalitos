import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { MultimediaWebappUiComponent } from './multimedia-webapp-ui.component';
import { multimediaWebappUiRoutes } from './multimedia-webapp-ui.routes';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(multimediaWebappUiRoutes),
    ],
    declarations: [
        MultimediaWebappUiComponent
    ]
})
export class MultimediaWebappUiModule {}
