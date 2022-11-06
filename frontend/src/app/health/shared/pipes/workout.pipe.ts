import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'workout'
})
export class WorkoutPipe implements PipeTransform {

  transform(value: any) {
    return value.type === 'cycling'
      ? ` Distancia: ${value.cycling.sets + 'km'}, Duración: ${value.cycling.reps + 'mins'}`
      : ` Distancia: ${value.running.sets + 'km'}, Duración: ${value.running.reps + 'mins'}`;
  }

}
