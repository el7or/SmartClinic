using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorPharmacy : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "PharmacyId",
                table: "Doctors",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_PharmacyId",
                table: "Doctors",
                column: "PharmacyId");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctors_Pharmacies_PharmacyId",
                table: "Doctors",
                column: "PharmacyId",
                principalTable: "Pharmacies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Doctors_Pharmacies_PharmacyId",
                table: "Doctors");

            migrationBuilder.DropIndex(
                name: "IX_Doctors_PharmacyId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "PharmacyId",
                table: "Doctors");
        }
    }
}
