import { Pipe, PipeTransform } from '@angular/core';
import { formatDate } from '@angular/common';

import { LanggService } from '../services/langg.service';

@Pipe({
  name: 'localShortDate'
})
export class LocalShortDatePipe implements PipeTransform {

  constructor(private langgService: LanggService) { }

    transform(value: any, format: string) {

        if (!value) { return ''; }
        if (!format) { format = 'shortDate'; }

        return formatDate(value, format, this.langgService.locale);
    }

}
