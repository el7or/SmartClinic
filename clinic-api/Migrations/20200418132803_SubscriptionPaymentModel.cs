using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class SubscriptionPaymentModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SubscriptionPayments",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SubscriptionId = table.Column<int>(nullable: false),
                    Paid = table.Column<decimal>(type: "decimal(18, 2)", nullable: false),
                    NextPaymentDate = table.Column<DateTime>(type: "datetime", nullable: true),
                    Note = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubscriptionPayments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SubscriptionPayments_Subscriptions",
                        column: x => x.SubscriptionId,
                        principalTable: "Subscriptions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SubscriptionPayments_SubscriptionId",
                table: "SubscriptionPayments",
                column: "SubscriptionId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SubscriptionPayments");
        }
    }
}
