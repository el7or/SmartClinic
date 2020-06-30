import { Injectable } from "@angular/core";
import { environment } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { AuthService } from "../auth/auth.service";
import { NewPrescription, SavePresc, PrevPrescription } from "./pharmacy.model";

@Injectable({
  providedIn: "root",
})
export class PharmacyService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) {}

  getNewPrescriptions() {
    return this.http.get<NewPrescription[]>(
      this.baseUrl +
        "Pharmacy/GetNewPresc/" +
        this.authService.userId +
        "/" +
        this.authService.pharmacyId
    );
  }

  putPrescription(prescription: SavePresc) {
    return this.http.put(
      this.baseUrl + "Pharmacy/PutPresc/" + this.authService.userId,
      prescription
    );
  }

  getPrevPrescriptions() {
    return this.http.get<PrevPrescription[]>(
      this.baseUrl +
        "Pharmacy/GetPrevPresc/" +
        this.authService.userId +
        "/" +
        this.authService.pharmacyId
    );
  }
}
