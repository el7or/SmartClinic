import { DateTimeService } from "./../../../../shared/services/date-time.service";
import { OperationsService } from "./operations.service";
import {
  Component,
  OnInit,
  ViewChild,
  Output,
  EventEmitter,
} from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { BsLocaleService } from "ngx-bootstrap";
import { NgForm } from "@angular/forms";
import { Subscription } from "rxjs";

import {
  PatientOperation,
  OperationTypeValue,
  GetPatientOperations,
  PostPatientOperation,
  PutPatientOperation,
} from "./operations.model";
import { AlertService } from "../../../../shared/services/alert.service";

@Component({
  selector: "operations",
  templateUrl: "./operations.component.html",
  styleUrls: ["./operations.component.scss"],
})
export class OperationsComponent implements OnInit {
  formLoading: boolean = false;
  operation: PatientOperation;
  operationTypeValues: OperationTypeValue[];
  prevPatientOperations: PatientOperation[];
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();

  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  subs = new Subscription();

  constructor(
    private operationService: OperationsService,
    public location: Location,
    private alertService: AlertService,
    private dateTimeSetvice: DateTimeService,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.operationService.getPatientOperations().subscribe(
        (res: GetPatientOperations) => {
          this.operationTypeValues = res.operationTypeValues;
          this.prevPatientOperations = res.prevPatientOperations;
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
    );
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    if (!this.operation.id) {
      const postObj: PostPatientOperation = {
        typeId: form.value.type,
        date: form.value.date
          ? this.dateTimeSetvice.dateWithoutTime(form.value.date)
          : null,
        place: form.value.place,
        cost: form.value.cost,
        note: form.value.note,
      };
      this.subs.add(
        this.operationService.postPatientOperation(postObj).subscribe(
          () => {
            form.reset();
            this.onFinish.emit();
            this.formLoading = false;
            this.doneSwal.fire();
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.formLoading = false;
          }
        )
      );
    } else {
      const putObj: PutPatientOperation = {
        id: this.operation.id,
        typeId: form.value.type,
        date: form.value.date
          ? this.dateTimeSetvice.dateWithoutTime(form.value.date)
          : null,
        place: form.value.place,
        cost: form.value.cost,
        note: form.value.note,
      };
      this.subs.add(
        this.operationService.putPatientOperation(putObj).subscribe(
          () => {
            form.reset();
            this.onFinish.emit();
            this.formLoading = false;
            this.doneSwal.fire();
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.formLoading = false;
          }
        )
      );
    }
  }

  onEditOperation(item: PatientOperation) {
    this.operation = item;
  }

  onDeleteOperation(id: number,index:number) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.subs.add(this.operationService.deletePatientOperation(id).subscribe(
          () => {
            this.formLoading = false;
            this.doneSwal.fire();
            this.prevPatientOperations.splice(index,1);
          },
          (error) => {
            console.error(error);
            this.alertService.alertError();
            this.formLoading = false;
          }
        ));
      }
    });
  }
}
