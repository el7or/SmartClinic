using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class SubscriptionsModels : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SysRenewalTypeValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(nullable: false),
                    Text = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysRenewalTypeValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysSubscriberTypeValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(nullable: false),
                    Text = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysSubscriberTypeValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysSubscriptionTypeValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(nullable: false),
                    Text = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysSubscriptionTypeValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Plans",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(nullable: false),
                    Description = table.Column<string>(nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    SignUpFee = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    RenewalTypeId = table.Column<int>(nullable: true),
                    AnnualRenewalFee = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    MonthlyRenewalFee = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    GracePeriodDays = table.Column<int>(nullable: true),
                    MaxUsers = table.Column<int>(nullable: true),
                    MaxBookingsMonthly = table.Column<int>(nullable: true),
                    MaxFilesMonthlyMB = table.Column<int>(nullable: true),
                    MaxFileSizeMB = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Plans", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Plans_SysRenewalTypeValues",
                        column: x => x.RenewalTypeId,
                        principalTable: "SysRenewalTypeValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Subscriptions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SubscriberId = table.Column<Guid>(nullable: false),
                    SubscriberTypeId = table.Column<int>(nullable: false),
                    PlanId = table.Column<int>(nullable: false),
                    SubscriptionTypeId = table.Column<int>(nullable: true),
                    StartDate = table.Column<DateTime>(type: "date", nullable: false),
                    EndDate = table.Column<DateTime>(type: "date", nullable: false),
                    Note = table.Column<string>(fixedLength: true, maxLength: 10, nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    SignUpFee = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    AnnualRenewalFee = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    MonthlyRenewalFee = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    GracePeriodDays = table.Column<int>(nullable: true),
                    MaxUsers = table.Column<int>(nullable: true),
                    MaxBookingsMonthly = table.Column<int>(nullable: true),
                    MaxFilesMonthlyMB = table.Column<int>(nullable: true),
                    MaxFileSizeMB = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Subscriptions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Subscriptions_Plans",
                        column: x => x.PlanId,
                        principalTable: "Plans",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Subscriptions_SysSubscriberTypeValues",
                        column: x => x.SubscriberTypeId,
                        principalTable: "SysSubscriberTypeValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Subscriptions_SysSubscriptionTypeValues",
                        column: x => x.SubscriptionTypeId,
                        principalTable: "SysSubscriptionTypeValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Plans_RenewalTypeId",
                table: "Plans",
                column: "RenewalTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Subscriptions_PlanId",
                table: "Subscriptions",
                column: "PlanId");

            migrationBuilder.CreateIndex(
                name: "IX_Subscriptions_SubscriberTypeId",
                table: "Subscriptions",
                column: "SubscriberTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Subscriptions_SubscriptionTypeId",
                table: "Subscriptions",
                column: "SubscriptionTypeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Subscriptions");

            migrationBuilder.DropTable(
                name: "Plans");

            migrationBuilder.DropTable(
                name: "SysSubscriberTypeValues");

            migrationBuilder.DropTable(
                name: "SysSubscriptionTypeValues");

            migrationBuilder.DropTable(
                name: "SysRenewalTypeValues");
        }
    }
}
