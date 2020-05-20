import { NbDialogService } from "@nebular/theme";
import {
  Component,
  OnInit,
  Output,
  EventEmitter,
  OnDestroy,
} from "@angular/core";
import { Subscription } from "rxjs";

import { AlertService } from "./../../../../shared/services/alert.service";
import { AnalysisService } from "./analysis.service";
import { AnalysisDetailComponent } from "./analysis-detail/analysis-detail.component";
import { AnalysisList } from "./analysis.model";
import { PatientsService } from "../../patients.service";

@Component({
  selector: "analysis",
  templateUrl: "./analysis.component.html",
  styleUrls: ["./analysis.component.scss"],
})
export class AnalysisComponent implements OnInit, OnDestroy {
  formLoading = false;
  analysisList: AnalysisList[];
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();

  getSubs: Subscription;

  constructor(
    private analysisService: AnalysisService,
    public patientService: PatientsService,
    private alertService: AlertService,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.analysisService.getAnalysisList().subscribe(
      (res: AnalysisList[]) => {
        this.analysisList = res;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
  ngOnDestroy() {
    this.getSubs.unsubscribe();
  }

  onOpenDetails(analysisId: number) {
    this.dialogService.open(AnalysisDetailComponent, {
      context: {
        analysisId: analysisId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
    this.onFinish.emit();
  }
}
