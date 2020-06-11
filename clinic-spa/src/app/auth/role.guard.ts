import { LanggService } from "./../shared/services/langg.service";
import { NbToastrService } from "@nebular/theme";
import { Injectable } from "@angular/core";
import { CanActivate, ActivatedRouteSnapshot, Router } from "@angular/router";

import { AuthService } from "./auth.service";
import { JwtHelperService } from "@auth0/angular-jwt";

@Injectable({
  providedIn: "root",
})
export class RoleGuard implements CanActivate {
  jwtHelper = new JwtHelperService();

  constructor(public auth: AuthService, public router: Router) {}
  canActivate(route: ActivatedRouteSnapshot): boolean {
    const token = localStorage.getItem("token");
    const userRole = this.jwtHelper.decodeToken(token).prn;
    const expectedRole = route.data.role;
    if (!this.auth.isAuthenticated || userRole !== expectedRole) {
      this.router.navigateByUrl("/pages");
      return false;
    }
    return true;
  }
}
