import { Athlete } from './athlete.model';

export interface Map {
  id: string;
  polyline: string;
  resource_state: number;
  summary_polyline: string;
}

export interface Activity {
  id: number;
  resource_state: number;
}

export interface ActivityStats {
  biggest_ride_distance: number;
  biggest_climb_elevation_distance: number;
  recent_ride_totals: ActivityTotal;
  recent_run_totals: ActivityTotal;
  ytd_ride_totals: ActivityTotal;
  ytd_run_totals: ActivityTotal;
  all_ride_totals: ActivityTotal;
  all_run_totals: ActivityTotal;
}

export interface ActivityTotal {
  count: number;
  distance: number;
  moving_time: number;
  elapsed_time: number;
  elevation_gain: number;
  achievement_count: number;
}

export interface SplitsMetric {
  distance: number;
  elapsed_time: number;
  elevation_difference: number;
  moving_time: number;
  split: number;
  average_speed: number;
  pace_zone: number;
}


export interface Lap {
  id: number;
  resource_state: number;
  name: string;
  activity: Activity;
  athlete: Athlete;
  elapsed_time: number;
  moving_time: number;
  start_date: Date;
  start_date_local: Date;
  distance: number;
  start_index: number;
  end_index: number;
  total_elevation_gain: number;
  average_speed: number;
  max_speed: number;
  average_cadence: number;
  device_watts: boolean;
  average_watts: number;
  lap_index: number;
  split: number;
}

export interface Gear {
  id: string;
  primary: boolean;
  name: string;
  resource_state: number;
  distance: number;
}


export interface HighlightedKudoser {
  destination_url: string;
  display_name: string;
  avatar_url: string;
  show_name: boolean;
}
