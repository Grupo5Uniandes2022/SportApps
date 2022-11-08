import { Component, OnInit, OnDestroy } from '@angular/core';

import { Observable, Subscription } from 'rxjs';

import { Store } from '@app/store';
import { Service, ServicesService } from '@app/health/shared/services/services.service';


@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.scss']
})
export class ServicesComponent implements OnInit, OnDestroy {

  services$: Observable<Service[]>;
  subscription: Subscription;

  constructor(private store: Store,
              private servicesService: ServicesService) {}

  ngOnInit() {
    this.services$ = this.store.select<Service[]>('services');
    this.subscription = this.servicesService.services$.subscribe();
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  removeService(event: Service) {
    this.servicesService.removeService(event.key);
  }

}
