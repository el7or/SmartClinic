using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DeleteClinicSetting : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AllDaysTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "AllDaysTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "BookingPeriod",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "ConsultExpiration",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "EntryOrderId",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "FridayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "FridayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "IsAllDaysOn",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "IsAllDaysSameTime",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "MondayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "MondayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintAddress1",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintAddress2",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintAddress3",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintClinicName",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintDoctorDegree",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintDoctorName",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintLogoPublicId",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintLogoUrl",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintPhone1",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintPhone2",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "PrintPhone3",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "SaturdayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "SaturdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "SundayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "SundayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "ThursdayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "ThursdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "TuesdayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "TuesdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "WednesdayTimeFrom",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "WednesdayTimeTo",
                table: "Clinics");

            migrationBuilder.DropColumn(
                name: "WorkDays",
                table: "Clinics");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "AllDaysTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "AllDaysTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BookingPeriod",
                table: "Clinics",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ConsultExpiration",
                table: "Clinics",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "EntryOrderId",
                table: "Clinics",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "FridayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "FridayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsAllDaysOn",
                table: "Clinics",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsAllDaysSameTime",
                table: "Clinics",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "MondayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "MondayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintAddress1",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintAddress2",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintAddress3",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintClinicName",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintDoctorDegree",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintDoctorName",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintLogoPublicId",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintLogoUrl",
                table: "Clinics",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintPhone1",
                table: "Clinics",
                type: "nvarchar(256)",
                maxLength: 256,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintPhone2",
                table: "Clinics",
                type: "nvarchar(256)",
                maxLength: 256,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintPhone3",
                table: "Clinics",
                type: "nvarchar(256)",
                maxLength: 256,
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SaturdayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SaturdayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SundayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SundayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ThursdayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ThursdayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "TuesdayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "TuesdayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "WednesdayTimeFrom",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "WednesdayTimeTo",
                table: "Clinics",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "WorkDays",
                table: "Clinics",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);
        }
    }
}
