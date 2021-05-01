using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorMedicineDefaults : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "DefaultDoseId",
                table: "DoctorMedicinesValues",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DefaultPeriodId",
                table: "DoctorMedicinesValues",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DefaultQuantityId",
                table: "DoctorMedicinesValues",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DefaultTimingId",
                table: "DoctorMedicinesValues",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DefaultDoseId",
                table: "DoctorMedicinesValues",
                column: "DefaultDoseId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DefaultPeriodId",
                table: "DoctorMedicinesValues",
                column: "DefaultPeriodId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DefaultQuantityId",
                table: "DoctorMedicinesValues",
                column: "DefaultQuantityId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DefaultTimingId",
                table: "DoctorMedicinesValues",
                column: "DefaultTimingId");

            migrationBuilder.AddForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicineDosesValues",
                table: "DoctorMedicinesValues",
                column: "DefaultDoseId",
                principalTable: "SysMedicineDosesValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicinePeriodsValues",
                table: "DoctorMedicinesValues",
                column: "DefaultPeriodId",
                principalTable: "SysMedicinePeriodsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicineQuantityValues",
                table: "DoctorMedicinesValues",
                column: "DefaultQuantityId",
                principalTable: "SysMedicineQuantityValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicineTimingsValues",
                table: "DoctorMedicinesValues",
                column: "DefaultTimingId",
                principalTable: "SysMedicineTimingsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicineDosesValues",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicinePeriodsValues",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicineQuantityValues",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropForeignKey(
                name: "FK_DoctorMedicinesValues_SysMedicineTimingsValues",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropIndex(
                name: "IX_DoctorMedicinesValues_DefaultDoseId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropIndex(
                name: "IX_DoctorMedicinesValues_DefaultPeriodId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropIndex(
                name: "IX_DoctorMedicinesValues_DefaultQuantityId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropIndex(
                name: "IX_DoctorMedicinesValues_DefaultTimingId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropColumn(
                name: "DefaultDoseId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropColumn(
                name: "DefaultPeriodId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropColumn(
                name: "DefaultQuantityId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropColumn(
                name: "DefaultTimingId",
                table: "DoctorMedicinesValues");
        }
    }
}
