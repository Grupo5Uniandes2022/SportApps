import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import {SharedModule} from '../shared/shared.module';
import {ProfileRoutingModule} from './profile-routing.module';
import {PlansComponent} from './containers/plans/plans.component';
import {PlanComponent} from './containers/plan/plan.component';




@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    SharedModule,
    ProfileRoutingModule
  ],
  declarations: [
    PlansComponent,
    PlanComponent,
  ]
})
export class ProfileModule {}
