export interface AnalysisList {
  id: number;
  analysisName: string;
  requestDate: Date;
  isHasResult: boolean;
  resultDate?: Date;
  resultGrade?: number;
}

export interface AnalysisDetails {
  id: number;
  analysisName: string;
  requestDate: Date;
  isHasResult: boolean;
  resultDate?: Date;
  resultText?: string;
  resultNote?: string;
  analysisFiles: AnalysisFileList[];
}
export interface AnalysisFileList {
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
