import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { VideoComponent } from './video.component';
import { videoRoutes } from './video.routes';
import { DetailComponent } from './views/detail/detail.component';
import { FormComponent } from './views/form/form.component';
import { ListComponent } from './views/list/list.component';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(videoRoutes),
        SharedWebappUiModule
    ],
    declarations: [
        VideoComponent,
        ListComponent,
        DetailComponent,
        FormComponent,
    ],
    exports: [VideoComponent],
})
export class VideoModule {}
