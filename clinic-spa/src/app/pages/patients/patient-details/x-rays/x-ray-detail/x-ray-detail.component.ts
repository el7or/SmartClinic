import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "x-ray-detail",
  templateUrl: "./x-ray-detail.component.html",
  styleUrls: ["./x-ray-detail.component.scss"]
})
export class XRayDetailComponent implements OnInit {
  @Input() xRayDetails: string;
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(public dialogRef: NbDialogRef<XRayDetailComponent>) {}

  ngOnInit() {}

  onSave(form: NgForm) {
    this.doneSwal.fire();
    this.dialogRef.close();
  }
}
