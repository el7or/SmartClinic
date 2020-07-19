using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorPharmacyModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.CreateTable(
                name: "DoctorPharmacies",
                columns: table => new
                {
                    DoctorId = table.Column<Guid>(nullable: false),
                    PharmacyId = table.Column<Guid>(nullable: false),
                    IsDefault = table.Column<bool>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorPharmacies", x => new { x.DoctorId, x.PharmacyId });
                    table.ForeignKey(
                        name: "FK_DoctorPharmacies_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DoctorPharmacies_Pharmacies",
                        column: x => x.PharmacyId,
                        principalTable: "Pharmacies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DoctorPharmacies_PharmacyId",
                table: "DoctorPharmacies",
                column: "PharmacyId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DoctorPharmacies");

            migrationBuilder.AddColumn<Guid>(
                name: "PharmacyId",
                table: "Doctors",
                type: "uniqueidentifier",
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
    }
}
