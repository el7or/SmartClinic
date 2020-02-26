export interface LoginUser {
  userName:string;
  password:string;
}
export interface CurrentUser {
  userId:string;
  roleName:string;
  userName:string;
  nickName:string;
  clinicId:string;
  specialtyId:string;
}

export enum UserRole{
  Doctor,
  Employee
}
