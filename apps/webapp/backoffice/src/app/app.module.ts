import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NxWelcomeComponent } from './nx-welcome.component';
import { RouterModule } from '@angular/router';
import { appRoutes } from './app.routes';
import { ConfigWebappCoreModule } from '@kaad/config/webapp/core';
import { environment } from '../environments/environment';

@NgModule({
    declarations: [AppComponent, NxWelcomeComponent],
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
