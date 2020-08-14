using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class PhysicalTherapyModels : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "DoctorPhysicalTherapyAreaValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    PhysicalTherapyArea = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorPhysicalTherapyAreaValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorPhysicalTherapyAreas_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorPhysicalTherapyValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    PhysicalTherapyName = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorPhysicalTherapyValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorPhysicalTherapyValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientPhysicalTherapies",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    PhysicalTherapyId = table.Column<int>(nullable: false),
                    PhysicalTherapyAreaId = table.Column<int>(nullable: true),
                    RequestNote = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientPhysicalTherapies", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientPhysicalTherapy_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientPhysicalTherapy_DoctorRayAreas",
                        column: x => x.PhysicalTherapyAreaId,
                        principalTable: "DoctorPhysicalTherapyAreaValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientPhysicalTherapy_DoctorRaysValues",
                        column: x => x.PhysicalTherapyId,
                        principalTable: "DoctorPhysicalTherapyValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DoctorPhysicalTherapyAreaValues_DoctorId",
                table: "DoctorPhysicalTherapyAreaValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorPhysicalTherapyValues_DoctorId",
                table: "DoctorPhysicalTherapyValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPhysicalTherapies_PatientId",
                table: "PatientPhysicalTherapies",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPhysicalTherapies_PhysicalTherapyAreaId",
                table: "PatientPhysicalTherapies",
                column: "PhysicalTherapyAreaId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPhysicalTherapies_PhysicalTherapyId",
                table: "PatientPhysicalTherapies",
                column: "PhysicalTherapyId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PatientPhysicalTherapies");

            migrationBuilder.DropTable(
                name: "DoctorPhysicalTherapyAreaValues");

            migrationBuilder.DropTable(
                name: "DoctorPhysicalTherapyValues");
        }
    }
}
