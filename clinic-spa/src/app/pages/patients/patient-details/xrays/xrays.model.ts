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
  resultGrade?: number;
  xraysFiles: XrayFileList[];
}
export interface XrayFileList {
  id: number;
  uploadDate:Date;
  fileType: string;
  fileNote?: string;
  fileUrl: string;
}

export interface UploadNewFile{
  id: number;
  fileType: string;
  fileNote?: string;
}

