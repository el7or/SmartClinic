import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';
import { Subscription } from 'rxjs';
import { AlertService } from '../../../../shared/services/alert.service';
import { UserResetPassword } from '../../settings.model';

@Component({
  selector: 'user-reset-password',
  templateUrl: './user-reset-password.component.html',
  styleUrls: ['./user-reset-password.component.scss']
})
export class UserResetPasswordComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @Input() userId: string;
  userResetPassword?: UserResetPassword = {
    id: '',
    password: ''
  };

  subs = new Subscription();

  constructor(public dialogRef: NbDialogRef<UserResetPasswordComponent>,
    private alertService: AlertService) { }

  ngOnInit() {
    if (this.userId)
      this.userResetPassword.id = this.userId;
  }
  ngOnDestroy(): void {
    this.subs.unsubscribe();
  }

  onSave() {
    this.dialogRef.close(this.userResetPassword);
  }
}
