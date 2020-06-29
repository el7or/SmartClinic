export interface LoginUser {
  userName:string;
  password:string;
}

export enum UserRole{
  doctor = "doctor",
  employee  = "employee",
  pharmacy = "pharmacy"
}

export interface LoginResponse {
  token:string;
  nickName:string;
}

export interface UpdateNickName{
  userId:string;
  fullName:string;
}

export interface UpdateNickNameResponse{
  fullName:string;
}
