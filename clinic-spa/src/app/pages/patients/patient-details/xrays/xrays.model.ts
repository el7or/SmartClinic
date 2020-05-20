export interface XraysList {
  id: number;
  xrayName: string;
  xrayArea:string;
  requestDate: Date;
  isHasResult: boolean;
  resultDate?: Date;
  resultGrade?: number;
}

export interface XrayDetails {
  id: number;
  xrayName: string;
  xrayArea:string;
  requestDate: Date;
  isHasResult: boolean;
  resultDate?: Date;
  resultText?: string;
  resultGradeId?: number;
  gradeValues:GradeValue[]
  xrayFileTypes: XrayFileTypeValue[];
  xraysFiles: XrayFileList[];
}
export interface GradeValue{
  id:number;
  text:string;
}
export interface XrayFileTypeValue{
  id:number;
  text:string;
}
export interface XrayFileList {
  id: number;
  uploadDate:Date;
  fileType: string;
  fileNote?: string;
  fileUrl: string;
  fileDownloadUrl?: string;
}

export interface PutXray{
  id:number;
  resultText?: string;
  resultGradeId?: number;
}

export interface UploadNewFile{
  fileTypeId: number;
  fileNote?: string;
}

