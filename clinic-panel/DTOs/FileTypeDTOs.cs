using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class FileTypeIndexDTO
    {
        public List<RayFileType> RayFileTypes { get; set; }
        public List<AnalysisFileType> AnalysisFileTypes { get; set; }
    }
    public class RayFileType
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public int FilesCount { get; set; }
    }
    public class AnalysisFileType
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public int FilesCount { get; set; }
    }
}