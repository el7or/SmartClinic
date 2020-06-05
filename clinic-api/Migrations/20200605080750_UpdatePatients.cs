using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class UpdatePatients : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Note",
                table: "Patients",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Phone2",
                table: "Patients",
                maxLength: 256,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Note",
                table: "Patients");

            migrationBuilder.DropColumn(
                name: "Phone2",
                table: "Patients");
        }
    }
}
