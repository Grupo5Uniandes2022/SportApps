import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {PlansComponent} from './containers/plans/plans.component';
import {PlanComponent} from './containers/plan/plan.component';


export const ROUTES: Routes = [
  { path: '', component: PlansComponent },
  { path: 'update-plan', component: PlanComponent },
];


@NgModule({
  imports: [
    RouterModule.forChild(ROUTES)
  ],
  exports: [ RouterModule ]
})
export class ProfileRoutingModule {}
