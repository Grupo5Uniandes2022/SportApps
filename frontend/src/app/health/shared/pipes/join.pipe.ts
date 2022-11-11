import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'join'
})
export class JoinPipe implements PipeTransform {

  transform(value: any) {
    let info = '';
    for(let i = 0; i < value.length; i++) {

      if (value[i].startDate !== '2016-09-18T17:34:02.666Z') {
        info = info + (i !== 0 ? ', ' : '') + value[i].title;
      }
    }
    return info;
  }

}
