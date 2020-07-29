using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorExpenseType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ExpenseTypeId",
                table: "DoctorExpenses",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "SysDoctorExpenseTypes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysDoctorExpenseTypes", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExpenses_ExpenseTypeId",
                table: "DoctorExpenses",
                column: "ExpenseTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_DoctorExpenses_DoctorExpenseTypes",
                table: "DoctorExpenses",
                column: "ExpenseTypeId",
                principalTable: "SysDoctorExpenseTypes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DoctorExpenses_DoctorExpenseTypes",
                table: "DoctorExpenses");

            migrationBuilder.DropTable(
                name: "SysDoctorExpenseTypes");

            migrationBuilder.DropIndex(
                name: "IX_DoctorExpenses_ExpenseTypeId",
                table: "DoctorExpenses");

            migrationBuilder.DropColumn(
                name: "ExpenseTypeId",
                table: "DoctorExpenses");
        }
    }
}
