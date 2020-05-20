using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class RayPublicId : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "UrlPublicId",
                table: "PatientRayFiles",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UrlPublicId",
                table: "PatientAnalysisFiles",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UrlPublicId",
                table: "PatientRayFiles");

            migrationBuilder.DropColumn(
                name: "UrlPublicId",
                table: "PatientAnalysisFiles");
        }
    }
}
