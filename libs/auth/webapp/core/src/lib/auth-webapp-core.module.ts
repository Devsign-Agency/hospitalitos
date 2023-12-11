import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ConfigWebappCoreModule } from '@kaad/config/webapp/core';
import { LayoutWebappCoreModule } from '@kaad/layout/webapp/core';

@NgModule({
    imports: [
        CommonModule,
        ConfigWebappCoreModule,
        LayoutWebappCoreModule
    ]
})
export class AuthWebappCoreModule {}
