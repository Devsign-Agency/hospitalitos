import { ApiPropertyOptional } from '@nestjs/swagger';
import { PageOptions } from '../pagination/page-options';
export class SearchOptions extends PageOptions {

    @ApiPropertyOptional({
        default: ''
    })
    readonly criteria: string = '';

}
