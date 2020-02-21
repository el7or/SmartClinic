import { BehaviorSubject } from 'rxjs';
import { Injectable } from '@angular/core';

import { LoginUser } from './auth.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  currentUser:LoginUser= {userName:'',password:''};
  userName = new BehaviorSubject<string>('دكتور محمد');

  constructor() { }

  login(loginUser:LoginUser):void{
    this.currentUser = loginUser;
  }

  isAuthenticated():boolean{
    return true;
    /* if(this.currentUser.userName=='el7or' && this.currentUser.password == '123456'){
      return true;
    }
    return false; */
  }

  logout(){
    this.currentUser = {userName:'',password:''};
  }

  getUserName(){
    return this.userName.asObservable();
  }
}
