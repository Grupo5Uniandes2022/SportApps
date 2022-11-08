import { Component, OnInit, OnDestroy } from '@angular/core';

import { Observable, Subscription } from 'rxjs';
import {Meal, MealsService} from '../../../shared/services/meals.service';
import {Store} from '../../../../store';

;


@Component({
  selector: 'app-plans',
  templateUrl: './plans.component.html',
  styleUrls: ['./plans.component.scss']
})
export class PlansComponent implements OnInit, OnDestroy {

  meals$: Observable<Meal[]>;
  subscription: Subscription;
  roleStrava: String;

  constructor(private store: Store,
              private mealsService: MealsService) {}

  ngOnInit() {
    this.meals$ = this.store.select<Meal[]>('meals');
    this.subscription = this.mealsService.meals$.subscribe();
    this.roleStrava = this.readLocalStorageValue('token');
  }

  readLocalStorageValue(key: string): string {
    return localStorage.getItem(key);
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  removeMeal(event: Meal) {
    this.mealsService.removeMeal(event.key);
  }

}
