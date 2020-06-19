import {
  Component,
  OnInit,
  Input,
  ElementRef,
  ViewChild,
  AfterViewInit,
  ChangeDetectorRef,
} from "@angular/core";
import { NbDialogRef } from "@nebular/theme";

@Component({
  selector: "item-setting",
  templateUrl: "./item-setting.component.html",
  styleUrls: ["./item-setting.component.scss"],
})
export class ItemSettingComponent implements OnInit, AfterViewInit {
  @Input() itemValue?: string;
  @ViewChild("itemValueInput", { static: true }) itemValueInput: ElementRef;

  constructor(public dialogRef: NbDialogRef<ItemSettingComponent>,private cd: ChangeDetectorRef) {}

  ngOnInit() {}
  ngAfterViewInit() {
    this.itemValueInput.nativeElement.value = this.itemValue || null;
    this.cd.detectChanges();
  }

  onSave(itemValue) {
    this.dialogRef.close(itemValue);
  }
}
