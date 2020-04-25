using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class ClinicTimeTo : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "SaturdayTimeTo",
                table: "Clinics",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SundayTimeTo",
                table: "Clinics",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "MondayTimeTo",
                table: "Clinics",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "TuesdayTimeTo",
                table: "Clinics",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "WednesdayTimeTo",
                table: "Clinics",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ThursdayTimeTo",
                table: "Clinics",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "FridayTimeTo",
                table: "Clinics",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SaturdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "SundayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "MondayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "TuesdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "WednesdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "ThursdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "FridayTimeTo",
                table: "Clinics");
        }
    }
}
