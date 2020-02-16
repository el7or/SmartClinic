import { XRayDetailComponent } from "./x-ray-detail/x-ray-detail.component";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit } from "@angular/core";


@Component({
  selector: "x-rays",
  templateUrl: "./x-rays.component.html",
  styleUrls: ["./x-rays.component.scss"]
})
export class XRaysComponent implements OnInit {
  constructor(private dialogService: NbDialogService) {}

  ngOnInit() {}

  onOpenXrayDetails() {
    this.dialogService.open(XRayDetailComponent, {
      context: {
        xRayDetails: "PLAIN X RAY FILM"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }
}
