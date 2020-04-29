using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class UpdateCityModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Text_en",
                table: "SysCitiesValues",
                newName: "TextEN");

            migrationBuilder.RenameColumn(
                name: "Text_ar",
                table: "SysCitiesValues",
                newName: "TextAR");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "TextEN",
                table: "SysCitiesValues",
                newName: "Text_en");

            migrationBuilder.RenameColumn(
                name: "TextAR",
                table: "SysCitiesValues",
                newName: "Text_ar");
        }
    }
}
