import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'kaad-video',
    templateUrl: './video.component.html',
})
export class VideoComponent implements OnInit {

    apiLoaded = false;

    ngOnInit(): void {
        if (!this.apiLoaded) {
            const tag = document.createElement('script');
            tag.src = 'https://www.youtube.com/iframe_api';
            document.body.appendChild(tag);
            this.apiLoaded = true;
        }
    }
}
