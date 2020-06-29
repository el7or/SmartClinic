import { JwtHelperService } from "@auth0/angular-jwt";
import { BehaviorSubject } from "rxjs";
import { Injectable } from "@angular/core";

import {
  LoginUser,
  UserRole,
  LoginResponse,
  UpdateNickName,
  UpdateNickNameResponse,
} from "./auth.model";
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { map } from "rxjs/operators";

@Injectable({
  providedIn: "root",
})
export class AuthService {
  baseUrl = environment.API_URL;
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
    return UserRole[this.decodedToken.prn] as UserRole;
    /* if (this.decodedToken.prn == "doctor") {
      return UserRole.Doctor;
    }
    if (this.decodedToken.prn == "employee") {
      return UserRole.Employee;
    } */
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
  public get pharmacyId(): string {
    return this.decodedToken.aud;
  }

  constructor(private http: HttpClient) {}

  login(loginUser: LoginUser) {
    return this.http
      .post<LoginResponse>(this.baseUrl + "account/login/", loginUser)
      .pipe(
        map((res: LoginResponse) => {
          if (res) {
            // token has: "fullName + userId + roleName + clinicId + doctorId"
            localStorage.setItem("token", res.token);
            this.decodedToken = this.jwtHelper.decodeToken(res.token);
            localStorage.setItem("nickName", res.nickName);
            return this.roleName;
            /*
          decodedToken.jti --> userId
          decodedToken.prn --> roleName
          decodedToken.sid --> clinicId
          decodedToken.nbf --> doctorId
          decodedToken.aud --> pharmacyId
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
    const userDto: UpdateNickName = {
      userId: this.userId,
      fullName: nickname,
    };
    return this.http
      .put<UpdateNickNameResponse>(this.baseUrl + "user/"+ this.userId, userDto)
      .pipe(
        map((res: UpdateNickNameResponse) => {
          if (res) {
            localStorage.setItem("nickName", res.fullName);
            this._nickName.next(res.fullName);
          }
        })
      );
  }

  // =====> log out:
  logout() {
    localStorage.clear();
  }
}
