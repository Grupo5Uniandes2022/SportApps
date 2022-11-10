import { Component, Input, Output, EventEmitter, ChangeDetectionStrategy, OnInit } from '@angular/core';

import { Meal } from '@app/health/shared/services/meals.service';
import { Workout } from '@app/health/shared/services/workouts.service';
import { DatePipe } from '@angular/common';
import {HttpClient, HttpHeaders} from "@angular/common/http";


@Component({
  selector: 'app-schedule-assign',
  templateUrl: './schedule-assign.component.html',
  styleUrls: ['./schedule-assign.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class ScheduleAssignComponent implements OnInit {

  private selected: string[] = [];

  @Input()
  section: any;

  @Input()
  list: null;

  @Input()
  date: Date;

  @Output()
  update = new EventEmitter<any>();

  @Output()
  cancel = new EventEmitter<any>();

  constructor(private datePipe: DatePipe, private http: HttpClient) {}

  ngOnInit() {
    this.selected = []; // [...this.section.assigned];
  }

  toggleItem(id: string) {
    if (this.exists(id)) {
      this.selected = this.selected.filter(item => item !== id);
    } else {
      this.selected = [...this.selected, id];
    }
  }

  getRoute(name: string) {
    return [`../${name}/new`];
  }

  exists(name: string) {
    return !!~this.selected.indexOf(name);
  }

  updateAssign() {
    console.log(this.selected);
    // tslint:disable-next-line:max-line-length
    const token = localStorage.getItem('tokenAuth');
    const headers = new HttpHeaders()
      .set('Content-Type' , 'application/json')
      .set('Authorization' , 'Bearer ' + token );

    const body = {
      startDate:  this.datePipe.transform(this.date, 'yyyy-MM-dd'),
      endDate:  this.datePipe.transform(this.date, 'yyyy-MM-dd')
    };

    this.http.put<any>('http://localhost:3000/api/events/' + this.selected[0] , body, { headers })
      .toPromise().then((data: any) => {
      // this.router.navigate(['/workouts']);
    });
  }

  cancelAssign() {
    this.cancel.emit();
  }

  getEventsFromSection(list: any, type: string ) {
      if (type === 'workouts') {
        return list.filter(item => item.type === 'training');
      } else {
        return list.filter(item => item.type === 'appointment');
      }
  }

}
