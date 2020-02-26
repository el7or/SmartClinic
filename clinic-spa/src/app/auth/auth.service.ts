import { JwtHelperService } from "@auth0/angular-jwt";
import { BehaviorSubject, Observable } from "rxjs";
import { Injectable } from "@angular/core";

import { LoginUser, UserRole } from "./auth.model";

@Injectable({
  providedIn: "root"
})
export class AuthService {
  currentUser: LoginUser = { userName: "", password: "" };

  jwtHelper = new JwtHelperService();
  private _nickName = new BehaviorSubject<string>("");

  public get isAuthenticated(): boolean {
    try {
      return true;
      /* if (
        (this.currentUser.userName == "el7or" || this.currentUser.userName == "el7or2") &&
        this.currentUser.password == "123456"
      ) {
        return true;
      }
      return false; */

      /* const token = localStorage.getItem("token");
      return !this.jwtHelper.isTokenExpired(token); */
    } catch {
      return false;
    }
  }

  public get roleName(): UserRole {
    if (this.currentUser.userName == "el7or") return UserRole.Doctor;
    if (this.currentUser.userName == "el7or2") return UserRole.Employee;

    /* const token = localStorage.getItem("token");
    let decodedToken = this.jwtHelper.decodeToken(token);
    if (decodedToken.jti == "Doctor") {
      return UserRole.Doctor;
    }
    if (decodedToken.jti == "Employee") {
      return UserRole.Employee;
    } */
  }

  constructor() {}

  login(loginUser: LoginUser): void {
    // =====> (get user data from database):
    this.currentUser = loginUser;

    localStorage.setItem("token", "userId + roleName + clinicId + specialtyId");
    localStorage.setItem("nickName", "دكتور محمد");
  }

  // =====> get & set user nickName:
  getNickName() {
    this._nickName.next(localStorage.getItem("nickName"));
    return this._nickName.asObservable();
  }
  setNickName(nickname: string) {
    localStorage.setItem("nickName", nickname);
    this._nickName.next(nickname);
  }

  // =====> log out:
  logout() {
    this.currentUser = { userName: "", password: "" };

    localStorage.clear();
  }
}
