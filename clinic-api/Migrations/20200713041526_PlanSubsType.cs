using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class PlanSubsType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "SubscriberTypeId",
                table: "Plans",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Plans_SubscriberTypeId",
                table: "Plans",
                column: "SubscriberTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Plans_SysSubscriberTypeValues",
                table: "Plans",
                column: "SubscriberTypeId",
                principalTable: "SysSubscriberTypeValues",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Plans_SysSubscriberTypeValues",
                table: "Plans");

            migrationBuilder.DropIndex(
                name: "IX_Plans_SubscriberTypeId",
                table: "Plans");

            migrationBuilder.DropColumn(
                name: "SubscriberTypeId",
                table: "Plans");
        }
    }
}
