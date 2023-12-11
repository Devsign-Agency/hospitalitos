import { ModuleWithProviders, NgModule, Optional, Provider } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Config } from './config';

@NgModule({
    imports: [CommonModule],
})
export class ConfigWebappCoreModule {

    static config(@Optional() config: Partial<Config>): ModuleWithProviders<ConfigWebappCoreModule> {
        const providers: Provider[] = [
            {
                provide: Config,
                useValue: config,
            }
        ];

        return {
            ngModule: ConfigWebappCoreModule,
            providers,
        };
    }

    static forFeature(): ModuleWithProviders<ConfigWebappCoreModule> {
        return {
            ngModule: ConfigWebappCoreModule
        }
    }
}
