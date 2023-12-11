import { ApiPropertyOptional } from '@nestjs/swagger';
import { PageOptions } from '../pagination/page-options';
import { SearchOptions as ISearchOptions } from '@kaad/shared/ng-common';

export class SearchOptions extends PageOptions implements ISearchOptions {

    @ApiPropertyOptional({
        default: ''
    })
    readonly criteria: string = '';

}
