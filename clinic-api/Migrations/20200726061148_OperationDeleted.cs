using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class OperationDeleted : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "PatientOperations",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "PatientOperations");
        }
    }
}
