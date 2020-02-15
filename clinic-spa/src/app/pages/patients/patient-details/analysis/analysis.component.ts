import { NbDialogService } from '@nebular/theme';
import { Component, OnInit } from '@angular/core';

import { AnalysisDetailComponent } from './analysis-detail/analysis-detail.component';

@Component({
  selector: 'analysis',
  templateUrl: './analysis.component.html',
  styleUrls: ['./analysis.component.scss']
})
export class AnalysisComponent implements OnInit {

  constructor(private dialogService:NbDialogService) { }

  ngOnInit() {
  }

  onOpenDetails(){
    this.dialogService.open(AnalysisDetailComponent, {
      context: {
        analysisDetails: "AUTOIMMUNE DISEASES",
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

}
