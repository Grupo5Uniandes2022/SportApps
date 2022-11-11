import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'join'
})
export class JoinPipe implements PipeTransform {

  transform(value: any, type: string) {
    let info = '';
    for(let i = 0; i < value.length; i++) {

      if (value[i].startDate !== '2016-09-18T17:34:02.666Z' && value[i].type === type) {
        info = info +  ', ' + value[i].title;
      }
    }
    if (info === '') {
      return 'Programar ' + (type === 'training' ? 'Entrenamiento' : 'Servicio');
    } else {
      return info.substr(1);
    }
  }

}
