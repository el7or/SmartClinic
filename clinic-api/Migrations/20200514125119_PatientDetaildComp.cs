using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class PatientDetaildComp : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "ComplaintChoiceId",
                table: "PatientDetailedComplaints",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "DetailedComplaintId",
                table: "PatientDetailedComplaints",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "Id",
                table: "DoctorGeneralComplaintsValues",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDetailedComplaints_DetailedComplaintId",
                table: "PatientDetailedComplaints",
                column: "DetailedComplaintId");

            migrationBuilder.AddForeignKey(
                name: "FK_PatientDetailedComplaints_DoctorDetailedComplaintsValues",
                table: "PatientDetailedComplaints",
                column: "DetailedComplaintId",
                principalTable: "DoctorDetailedComplaintsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PatientDetailedComplaints_DoctorDetailedComplaintsValues",
                table: "PatientDetailedComplaints");

            migrationBuilder.DropIndex(
                name: "IX_PatientDetailedComplaints_DetailedComplaintId",
                table: "PatientDetailedComplaints");

            migrationBuilder.DropColumn(
                name: "DetailedComplaintId",
                table: "PatientDetailedComplaints");

            migrationBuilder.AlterColumn<int>(
                name: "ComplaintChoiceId",
                table: "PatientDetailedComplaints",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Id",
                table: "DoctorGeneralComplaintsValues",
                type: "int",
                nullable: false,
                oldClrType: typeof(int))
                .OldAnnotation("SqlServer:Identity", "1, 1");
        }
    }
}
