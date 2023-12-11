import { TestBed } from '@angular/core/testing';

import { DataResolver } from './data.resolver';

describe('DataResolver', () => {
  let reaolver: DataResolver;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    reaolver = TestBed.inject(DataResolver);
  });

  it('should be created', () => {
    expect(reaolver).toBeTruthy();
  });
});
