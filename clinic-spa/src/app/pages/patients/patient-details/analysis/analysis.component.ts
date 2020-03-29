import { NbDialogService } from '@nebular/theme';
import { Component, OnInit } from '@angular/core';

import { AnalysisService } from './analysis.service';
import { AnalysisDetailComponent } from './analysis-detail/analysis-detail.component';
import { AnalysisList } from './analysis.model';
import { PatientsService } from '../../patients.service';

@Component({
  selector: 'analysis',
  templateUrl: './analysis.component.html',
  styleUrls: ['./analysis.component.scss']
})
export class AnalysisComponent implements OnInit {
  analysisList: AnalysisList[];

  constructor(private analysisService:AnalysisService,
    private patientService:PatientsService,
    private dialogService:NbDialogService) { }

  ngOnInit() {
    this.analysisList = this.analysisService.getAnalysisList(this.patientService.patientId);
  }

  onOpenDetails(analysisId:number){
    this.dialogService.open(AnalysisDetailComponent, {
      context: {
        analysisId: analysisId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

}
