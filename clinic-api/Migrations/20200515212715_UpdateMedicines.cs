using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class UpdateMedicines : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineConcentrationsValues",
                table: "PatientPrescriptions");

            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineDosesValues",
                table: "PatientPrescriptions");

            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineFormsValues",
                table: "PatientPrescriptions");

            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_DoctorMedicinesValues",
                table: "PatientPrescriptions");

            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_SysMedicinePeriodsValues",
                table: "PatientPrescriptions");

            migrationBuilder.DropForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineTimingsValues",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_ConcentrationId",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_DoseId",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_FormId",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_MedicineId",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_PeriodId",
                table: "PatientPrescriptions");

            migrationBuilder.DropIndex(
                name: "IX_PatientPrescriptions_TimingId",
                table: "PatientPrescriptions");

            migrationBuilder.DropPrimaryKey(
                name: "PK_DoctorMedicinesValues",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropIndex(
                name: "IX_DoctorMedicinesValues_DoctorId",
                table: "DoctorMedicinesValues");

            migrationBuilder.DropColumn(
                name: "ConcentrationId",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "DoseId",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "FormId",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "MedicineId",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "PeriodId",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "TimingId",
                table: "PatientPrescriptions");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "DoctorMedicinesValues");

            migrationBuilder.AddPrimaryKey(
                name: "PK_DoctorMedicinesValues",
                table: "DoctorMedicinesValues",
                columns: new[] { "DoctorId", "MedicineId" });

            migrationBuilder.CreateTable(
                name: "PrescriptionMedicines",
                columns: table => new
                {
                    PrescriptionId = table.Column<int>(nullable: false),
                    MedicineId = table.Column<int>(nullable: false),
                    ConcentrationId = table.Column<int>(nullable: true),
                    FormId = table.Column<int>(nullable: true),
                    DoseId = table.Column<int>(nullable: true),
                    TimingId = table.Column<int>(nullable: true),
                    PeriodId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PrescriptionMedicines", x => new { x.PrescriptionId, x.MedicineId });
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicineConcentrationsValues",
                        column: x => x.ConcentrationId,
                        principalTable: "SysMedicineConcentrationsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicineDosesValues",
                        column: x => x.DoseId,
                        principalTable: "SysMedicineDosesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicineFormsValues",
                        column: x => x.FormId,
                        principalTable: "SysMedicineFormsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicinesValue",
                        column: x => x.MedicineId,
                        principalTable: "SysMedicinesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicinePeriodsValues",
                        column: x => x.PeriodId,
                        principalTable: "SysMedicinePeriodsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_PatientPrescriptions_PrescriptionId",
                        column: x => x.PrescriptionId,
                        principalTable: "PatientPrescriptions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicineTimingsValues",
                        column: x => x.TimingId,
                        principalTable: "SysMedicineTimingsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_ConcentrationId",
                table: "PrescriptionMedicines",
                column: "ConcentrationId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_DoseId",
                table: "PrescriptionMedicines",
                column: "DoseId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_FormId",
                table: "PrescriptionMedicines",
                column: "FormId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_MedicineId",
                table: "PrescriptionMedicines",
                column: "MedicineId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_PeriodId",
                table: "PrescriptionMedicines",
                column: "PeriodId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_TimingId",
                table: "PrescriptionMedicines",
                column: "TimingId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PrescriptionMedicines");

            migrationBuilder.DropPrimaryKey(
                name: "PK_DoctorMedicinesValues",
                table: "DoctorMedicinesValues");

            migrationBuilder.AddColumn<int>(
                name: "ConcentrationId",
                table: "PatientPrescriptions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DoseId",
                table: "PatientPrescriptions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "FormId",
                table: "PatientPrescriptions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "MedicineId",
                table: "PatientPrescriptions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "PeriodId",
                table: "PatientPrescriptions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TimingId",
                table: "PatientPrescriptions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "DoctorMedicinesValues",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_DoctorMedicinesValues",
                table: "DoctorMedicinesValues",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_ConcentrationId",
                table: "PatientPrescriptions",
                column: "ConcentrationId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_DoseId",
                table: "PatientPrescriptions",
                column: "DoseId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_FormId",
                table: "PatientPrescriptions",
                column: "FormId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_MedicineId",
                table: "PatientPrescriptions",
                column: "MedicineId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_PeriodId",
                table: "PatientPrescriptions",
                column: "PeriodId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_TimingId",
                table: "PatientPrescriptions",
                column: "TimingId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DoctorId",
                table: "DoctorMedicinesValues",
                column: "DoctorId");

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineConcentrationsValues",
                table: "PatientPrescriptions",
                column: "ConcentrationId",
                principalTable: "SysMedicineConcentrationsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineDosesValues",
                table: "PatientPrescriptions",
                column: "DoseId",
                principalTable: "SysMedicineDosesValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineFormsValues",
                table: "PatientPrescriptions",
                column: "FormId",
                principalTable: "SysMedicineFormsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_DoctorMedicinesValues",
                table: "PatientPrescriptions",
                column: "MedicineId",
                principalTable: "DoctorMedicinesValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_SysMedicinePeriodsValues",
                table: "PatientPrescriptions",
                column: "PeriodId",
                principalTable: "SysMedicinePeriodsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PatientPrescriptions_SysMedicineTimingsValues",
                table: "PatientPrescriptions",
                column: "TimingId",
                principalTable: "SysMedicineTimingsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
