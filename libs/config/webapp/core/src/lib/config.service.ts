import { Injectable, Optional } from '@angular/core';
import { Config } from './config';

@Injectable({
    providedIn: 'root',
})
export class ConfigService extends Config {
    private config: Config = new Config();

    constructor(@Optional() config: Config) {
        super();
        console.log('POR ACÁ');
        if (config) {
            this.options = config;
        }
    }

    set options(opt: Config) {
        (Object.keys(opt) as (keyof typeof opt)[]).forEach(key => {
            this.config[key] = opt[key] ? opt[key] : this.config[key];
        });
    }
}