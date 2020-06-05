using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class MedicineQuantity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicineConcentrationsValues",
                table: "PrescriptionMedicines");

            migrationBuilder.DropForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicineFormsValues",
                table: "PrescriptionMedicines");

            migrationBuilder.DropTable(
                name: "SysMedicineConcentrationsValues");

            migrationBuilder.DropTable(
                name: "SysMedicineFormsValues");

            migrationBuilder.DropIndex(
                name: "IX_PrescriptionMedicines_ConcentrationId",
                table: "PrescriptionMedicines");

            migrationBuilder.DropIndex(
                name: "IX_PrescriptionMedicines_FormId",
                table: "PrescriptionMedicines");

            migrationBuilder.DropColumn(
                name: "FormId",
                table: "PrescriptionMedicines");

            migrationBuilder.AddColumn<int>(
                name: "QuantityId",
                table: "PrescriptionMedicines",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "SysMedicineQuantityValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicineQuantityValues", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_QuantityId",
                table: "PrescriptionMedicines",
                column: "QuantityId");

            migrationBuilder.AddForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicineQuantityValues",
                table: "PrescriptionMedicines",
                column: "QuantityId",
                principalTable: "SysMedicineQuantityValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicineQuantityValues",
                table: "PrescriptionMedicines");

            migrationBuilder.DropTable(
                name: "SysMedicineQuantityValues");

            migrationBuilder.DropIndex(
                name: "IX_PrescriptionMedicines_QuantityId",
                table: "PrescriptionMedicines");

            migrationBuilder.DropColumn(
                name: "QuantityId",
                table: "PrescriptionMedicines");

            migrationBuilder.AddColumn<int>(
                name: "FormId",
                table: "PrescriptionMedicines",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "SysMedicineConcentrationsValues",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    Value = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicineConcentrationsValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysMedicineFormsValues",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false),
                    Value = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicineFormsValues", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_ConcentrationId",
                table: "PrescriptionMedicines",
                column: "ConcentrationId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_FormId",
                table: "PrescriptionMedicines",
                column: "FormId");

            migrationBuilder.AddForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicineConcentrationsValues",
                table: "PrescriptionMedicines",
                column: "ConcentrationId",
                principalTable: "SysMedicineConcentrationsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_PrescriptionMedicines_SysMedicineFormsValues",
                table: "PrescriptionMedicines",
                column: "FormId",
                principalTable: "SysMedicineFormsValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
