import { BehaviorSubject } from 'rxjs';
import { Injectable } from '@angular/core';

import { User } from './auth.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  currentUser:User= {userName:'',password:''};
  userName = new BehaviorSubject<string>('دكتور محمد');

  constructor() { }

  login(loginUser:User):void{
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
