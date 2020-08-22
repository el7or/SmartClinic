using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace clinic_api.Migrations
{
    public partial class CreateDB : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    Title = table.Column<string>(maxLength: 256, nullable: true),
                    Description = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    FullName = table.Column<string>(maxLength: 256, nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    EditedOn = table.Column<DateTime>(nullable: false),
                    EditedBy = table.Column<Guid>(nullable: false),
                    LastActive = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysAnalysisFileTypesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysAnalysisFileTypesValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysBloodPressureValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysBloodPressureValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysDiseaseGradesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysDiseaseGradesValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysDiseasesQuestionsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(nullable: false),
                    Text = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysDiseasesQuestionsValues", x => x.Id);
                });

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

            migrationBuilder.CreateTable(
                name: "SysDoctorsSpecialties",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysDoctorsSpecialties", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysEntryOrderValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysEntryOrderValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysExpenseTypes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysExpenseTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysGovernoratesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TextAR = table.Column<string>(maxLength: 256, nullable: false),
                    TextEN = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysGovernoratesValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysMedicineDosesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicineDosesValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysMedicinePeriodsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicinePeriodsValues", x => x.Id);
                });

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

            migrationBuilder.CreateTable(
                name: "SysMedicineTimingsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysMedicineTimingsValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysPatientRecordSectionsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysPatientRecordSectionsValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysRayFileTypesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysRayFileTypesValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysRenewalTypeValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysRenewalTypeValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysSocialStatusValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysSocialStatusValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SysSubscriberTypeValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
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
                    Value = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysSubscriptionTypeValues", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<Guid>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<Guid>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(nullable: false),
                    ProviderKey = table.Column<string>(nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<Guid>(nullable: false),
                    RoleId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<Guid>(nullable: false),
                    LoginProvider = table.Column<string>(nullable: false),
                    Name = table.Column<string>(nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ChatMessages",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SenderId = table.Column<Guid>(nullable: false),
                    ReceiverId = table.Column<Guid>(nullable: false),
                    MessageText = table.Column<string>(nullable: false),
                    SentOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    IsRead = table.Column<bool>(nullable: true),
                    ReadOn = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ChatMessages", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessagesReceived_AspNetUsers",
                        column: x => x.ReceiverId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MessagesSent_AspNetUsers",
                        column: x => x.SenderId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Pharmacies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    UserId = table.Column<Guid>(nullable: false),
                    PharmacyName = table.Column<string>(nullable: false),
                    PharmacistName = table.Column<string>(nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    Phone1 = table.Column<string>(maxLength: 256, nullable: true),
                    Phone2 = table.Column<string>(maxLength: 256, nullable: true),
                    WhatsApp = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    Address = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pharmacies", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Pharmacies_AspNetUsers",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Doctors",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    UserId = table.Column<Guid>(nullable: false),
                    SpecialtyId = table.Column<int>(nullable: false),
                    FullName = table.Column<string>(nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    PatientRecordSections = table.Column<string>(maxLength: 50, nullable: true),
                    DiseasesQuestions = table.Column<string>(maxLength: 50, nullable: true),
                    Phone1 = table.Column<string>(maxLength: 256, nullable: true),
                    Phone2 = table.Column<string>(maxLength: 256, nullable: true),
                    Phone3 = table.Column<string>(maxLength: 256, nullable: true),
                    WhatsApp = table.Column<string>(maxLength: 256, nullable: true),
                    Email1 = table.Column<string>(maxLength: 256, nullable: true),
                    Email2 = table.Column<string>(maxLength: 256, nullable: true),
                    Facebook = table.Column<string>(maxLength: 256, nullable: true),
                    Twitter = table.Column<string>(maxLength: 256, nullable: true),
                    LinkedIn = table.Column<string>(maxLength: 256, nullable: true),
                    Instagram = table.Column<string>(maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Doctors", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Doctors_SysDoctorsSpecialties",
                        column: x => x.SpecialtyId,
                        principalTable: "SysDoctorsSpecialties",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Doctors_AspNetUsers",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Clinics",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    ClinicName = table.Column<string>(nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    EntryOrderId = table.Column<int>(nullable: true),
                    BookingPeriod = table.Column<int>(nullable: true),
                    ConsultExpiration = table.Column<int>(nullable: true),
                    PrintDoctorName = table.Column<string>(nullable: true),
                    PrintDoctorDegree = table.Column<string>(nullable: true),
                    PrintClinicName = table.Column<string>(nullable: true),
                    PrintLogoUrl = table.Column<string>(nullable: true),
                    PrintLogoPublicId = table.Column<string>(nullable: true),
                    PrintAddress1 = table.Column<string>(nullable: true),
                    PrintAddress2 = table.Column<string>(nullable: true),
                    PrintAddress3 = table.Column<string>(nullable: true),
                    PrintPhone1 = table.Column<string>(maxLength: 256, nullable: true),
                    PrintPhone2 = table.Column<string>(maxLength: 256, nullable: true),
                    PrintPhone3 = table.Column<string>(maxLength: 256, nullable: true),
                    IsAllDaysOn = table.Column<bool>(nullable: true),
                    WorkDays = table.Column<string>(maxLength: 50, nullable: true),
                    IsAllDaysSameTime = table.Column<bool>(nullable: true),
                    AllDaysTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    AllDaysTimeTo = table.Column<DateTime>(type: "datetime", nullable: true),
                    SaturdayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    SundayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    MondayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    TuesdayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    WednesdayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    ThursdayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    FridayTimeFrom = table.Column<DateTime>(type: "datetime", nullable: true),
                    SaturdayTimeTo = table.Column<DateTime>(nullable: true),
                    SundayTimeTo = table.Column<DateTime>(nullable: true),
                    MondayTimeTo = table.Column<DateTime>(nullable: true),
                    TuesdayTimeTo = table.Column<DateTime>(nullable: true),
                    WednesdayTimeTo = table.Column<DateTime>(nullable: true),
                    ThursdayTimeTo = table.Column<DateTime>(nullable: true),
                    FridayTimeTo = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Clinics", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Clinics_SysEntryOrderValues",
                        column: x => x.EntryOrderId,
                        principalTable: "SysEntryOrderValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Expenses",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ExpenseTypeId = table.Column<int>(nullable: false),
                    ExpenseCost = table.Column<decimal>(type: "decimal(18, 2)", nullable: false),
                    ExpenseDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    Note = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Expenses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Expenses_SysExpenseTypes",
                        column: x => x.ExpenseTypeId,
                        principalTable: "SysExpenseTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "SysCitiesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GovId = table.Column<int>(nullable: false),
                    TextAR = table.Column<string>(maxLength: 256, nullable: false),
                    TextEN = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SysCitiesValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SysCitiesValues_SysGovernoratesValues",
                        column: x => x.GovId,
                        principalTable: "SysGovernoratesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Plans",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(maxLength: 256, nullable: false),
                    Description = table.Column<string>(nullable: true),
                    SubscriberTypeId = table.Column<int>(nullable: false),
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
                    table.ForeignKey(
                        name: "FK_Plans_SysSubscriberTypeValues",
                        column: x => x.SubscriberTypeId,
                        principalTable: "SysSubscriberTypeValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorAnalysisValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    AnalysisName = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorAnalysisValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorAnalysisValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorBookingTypes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Type = table.Column<string>(maxLength: 256, nullable: false),
                    Text = table.Column<string>(maxLength: 256, nullable: true),
                    Price = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorBookingTypes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorBookingTypes_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorDetailedComplaintsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Complaint = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorDetailedComplaintsValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorDetailedComplaintsValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorDiagnosisValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Diagnosis = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorDiagnosisValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorDiagnosisValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorDiscounts",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Discount = table.Column<string>(maxLength: 256, nullable: false),
                    Price = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    IsPercent = table.Column<bool>(nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorDiscounts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorDiscounts_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorExaminationAreasValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    ExaminationArea = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorExaminationAreasValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorExaminationAreasValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorExaminationsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Examination = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorExaminationsValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorExaminationsValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

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
                name: "DoctorGeneralComplaintsValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Complaint = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorGeneralComplaintsValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorGeneralComplaintsValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorMedicinesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    MedicineName = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorMedicinesValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorMedicinesValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorOperationTypesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    OperationType = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorOperationTypesValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorOperationTypesValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorPharmacies",
                columns: table => new
                {
                    DoctorId = table.Column<Guid>(nullable: false),
                    PharmacyId = table.Column<Guid>(nullable: false),
                    IsDefault = table.Column<bool>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorPharmacies", x => new { x.DoctorId, x.PharmacyId });
                    table.ForeignKey(
                        name: "FK_DoctorPharmacies_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DoctorPharmacies_Pharmacies",
                        column: x => x.PharmacyId,
                        principalTable: "Pharmacies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

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
                name: "DoctorRayAreasValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    RayArea = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorRayAreasValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorRayAreas_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorRaysValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    RayName = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorRaysValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorRaysValues_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorServices",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DoctorId = table.Column<Guid>(nullable: false),
                    Service = table.Column<string>(maxLength: 256, nullable: false),
                    Price = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorServices", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorServices_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ClinicUsers",
                columns: table => new
                {
                    ClinicId = table.Column<Guid>(nullable: false),
                    UserId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ClinicUsers", x => new { x.ClinicId, x.UserId });
                    table.ForeignKey(
                        name: "FK_ClinicUsers_Clinics",
                        column: x => x.ClinicId,
                        principalTable: "Clinics",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ClinicUsers_AspNetUsers",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DoctorClinics",
                columns: table => new
                {
                    DoctorId = table.Column<Guid>(nullable: false),
                    ClinicId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorClinics", x => new { x.DoctorId, x.ClinicId });
                    table.ForeignKey(
                        name: "FK_DoctorClinics_Clinics",
                        column: x => x.ClinicId,
                        principalTable: "Clinics",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DoctorClinics_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Patients",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    DoctorId = table.Column<Guid>(nullable: false),
                    ClinicId = table.Column<Guid>(nullable: false),
                    SeqNo = table.Column<int>(nullable: false),
                    FullName = table.Column<string>(nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    Phone = table.Column<string>(maxLength: 256, nullable: true),
                    Phone2 = table.Column<string>(maxLength: 256, nullable: true),
                    Age = table.Column<int>(nullable: true),
                    Gender = table.Column<bool>(nullable: true),
                    SocialStatusId = table.Column<int>(nullable: true),
                    Career = table.Column<string>(nullable: true),
                    GovernorateId = table.Column<int>(nullable: true),
                    CityId = table.Column<int>(nullable: true),
                    Note = table.Column<string>(nullable: true),
                    Children = table.Column<int>(nullable: true),
                    PrevMarriages = table.Column<int>(nullable: true),
                    PrevMarriagesPartner = table.Column<int>(nullable: true),
                    TreatmentHistory = table.Column<string>(nullable: true),
                    FamilyHistory = table.Column<string>(nullable: true),
                    Weight = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    Length = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    BodyMass = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    BloodPressureId = table.Column<int>(nullable: true),
                    Temperature = table.Column<decimal>(type: "decimal(18, 2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Patients", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Patients_SysBloodPressureValues",
                        column: x => x.BloodPressureId,
                        principalTable: "SysBloodPressureValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Patients_SysCitiesValues",
                        column: x => x.CityId,
                        principalTable: "SysCitiesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Patients_Clinics",
                        column: x => x.ClinicId,
                        principalTable: "Clinics",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Patients_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Patients_SysGovernoratesValues",
                        column: x => x.GovernorateId,
                        principalTable: "SysGovernoratesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Patients_SysSocialStatusValues",
                        column: x => x.SocialStatusId,
                        principalTable: "SysSocialStatusValues",
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
                    Note = table.Column<string>(nullable: true),
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

            migrationBuilder.CreateTable(
                name: "DoctorComplaintChoicesValues",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DetailedComplaintId = table.Column<int>(nullable: false),
                    Choice = table.Column<string>(maxLength: 256, nullable: false),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DoctorComplaintChoicesValues", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DoctorComplaintChoicesValues_DoctorDetailedComplaintsValues",
                        column: x => x.DetailedComplaintId,
                        principalTable: "DoctorDetailedComplaintsValues",
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
                    ExpenseTypeId = table.Column<int>(nullable: false),
                    ExpenseDate = table.Column<DateTime>(nullable: false),
                    ExpenseAmount = table.Column<decimal>(type: "decimal(18, 2)", nullable: false),
                    Note = table.Column<string>(nullable: true),
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
                    table.ForeignKey(
                        name: "FK_DoctorExpenses_DoctorExpenseTypes",
                        column: x => x.ExpenseTypeId,
                        principalTable: "SysDoctorExpenseTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Bookings",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    DoctorId = table.Column<Guid>(nullable: false),
                    BookingDateTime = table.Column<DateTime>(type: "datetime", nullable: false),
                    TypeId = table.Column<int>(nullable: false),
                    DiscountId = table.Column<int>(nullable: true),
                    DaySeqNo = table.Column<int>(nullable: true),
                    IsAttend = table.Column<bool>(nullable: true),
                    AttendanceTime = table.Column<DateTime>(type: "datetime", nullable: true),
                    IsEnter = table.Column<bool>(nullable: true),
                    EntryTime = table.Column<DateTime>(type: "datetime", nullable: true),
                    IsFinish = table.Column<bool>(nullable: true),
                    FinishTime = table.Column<DateTime>(type: "datetime", nullable: true),
                    IsCanceled = table.Column<bool>(nullable: true),
                    CanceledOn = table.Column<DateTime>(type: "datetime", nullable: true),
                    IsActive = table.Column<bool>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bookings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Bookings_DoctorDiscounts",
                        column: x => x.DiscountId,
                        principalTable: "DoctorDiscounts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Bookings_Doctors",
                        column: x => x.DoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Bookings_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Bookings_DoctorBookingTypes",
                        column: x => x.TypeId,
                        principalTable: "DoctorBookingTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientAnalysis",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    AnalysisId = table.Column<int>(nullable: false),
                    RequestNote = table.Column<string>(nullable: true),
                    IsHasResult = table.Column<bool>(nullable: true),
                    ResultDate = table.Column<DateTime>(type: "datetime", nullable: true),
                    ResultText = table.Column<string>(nullable: true),
                    ResultGradeId = table.Column<int>(nullable: true),
                    ResultNote = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientAnalysis", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientAnalysis_DoctorAnalysisValues",
                        column: x => x.AnalysisId,
                        principalTable: "DoctorAnalysisValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientAnalysis_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientAnalysis_SysDiseaseGradesValues",
                        column: x => x.ResultGradeId,
                        principalTable: "SysDiseaseGradesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientDiagnosis",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    DiagnosisId = table.Column<int>(nullable: false),
                    GradeId = table.Column<int>(nullable: true),
                    Note = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientDiagnosis", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientDiagnosis_DoctorDiagnosisValues",
                        column: x => x.DiagnosisId,
                        principalTable: "DoctorDiagnosisValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientDiagnosis_SysDiseaseGradesValues",
                        column: x => x.GradeId,
                        principalTable: "SysDiseaseGradesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientDiagnosis_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientDiseases",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    DiseaseId = table.Column<int>(nullable: false),
                    Note = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientDiseases", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientDiseases_SysDiseasesQuestionsValues",
                        column: x => x.DiseaseId,
                        principalTable: "SysDiseasesQuestionsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientDiseases_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientExaminations",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    ExaminationId = table.Column<int>(nullable: false),
                    ExaminationAreaId = table.Column<int>(nullable: true),
                    Note = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientExaminations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientExaminations_DoctorExaminationAreasValues",
                        column: x => x.ExaminationAreaId,
                        principalTable: "DoctorExaminationAreasValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientExaminations_DoctorExaminationsValues",
                        column: x => x.ExaminationId,
                        principalTable: "DoctorExaminationsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientExaminations_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientGeneralComplaints",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    GeneralComplaintId = table.Column<int>(nullable: false),
                    Note = table.Column<string>(nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientGeneralComplaints", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientGeneralComplaints_DoctorGeneralComplaintsValues",
                        column: x => x.GeneralComplaintId,
                        principalTable: "DoctorGeneralComplaintsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientGeneralComplaints_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientOperations",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    OperationTypeId = table.Column<int>(nullable: false),
                    OperationDate = table.Column<DateTime>(type: "datetime", nullable: true),
                    Place = table.Column<string>(nullable: true),
                    Cost = table.Column<decimal>(type: "decimal(18, 2)", nullable: true),
                    Note = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientOperations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientOperations_DoctorOperationTypesValues",
                        column: x => x.OperationTypeId,
                        principalTable: "DoctorOperationTypesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientOperations_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
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

            migrationBuilder.CreateTable(
                name: "PatientPrescriptions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    Note = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    IsPrint = table.Column<bool>(nullable: true),
                    PharmacyId = table.Column<Guid>(nullable: true),
                    IsPharmacyDone = table.Column<bool>(nullable: true),
                    IsPharmacyDelete = table.Column<bool>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientPrescriptions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientPrescriptions_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientPrescriptions_Pharmacies",
                        column: x => x.PharmacyId,
                        principalTable: "Pharmacies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientRays",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    RayId = table.Column<int>(nullable: false),
                    RayAreaId = table.Column<int>(nullable: true),
                    RequestNote = table.Column<string>(nullable: true),
                    IsHasResult = table.Column<bool>(nullable: true),
                    ResultDate = table.Column<DateTime>(type: "datetime", nullable: true),
                    ResultText = table.Column<string>(nullable: true),
                    ResultGradeId = table.Column<int>(nullable: true),
                    ResultNote = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientRays", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientRays_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientRays_DoctorRayAreas",
                        column: x => x.RayAreaId,
                        principalTable: "DoctorRayAreasValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientRays_DoctorRaysValues",
                        column: x => x.RayId,
                        principalTable: "DoctorRaysValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientRays_SysDiseaseGradesValues",
                        column: x => x.ResultGradeId,
                        principalTable: "SysDiseaseGradesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

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

            migrationBuilder.CreateTable(
                name: "PatientDetailedComplaints",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    DetailedComplaintId = table.Column<int>(nullable: false),
                    ComplaintChoiceId = table.Column<int>(nullable: true),
                    Period = table.Column<string>(maxLength: 256, nullable: true),
                    Note = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientDetailedComplaints", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientDetailedComplaints_DoctorComplaintChoicesValues",
                        column: x => x.ComplaintChoiceId,
                        principalTable: "DoctorComplaintChoicesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientDetailedComplaints_DoctorDetailedComplaintsValues",
                        column: x => x.DetailedComplaintId,
                        principalTable: "DoctorDetailedComplaintsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientDetailedComplaints_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "BookingPayments",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BookingId = table.Column<int>(nullable: false),
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
                    table.PrimaryKey("PK_BookingPayments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_BookingPayments_Bookings",
                        column: x => x.BookingId,
                        principalTable: "Bookings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "BookingServices",
                columns: table => new
                {
                    BookingId = table.Column<int>(nullable: false),
                    ServiceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BookingServices", x => new { x.BookingId, x.ServiceId });
                    table.ForeignKey(
                        name: "FK_BookingServices_Bookings",
                        column: x => x.BookingId,
                        principalTable: "Bookings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_BookingServices_DoctorServices",
                        column: x => x.ServiceId,
                        principalTable: "DoctorServices",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientAnalysisFiles",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientAnalysisId = table.Column<int>(nullable: false),
                    FileTypeId = table.Column<int>(nullable: false),
                    Note = table.Column<string>(nullable: true),
                    Url = table.Column<string>(nullable: false),
                    UrlPublicId = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientAnalysisFiles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientAnalysisFiles_SysAnalysisFileTypesValues",
                        column: x => x.FileTypeId,
                        principalTable: "SysAnalysisFileTypesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientAnalysisFiles_PatientAnalysis",
                        column: x => x.PatientAnalysisId,
                        principalTable: "PatientAnalysis",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientReferrals",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientId = table.Column<Guid>(nullable: false),
                    ReferralToDoctorId = table.Column<Guid>(nullable: false),
                    PatientDiagnosisId = table.Column<int>(nullable: true),
                    Note = table.Column<string>(nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false),
                    IsRead = table.Column<bool>(nullable: true),
                    ReadOn = table.Column<DateTime>(type: "datetime", nullable: true),
                    IsApproved = table.Column<bool>(nullable: true),
                    ApprovedOn = table.Column<DateTime>(type: "datetime", nullable: true),
                    IsCanceled = table.Column<bool>(nullable: true),
                    CanceledOn = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientReferrals", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientReferrals_PatientDiagnosis",
                        column: x => x.PatientDiagnosisId,
                        principalTable: "PatientDiagnosis",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientReferrals_Patients",
                        column: x => x.PatientId,
                        principalTable: "Patients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientReferrals_Doctors",
                        column: x => x.ReferralToDoctorId,
                        principalTable: "Doctors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PrescriptionMedicines",
                columns: table => new
                {
                    PrescriptionId = table.Column<int>(nullable: false),
                    MedicineId = table.Column<int>(nullable: false),
                    QuantityId = table.Column<int>(nullable: true),
                    DoseId = table.Column<int>(nullable: true),
                    TimingId = table.Column<int>(nullable: true),
                    PeriodId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PrescriptionMedicines", x => new { x.PrescriptionId, x.MedicineId });
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicineDosesValues",
                        column: x => x.DoseId,
                        principalTable: "SysMedicineDosesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_DoctorMedicinesValue",
                        column: x => x.MedicineId,
                        principalTable: "DoctorMedicinesValues",
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
                        name: "FK_PrescriptionMedicines_SysMedicineQuantityValues",
                        column: x => x.QuantityId,
                        principalTable: "SysMedicineQuantityValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PrescriptionMedicines_SysMedicineTimingsValues",
                        column: x => x.TimingId,
                        principalTable: "SysMedicineTimingsValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "PatientRayFiles",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PatientRayId = table.Column<int>(nullable: false),
                    FileTypeId = table.Column<int>(nullable: false),
                    Note = table.Column<string>(nullable: true),
                    Url = table.Column<string>(nullable: false),
                    UrlPublicId = table.Column<string>(nullable: true),
                    CreatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    CreatedBy = table.Column<Guid>(nullable: false),
                    UpdatedOn = table.Column<DateTime>(type: "datetime", nullable: false),
                    UpdatedBy = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PatientRayFiles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PatientRayFiles_SysRayFileTypesValues",
                        column: x => x.FileTypeId,
                        principalTable: "SysRayFileTypesValues",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PatientRayFiles_PatientRays",
                        column: x => x.PatientRayId,
                        principalTable: "PatientRays",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_BookingPayments_BookingId",
                table: "BookingPayments",
                column: "BookingId");

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_DiscountId",
                table: "Bookings",
                column: "DiscountId");

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_DoctorId",
                table: "Bookings",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_PatientId",
                table: "Bookings",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_Bookings_TypeId",
                table: "Bookings",
                column: "TypeId");

            migrationBuilder.CreateIndex(
                name: "IX_BookingServices_ServiceId",
                table: "BookingServices",
                column: "ServiceId");

            migrationBuilder.CreateIndex(
                name: "IX_ChatMessages_ReceiverId",
                table: "ChatMessages",
                column: "ReceiverId");

            migrationBuilder.CreateIndex(
                name: "IX_ChatMessages_SenderId",
                table: "ChatMessages",
                column: "SenderId");

            migrationBuilder.CreateIndex(
                name: "IX_Clinics_EntryOrderId",
                table: "Clinics",
                column: "EntryOrderId");

            migrationBuilder.CreateIndex(
                name: "IX_ClinicUsers_UserId",
                table: "ClinicUsers",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorAnalysisValues_DoctorId",
                table: "DoctorAnalysisValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorBookingTypes_DoctorId",
                table: "DoctorBookingTypes",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorClinics_ClinicId",
                table: "DoctorClinics",
                column: "ClinicId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorComplaintChoicesValues_DetailedComplaintId",
                table: "DoctorComplaintChoicesValues",
                column: "DetailedComplaintId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorDetailedComplaintsValues_DoctorId",
                table: "DoctorDetailedComplaintsValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorDiagnosisValues_DoctorId",
                table: "DoctorDiagnosisValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorDiscounts_DoctorId",
                table: "DoctorDiscounts",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExaminationAreasValues_DoctorId",
                table: "DoctorExaminationAreasValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExaminationsValues_DoctorId",
                table: "DoctorExaminationsValues",
                column: "DoctorId");

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

            migrationBuilder.CreateIndex(
                name: "IX_DoctorExpenses_ExpenseTypeId",
                table: "DoctorExpenses",
                column: "ExpenseTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorGeneralComplaintsValues_DoctorId",
                table: "DoctorGeneralComplaintsValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorMedicinesValues_DoctorId",
                table: "DoctorMedicinesValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorOperationTypesValues_DoctorId",
                table: "DoctorOperationTypesValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorPharmacies_PharmacyId",
                table: "DoctorPharmacies",
                column: "PharmacyId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorPhysicalTherapyAreaValues_DoctorId",
                table: "DoctorPhysicalTherapyAreaValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorPhysicalTherapyValues_DoctorId",
                table: "DoctorPhysicalTherapyValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorRayAreasValues_DoctorId",
                table: "DoctorRayAreasValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorRaysValues_DoctorId",
                table: "DoctorRaysValues",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_SpecialtyId",
                table: "Doctors",
                column: "SpecialtyId");

            migrationBuilder.CreateIndex(
                name: "IX_Doctors_UserId",
                table: "Doctors",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_DoctorServices_DoctorId",
                table: "DoctorServices",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_ExpenseTypeId",
                table: "Expenses",
                column: "ExpenseTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientAnalysis_AnalysisId",
                table: "PatientAnalysis",
                column: "AnalysisId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientAnalysis_PatientId",
                table: "PatientAnalysis",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientAnalysis_ResultGradeId",
                table: "PatientAnalysis",
                column: "ResultGradeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientAnalysisFiles_FileTypeId",
                table: "PatientAnalysisFiles",
                column: "FileTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientAnalysisFiles_PatientAnalysisId",
                table: "PatientAnalysisFiles",
                column: "PatientAnalysisId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDetailedComplaints_ComplaintChoiceId",
                table: "PatientDetailedComplaints",
                column: "ComplaintChoiceId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDetailedComplaints_DetailedComplaintId",
                table: "PatientDetailedComplaints",
                column: "DetailedComplaintId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDetailedComplaints_PatientId",
                table: "PatientDetailedComplaints",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDiagnosis_DiagnosisId",
                table: "PatientDiagnosis",
                column: "DiagnosisId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDiagnosis_GradeId",
                table: "PatientDiagnosis",
                column: "GradeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDiagnosis_PatientId",
                table: "PatientDiagnosis",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDiseases_DiseaseId",
                table: "PatientDiseases",
                column: "DiseaseId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientDiseases_PatientId",
                table: "PatientDiseases",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientExaminations_ExaminationAreaId",
                table: "PatientExaminations",
                column: "ExaminationAreaId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientExaminations_ExaminationId",
                table: "PatientExaminations",
                column: "ExaminationId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientExaminations_PatientId",
                table: "PatientExaminations",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientGeneralComplaints_GeneralComplaintId",
                table: "PatientGeneralComplaints",
                column: "GeneralComplaintId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientGeneralComplaints_PatientId",
                table: "PatientGeneralComplaints",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientOperations_OperationTypeId",
                table: "PatientOperations",
                column: "OperationTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientOperations_PatientId",
                table: "PatientOperations",
                column: "PatientId");

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

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_PatientId",
                table: "PatientPrescriptions",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientPrescriptions_PharmacyId",
                table: "PatientPrescriptions",
                column: "PharmacyId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientRayFiles_FileTypeId",
                table: "PatientRayFiles",
                column: "FileTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientRayFiles_PatientRayId",
                table: "PatientRayFiles",
                column: "PatientRayId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientRays_PatientId",
                table: "PatientRays",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientRays_RayAreaId",
                table: "PatientRays",
                column: "RayAreaId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientRays_RayId",
                table: "PatientRays",
                column: "RayId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientRays_ResultGradeId",
                table: "PatientRays",
                column: "ResultGradeId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientReferrals_PatientDiagnosisId",
                table: "PatientReferrals",
                column: "PatientDiagnosisId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientReferrals_PatientId",
                table: "PatientReferrals",
                column: "PatientId");

            migrationBuilder.CreateIndex(
                name: "IX_PatientReferrals_ReferralToDoctorId",
                table: "PatientReferrals",
                column: "ReferralToDoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Patients_BloodPressureId",
                table: "Patients",
                column: "BloodPressureId");

            migrationBuilder.CreateIndex(
                name: "IX_Patients_CityId",
                table: "Patients",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_Patients_ClinicId",
                table: "Patients",
                column: "ClinicId");

            migrationBuilder.CreateIndex(
                name: "IX_Patients_DoctorId",
                table: "Patients",
                column: "DoctorId");

            migrationBuilder.CreateIndex(
                name: "IX_Patients_GovernorateId",
                table: "Patients",
                column: "GovernorateId");

            migrationBuilder.CreateIndex(
                name: "IX_Patients_SocialStatusId",
                table: "Patients",
                column: "SocialStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_Pharmacies_UserId",
                table: "Pharmacies",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Plans_RenewalTypeId",
                table: "Plans",
                column: "RenewalTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Plans_SubscriberTypeId",
                table: "Plans",
                column: "SubscriberTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_DoseId",
                table: "PrescriptionMedicines",
                column: "DoseId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_MedicineId",
                table: "PrescriptionMedicines",
                column: "MedicineId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_PeriodId",
                table: "PrescriptionMedicines",
                column: "PeriodId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_QuantityId",
                table: "PrescriptionMedicines",
                column: "QuantityId");

            migrationBuilder.CreateIndex(
                name: "IX_PrescriptionMedicines_TimingId",
                table: "PrescriptionMedicines",
                column: "TimingId");

            migrationBuilder.CreateIndex(
                name: "IX_SubscriptionPayments_SubscriptionId",
                table: "SubscriptionPayments",
                column: "SubscriptionId");

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

            migrationBuilder.CreateIndex(
                name: "IX_SysCitiesValues_GovId",
                table: "SysCitiesValues",
                column: "GovId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "BookingPayments");

            migrationBuilder.DropTable(
                name: "BookingServices");

            migrationBuilder.DropTable(
                name: "ChatMessages");

            migrationBuilder.DropTable(
                name: "ClinicUsers");

            migrationBuilder.DropTable(
                name: "DoctorClinics");

            migrationBuilder.DropTable(
                name: "DoctorExpenses");

            migrationBuilder.DropTable(
                name: "DoctorPharmacies");

            migrationBuilder.DropTable(
                name: "Expenses");

            migrationBuilder.DropTable(
                name: "PatientAnalysisFiles");

            migrationBuilder.DropTable(
                name: "PatientDetailedComplaints");

            migrationBuilder.DropTable(
                name: "PatientDiseases");

            migrationBuilder.DropTable(
                name: "PatientExaminations");

            migrationBuilder.DropTable(
                name: "PatientGeneralComplaints");

            migrationBuilder.DropTable(
                name: "PatientOperations");

            migrationBuilder.DropTable(
                name: "PatientPhysicalTherapies");

            migrationBuilder.DropTable(
                name: "PatientRayFiles");

            migrationBuilder.DropTable(
                name: "PatientReferrals");

            migrationBuilder.DropTable(
                name: "PrescriptionMedicines");

            migrationBuilder.DropTable(
                name: "SubscriptionPayments");

            migrationBuilder.DropTable(
                name: "SysPatientRecordSectionsValues");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Bookings");

            migrationBuilder.DropTable(
                name: "DoctorServices");

            migrationBuilder.DropTable(
                name: "DoctorExpenseItems");

            migrationBuilder.DropTable(
                name: "SysDoctorExpenseTypes");

            migrationBuilder.DropTable(
                name: "SysExpenseTypes");

            migrationBuilder.DropTable(
                name: "SysAnalysisFileTypesValues");

            migrationBuilder.DropTable(
                name: "PatientAnalysis");

            migrationBuilder.DropTable(
                name: "DoctorComplaintChoicesValues");

            migrationBuilder.DropTable(
                name: "SysDiseasesQuestionsValues");

            migrationBuilder.DropTable(
                name: "DoctorExaminationAreasValues");

            migrationBuilder.DropTable(
                name: "DoctorExaminationsValues");

            migrationBuilder.DropTable(
                name: "DoctorGeneralComplaintsValues");

            migrationBuilder.DropTable(
                name: "DoctorOperationTypesValues");

            migrationBuilder.DropTable(
                name: "DoctorPhysicalTherapyAreaValues");

            migrationBuilder.DropTable(
                name: "DoctorPhysicalTherapyValues");

            migrationBuilder.DropTable(
                name: "SysRayFileTypesValues");

            migrationBuilder.DropTable(
                name: "PatientRays");

            migrationBuilder.DropTable(
                name: "PatientDiagnosis");

            migrationBuilder.DropTable(
                name: "SysMedicineDosesValues");

            migrationBuilder.DropTable(
                name: "DoctorMedicinesValues");

            migrationBuilder.DropTable(
                name: "SysMedicinePeriodsValues");

            migrationBuilder.DropTable(
                name: "PatientPrescriptions");

            migrationBuilder.DropTable(
                name: "SysMedicineQuantityValues");

            migrationBuilder.DropTable(
                name: "SysMedicineTimingsValues");

            migrationBuilder.DropTable(
                name: "Subscriptions");

            migrationBuilder.DropTable(
                name: "DoctorDiscounts");

            migrationBuilder.DropTable(
                name: "DoctorBookingTypes");

            migrationBuilder.DropTable(
                name: "DoctorAnalysisValues");

            migrationBuilder.DropTable(
                name: "DoctorDetailedComplaintsValues");

            migrationBuilder.DropTable(
                name: "DoctorRayAreasValues");

            migrationBuilder.DropTable(
                name: "DoctorRaysValues");

            migrationBuilder.DropTable(
                name: "DoctorDiagnosisValues");

            migrationBuilder.DropTable(
                name: "SysDiseaseGradesValues");

            migrationBuilder.DropTable(
                name: "Patients");

            migrationBuilder.DropTable(
                name: "Pharmacies");

            migrationBuilder.DropTable(
                name: "Plans");

            migrationBuilder.DropTable(
                name: "SysSubscriptionTypeValues");

            migrationBuilder.DropTable(
                name: "SysBloodPressureValues");

            migrationBuilder.DropTable(
                name: "SysCitiesValues");

            migrationBuilder.DropTable(
                name: "Clinics");

            migrationBuilder.DropTable(
                name: "Doctors");

            migrationBuilder.DropTable(
                name: "SysSocialStatusValues");

            migrationBuilder.DropTable(
                name: "SysRenewalTypeValues");

            migrationBuilder.DropTable(
                name: "SysSubscriberTypeValues");

            migrationBuilder.DropTable(
                name: "SysGovernoratesValues");

            migrationBuilder.DropTable(
                name: "SysEntryOrderValues");

            migrationBuilder.DropTable(
                name: "SysDoctorsSpecialties");

            migrationBuilder.DropTable(
                name: "AspNetUsers");
        }
    }
}
