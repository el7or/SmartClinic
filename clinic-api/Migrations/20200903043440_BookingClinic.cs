using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class BookingClinic : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "ClinicId",
                table: "Bookings",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_ClinicId",
                table: "Bookings",
                column: "ClinicId");

            migrationBuilder.AddForeignKey(
                name: "FK_Bookings_Clinics",
                table: "Bookings",
                column: "ClinicId",
                principalTable: "Clinics",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Bookings_Clinics",
                table: "Bookings");

            migrationBuilder.DropIndex(
                name: "IX_Bookings_ClinicId",
                table: "Bookings");

            migrationBuilder.DropColumn(
                name: "ClinicId",
                table: "Bookings");
        }
    }
}
