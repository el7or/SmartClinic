export interface BookingDetails {
patientId:number;
clinicId:string;
doctorId:string;
date:Date;
time:Date;
type:number;
services:number[];
discount:number;
discountNote:string;
paid:number;
}
