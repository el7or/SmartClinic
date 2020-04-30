import { JwtHelperService } from "@auth0/angular-jwt";
import { BehaviorSubject } from "rxjs";
import { Injectable } from "@angular/core";

import { LoginUser, UserRole } from "./auth.model";
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { map } from "rxjs/operators";

@Injectable({
  providedIn: "root",
})
export class AuthService {
  baseUrl = environment.API_URL + "account/";
  jwtHelper = new JwtHelperService();
  decodedToken;

  private _nickName = new BehaviorSubject<string>("");

  public get isAuthenticated(): boolean {
    try {
      const token = localStorage.getItem("token");
      this.decodedToken = this.jwtHelper.decodeToken(token);
      return !this.jwtHelper.isTokenExpired(token);
    } catch {
      return false;
    }
  }
  public get roleName(): UserRole {
    if (this.decodedToken.prn == "doctor") {
      return UserRole.Doctor;
    }
    if (this.decodedToken.prn == "employee") {
      return UserRole.Employee;
    }
  }
  public get userId(): string {
    return this.decodedToken.jti;
  }
  public get clinicId(): string {
    return this.decodedToken.sid;
  }
  public get doctorId(): string {
    return this.decodedToken.nbf;
  }

  constructor(private http: HttpClient) {}

  login(loginUser: LoginUser) {
    return this.http.post(this.baseUrl + "login/", loginUser).pipe(
      map((res: any) => {
        if (res) {
          // token has: "fullName + userId + roleName + clinicId + doctorId"
          localStorage.setItem("token", res.token);
          this.decodedToken = this.jwtHelper.decodeToken(res.token);
          localStorage.setItem("nickName", this.decodedToken.sub)
          /*
          decodedToken.sub --> fullName
          decodedToken.jti --> userId
          decodedToken.prn --> roleName
          decodedToken.sid --> clinicId
          decodedToken.nbf --> doctorId
          */
        }
      })
    );
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
    localStorage.clear();
  }
}
