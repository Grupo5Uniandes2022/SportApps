import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-activity-strava',
  templateUrl: './activity-strava.component.html',
  styleUrls: ['./activity-strava.component.css']
})
export class ActivityStravaComponent implements OnInit {

  @Input() activity: any;

  constructor() { }

  ngOnInit() {
  }

}
