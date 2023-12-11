import { Injectable, Optional } from '@angular/core';
import { Config } from './config';

@Injectable({
    providedIn: 'root',
})
export class ConfigService extends Config {

    constructor(@Optional() config: Config) {
        super();
        if (config) {
            this.options = config;
        }
    }

    set options(opt: Config) {
        (Object.keys(opt) as (keyof typeof opt)[]).forEach(key => {
            this[key] = opt[key] ? opt[key] : this[key];
        });
    }
}
