/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { AuthStravaService } from './auth-strava.service';

describe('Service: AuthStrava', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AuthStravaService]
    });
  });

  it('should ...', inject([AuthStravaService], (service: AuthStravaService) => {
    expect(service).toBeTruthy();
  }));
});
