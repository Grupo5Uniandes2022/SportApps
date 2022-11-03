import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {PlansComponent} from './containers/plans/plans.component';
import {PlanComponent} from './containers/plan/plan.component';
import { IntegrationsComponent } from './containers/integrations/integrations.component';
import { IntegrationsDetailComponent } from './containers/integrations-detail/integrations-detail.component';
import { StravaIntegrationComponent } from './containers/strava-integration/strava-integration.component';


export const ROUTES: Routes = [
  { path: '', component: PlansComponent },
  { path: 'update-plan', component: PlanComponent },
  { path: 'integrations', component: IntegrationsComponent },
  { path: 'strava-details', component: IntegrationsDetailComponent },
  { path: 'strava-auth', component: StravaIntegrationComponent },
];


@NgModule({
  imports: [
    RouterModule.forChild(ROUTES)
  ],
  exports: [ RouterModule ]
})
export class ProfileRoutingModule {}
