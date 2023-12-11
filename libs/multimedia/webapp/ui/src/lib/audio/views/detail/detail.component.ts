import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ConfigService } from '@kaad/config/webapp/core';
import { LoadingService } from '@kaad/layout/webapp/ui';
import { Audio } from '@kaad/multimedia/ng-common';
import { AudioService } from '@kaad/multimedia/webapp/core';
import { AbstractDetailComponent } from '@kaad/shared/webapp/ui';

@Component({
    selector: 'kaad-detail',
    templateUrl: './detail.component.html',
    styleUrls: ['./detail.component.scss'],
})
export class DetailComponent extends AbstractDetailComponent<Audio> {

    constructor(protected override readonly activatedRoute: ActivatedRoute,
        protected override readonly config: ConfigService,
        protected override readonly loading: LoadingService,
        protected readonly videoService: AudioService) {
        super(activatedRoute, config, loading, videoService);
    }
}
