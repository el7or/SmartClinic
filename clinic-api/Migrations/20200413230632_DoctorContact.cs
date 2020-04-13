using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorContact : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Phone1",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Phone2",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Phone3",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "WhatsApp",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email1",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email2",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Facebook",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Twitter",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "LinkedIn",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Instagram",
                table: "Doctors",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Phone1",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Phone2",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Phone3",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "WhatsApp",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Email1",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Email2",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Facebook",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Twitter",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "LinkedIn",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "Instagram",
                table: "Doctors");
        }
    }
}
