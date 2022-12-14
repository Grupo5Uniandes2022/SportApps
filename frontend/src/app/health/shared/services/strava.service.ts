import { Injectable } from '@angular/core';
import { Athlete } from '../../../models/athlete.model';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Activity, ActivityStats } from '../../../models/activity.model';
import { environment } from 'src/environments/environment';
import { Token } from '../../../models/token.model';

@Injectable({
  providedIn: 'root'
})
export class StravaService {
  private athlete$: BehaviorSubject<Athlete> = new BehaviorSubject(JSON.parse(localStorage.getItem('athlete')));

  constructor(
    private http: HttpClient
  ) { }

  public makeAuthenticatedRequest(method: string = 'GET', path: string) {
    let url = `${environment.stravaBaseUrl}/${path}`;
    const token = localStorage.getItem('token');
    return this.http.request(method, url).pipe(
      catchError(this.handleError)
    )
  }

  public authenticateAthlete(code: string): Observable<Token> {
    let url = `${environment.stravaOAuth.tokenEndpoint}?client_id=${environment.stravaOAuth.clientId}&client_secret=${environment.stravaOAuth.dummyClientSecret}&code=${code}&grant_type=${environment.stravaOAuth.grantTypeAuth}`;
    return this.http.post(url, null).pipe(
      catchError(this.handleError)
    ) as Observable<Token>
  }

  public getAuthenticatedAthlete(): Observable<Athlete> {
    return this.makeAuthenticatedRequest('GET', 'athlete') as Observable<Athlete>;
  }

  public getAthleteStats(id: number): Observable<ActivityStats> {
    return this.makeAuthenticatedRequest('GET', `athletes/${id}/stats`) as Observable<ActivityStats>;
  }

  public getActivities(): Observable<Activity[]> {
    return this.makeAuthenticatedRequest('GET', 'athlete/activities') as Observable<Activity[]>;

  }

  private handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      console.error('An error occurred:', error.error.message);
    } else {
      console.error(
        `Backend returned code ${error.status}, ` +
        `body was: ${error.error}`);
    }
    return throwError(
      'Something bad happened; please try again later.');
  };

  public set athlete(value: Athlete) {
    this.athlete$.next(value);
  }

  public get athlete(): Athlete {
    return this.athlete$.value;
  }

}
