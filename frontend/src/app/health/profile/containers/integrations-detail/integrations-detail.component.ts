import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-integrations-detail',
  templateUrl: './integrations-detail.component.html',
  styleUrls: ['./integrations-detail.component.css']
})
export class IntegrationsDetailComponent implements OnInit {

  @Input() data: any;

  constructor() { }

  ngOnInit() {
  }

}
