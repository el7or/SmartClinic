using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorMedicineModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicinesValue",
                table: "PrescriptionMedicines");

            migrationBuilder.DropTable(
                name: "SysMedicinesValues");

            migrationBuilder.CreateTable(
                name: "DoctorMedicinesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    MedicineName = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorMedicinesValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorMedicinesValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DoctorId",
                table: "DoctorMedicinesValues",
                column: "DoctorId");

            migrationBuilder.AddForeignKey(
                name: "FK_PrescriptionMedicines_DoctorMedicinesValue",
                table: "PrescriptionMedicines",
                column: "MedicineId",
                principalTable: "DoctorMedicinesValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PrescriptionMedicines_DoctorMedicinesValue",
                table: "PrescriptionMedicines");

            migrationBuilder.DropTable(
                name: "DoctorMedicinesValues");

            migrationBuilder.CreateTable(
                name: "SysMedicinesValues",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    Value = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicinesValues", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicinesValue",
                table: "PrescriptionMedicines",
                column: "MedicineId",
                principalTable: "SysMedicinesValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
