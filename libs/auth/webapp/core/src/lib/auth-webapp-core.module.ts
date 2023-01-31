import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ConfigWebappCoreModule } from '@kaad/config/webapp/core';

@NgModule({
    imports: [
        CommonModule,
        ConfigWebappCoreModule,
        HttpClientModule
    ],
})
export class AuthWebappCoreModule {}
