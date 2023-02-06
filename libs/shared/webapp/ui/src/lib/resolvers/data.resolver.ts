import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';
import { Observable, of } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class DataResolver implements Resolve<string> {

    resolve(route: ActivatedRouteSnapshot): Observable<string> {
      return of(route.paramMap.get('id') || '');
    }
}
