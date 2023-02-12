import { Directive, Input, TemplateRef } from '@angular/core';

@Directive({
    // eslint-disable-next-line @angular-eslint/directive-selector
    selector: '[templateContent]'
})
export class ContentDirective {

    @Input() id: string;

    get template() {
        return this.templateRef;
    }

    constructor(private templateRef: TemplateRef<never>) {}

}
