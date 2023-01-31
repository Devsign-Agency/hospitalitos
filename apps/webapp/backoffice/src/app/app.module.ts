import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { RouterModule } from '@angular/router';
import { ConfigWebappCoreModule } from '@kaad/config/webapp/core';
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
        RouterModule.forRoot(appRoutes, {
            initialNavigation: 'enabledBlocking',
        }),
    ],
    providers: [],
    bootstrap: [AppComponent],
})
export class AppModule {}
