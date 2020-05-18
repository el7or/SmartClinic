using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class ReferralDiagnosis : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_PatientReferrals_PatientDiagnosisId",
                table: "PatientReferrals",
                column: "PatientDiagnosisId");

            migrationBuilder.AddForeignKey(
                name: "FK_PatientReferrals_PatientDiagnosis",
                table: "PatientReferrals",
                column: "PatientDiagnosisId",
                principalTable: "PatientDiagnosis",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PatientReferrals_PatientDiagnosis",
                table: "PatientReferrals");

            migrationBuilder.DropIndex(
                name: "IX_PatientReferrals_PatientDiagnosisId",
                table: "PatientReferrals");
        }
    }
}
