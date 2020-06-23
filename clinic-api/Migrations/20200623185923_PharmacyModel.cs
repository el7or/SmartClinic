using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class PharmacyModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsPharmacyDelete",
                table: "PatientPrescriptions",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsPharmacyDone",
                table: "PatientPrescriptions",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "PharmacyId",
                table: "PatientPrescriptions",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Pharmacies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    UserId = table.Column<Guid>(nullable: false),
                    PharmacyName = table.Column<string>(nullable: false),
                    PharmacistName = table.Column<string>(nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    Phone1 = table.Column<string>(maxLength: 256, nullable: true),
                    Phone2 = table.Column<string>(maxLength: 256, nullable: true),
                    WhatsApp = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    Address = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pharmacies", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pharmacies_AspNetUsers",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_PharmacyId",
                table: "PatientPrescriptions",
                column: "PharmacyId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_UserId",
                table: "Doctors",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Pharmacies_UserId",
                table: "Pharmacies",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Doctors_AspNetUsers",
                table: "Doctors",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_Pharmacies",
                table: "PatientPrescriptions",
                column: "PharmacyId",
                principalTable: "Pharmacies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Doctors_AspNetUsers",
                table: "Doctors");

            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_Pharmacies",
                table: "PatientPrescriptions");

            migrationBuilder.DropTable(
                name: "Pharmacies");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_PharmacyId",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_Doctors_UserId",
                table: "Doctors");

            migrationBuilder.DropColumn(
                name: "IsPharmacyDelete",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "IsPharmacyDone",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "PharmacyId",
                table: "PatientPrescriptions");
        }
    }
}
