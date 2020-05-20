export interface AnalysisList {
  id: number;
  analysisName: string;
  requestDate: Date;
  isHasResult: boolean;
  resultDate?: Date;
  resultGrade?: string;
}

export interface AnalysisDetails {
  id: number;
  analysisName: string;
  requestDate: Date;
  isHasResult: boolean;
  resultDate?: Date;
  resultText?: string;
  resultNote?: string;
  analysisFileTypes: AnalysisFileTypeValue[];
  analysisFiles: AnalysisFileList[];
}
export interface AnalysisFileList {
  id: number;
  uploadDate:Date;
  fileType: string;
  fileNote?: string;
  fileUrl: string;
  fileDownloadUrl?: string;
}
export interface AnalysisFileTypeValue{
  id:number;
  text:string;
}
export interface PutAnalysis{
  id:number;
  resultText?: string;
  resultNote?: string;
}
export interface UploadNewFile{
  fileTypeId: number;
  fileNote?: string;
}
