export interface LoginUser {
  userName: string;
  password: string;
}

export enum UserRole {
  doctor = "doctor",
  employee = "employee",
  pharmacy = "pharmacy",
}

export interface LoginResponse {
  token: string;
  nickName: string;
  warning?: string
}

export interface UpdateNickName {
  userId: string;
  fullName: string;
}

export interface UpdateNickNameResponse {
  fullName: string;
}

export interface DoctorClinic {
  doctorId: string;
  doctorName: string;
}

export interface ClinicDoctor {
  clinicId: string;
  clinicName: string;
}
