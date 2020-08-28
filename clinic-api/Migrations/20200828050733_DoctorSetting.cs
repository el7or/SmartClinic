using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorSetting : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Clinics_SysEntryOrderValues",
                table: "Clinics");

            migrationBuilder.DropIndex(
                name: "IX_Clinics_EntryOrderId",
                table: "Clinics");

            migrationBuilder.AddColumn<DateTime>(
                name: "AllDaysTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "AllDaysTimeTo",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BookingPeriod",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ConsultExpiration",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "EntryOrderId",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "FridayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "FridayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsAllDaysOn",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsAllDaysSameTime",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "MondayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "MondayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintAddress1",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintAddress2",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintAddress3",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintClinicName",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintDoctorDegree",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintDoctorName",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintLogoPublicId",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintLogoUrl",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintPhone1",
                table: "Doctors",
                maxLength: 256,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintPhone2",
                table: "Doctors",
                maxLength: 256,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PrintPhone3",
                table: "Doctors",
                maxLength: 256,
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SaturdayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SaturdayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SundayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "SundayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ThursdayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ThursdayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "TuesdayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "TuesdayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "WednesdayTimeFrom",
                table: "Doctors",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "WednesdayTimeTo",
                table: "Doctors",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "WorkDays",
                table: "Doctors",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "WednesdayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "TuesdayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "ThursdayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "SundayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "SaturdayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "MondayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "FridayTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "AllDaysTimeTo",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "AllDaysTimeFrom",
                table: "Clinics",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_EntryOrderId",
                table: "Doctors",
                column: "EntryOrderId");

            migrationBuilder.AddForeignKey(
                name: "FK_Clinics_SysEntryOrderValues",
                table: "Doctors",
                column: "EntryOrderId",
                principalTable: "SysEntryOrderValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Doctors_EntryOrderId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "AllDaysTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "AllDaysTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "BookingPeriod",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "ConsultExpiration",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "EntryOrderId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "FridayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "FridayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "IsAllDaysOn",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "IsAllDaysSameTime",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "MondayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "MondayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintAddress1",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintAddress2",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintAddress3",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintClinicName",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintDoctorDegree",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintDoctorName",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintLogoPublicId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintLogoUrl",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintPhone1",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintPhone2",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PrintPhone3",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "SaturdayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "SaturdayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "SundayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "SundayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "ThursdayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "ThursdayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "TuesdayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "TuesdayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "WednesdayTimeFrom",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "WednesdayTimeTo",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "WorkDays",
                table: "Doctors");

            migrationBuilder.AlterColumn<DateTime>(
                name: "WednesdayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "TuesdayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "ThursdayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "SundayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "SaturdayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "MondayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "FridayTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "AllDaysTimeTo",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "AllDaysTimeFrom",
                table: "Clinics",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Clinics_EntryOrderId",
                table: "Clinics",
                column: "EntryOrderId");
        }
    }
}
