import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthStravaService } from '../../../shared/services/auth-strava.service';

@Component({
  selector: 'app-strava-integration',
  templateUrl: './strava-integration.component.html',
  styleUrls: ['./strava-integration.component.css']
})
export class StravaIntegrationComponent implements OnInit {

  constructor(
    private authService: AuthStravaService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.route.queryParams.subscribe((d) => {
      if (d.access_token) {
        this.authService.setAuthenticatedUser(d.access_token);
        this.router.navigate(['profile'])
      }
    })
  }

  ngOnInit(): void {
  }

  initCodeFlow() {
    this.authService.initCodeFlow();
  }

}
