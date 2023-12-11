import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AudioComponent } from './audio.component';
import { FormComponent } from './views/form/form.component';
import { ListComponent } from './views/list/list.component';
import { DetailComponent } from './views/detail/detail.component';
import { RouterModule } from '@angular/router';
import { audioRoutes } from './audio.routes';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';

@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(audioRoutes),
        SharedWebappUiModule
    ],
    declarations: [
        AudioComponent,
        FormComponent,
        ListComponent,
        DetailComponent,
    ],
    exports: [AudioComponent],
})
export class AudioModule {}
