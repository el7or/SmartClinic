using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class PlanSubsType2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "SubscriberTypeId",
                table: "Plans",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "SubscriberTypeId",
                table: "Plans",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));
        }
    }
}
