import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { RouterModule } from '@angular/router';
import { FaIconLibrary } from '@fortawesome/angular-fontawesome';
import { fas } from '@fortawesome/free-solid-svg-icons';
import { KS_HTTP_INTERCEPTOR } from '@kaad/auth/webapp/core';
import { ConfigWebappCoreModule } from '@kaad/config/webapp/core';
import { LayoutWebappUiModule } from '@kaad/layout/webapp/ui';
import { SharedWebappUiModule } from '@kaad/shared/webapp/ui';
import { environment } from '../environments/environment';
import { AppComponent } from './app.component';
import { appRoutes } from './app.routes';

@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [
        BrowserModule,
        ConfigWebappCoreModule.config(environment.config),
        LayoutWebappUiModule,
        RouterModule.forRoot(appRoutes, {
            initialNavigation: 'enabledBlocking',
        }),
        SharedWebappUiModule
    ],
    providers: [
        KS_HTTP_INTERCEPTOR,
    ],
    bootstrap: [AppComponent],
})
export class AppModule {
    constructor(library: FaIconLibrary) {
        library.addIconPacks(fas);
    }
}
