using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class DoctorExpense : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "DoctorExpenseItems",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    ExpenseItem = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorExpenseItems", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorExpenseItems_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorExpenses",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    ExpenseItemId = table.Column<int>(nullable: false),
                    ExpenseDate = table.Column<DateTime>(nullable: false),
                    ExpenseAmount = table.Column<decimal>(type: "decimal(18, 2)", nullable: false),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorExpenses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorExpenses_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DoctorExpenses_DoctorExpenseItems",
                        column: x => x.ExpenseItemId,
                        principalTable: "DoctorExpenseItems",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExpenseItems_DoctorId",
                table: "DoctorExpenseItems",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExpenses_DoctorId",
                table: "DoctorExpenses",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExpenses_ExpenseItemId",
                table: "DoctorExpenses",
                column: "ExpenseItemId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DoctorExpenses");

            migrationBuilder.DropTable(
                name: "DoctorExpenseItems");
        }
    }
}
