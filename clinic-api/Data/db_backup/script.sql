USE [master]
GO
/****** Object:  Database [smart_clinic]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE DATABASE [smart_clinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'smart_clinic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\smart_clinic.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'smart_clinic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\smart_clinic_log.ldf' , SIZE = 2112KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [smart_clinic] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [smart_clinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [smart_clinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [smart_clinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [smart_clinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [smart_clinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [smart_clinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [smart_clinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [smart_clinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [smart_clinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [smart_clinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [smart_clinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [smart_clinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [smart_clinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [smart_clinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [smart_clinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [smart_clinic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [smart_clinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [smart_clinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [smart_clinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [smart_clinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [smart_clinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [smart_clinic] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [smart_clinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [smart_clinic] SET RECOVERY FULL 
GO
ALTER DATABASE [smart_clinic] SET  MULTI_USER 
GO
ALTER DATABASE [smart_clinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [smart_clinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [smart_clinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [smart_clinic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'smart_clinic', N'ON'
GO
USE [smart_clinic]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[EditedOn] [datetime2](7) NOT NULL,
	[EditedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingPayments]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingPayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[Paid] [decimal](18, 2) NOT NULL,
	[NextPaymentDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BookingPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[BookingDateTime] [datetime] NOT NULL,
	[TypeId] [int] NOT NULL,
	[DiscountId] [int] NULL,
	[DaySeqNo] [int] NULL,
	[IsAttend] [bit] NULL,
	[AttendanceTime] [datetime] NULL,
	[IsEnter] [bit] NULL,
	[EntryTime] [datetime] NULL,
	[IsFinish] [bit] NULL,
	[FinishTime] [datetime] NULL,
	[IsCanceled] [bit] NULL,
	[CanceledOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingServices]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingServices](
	[BookingId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_BookingServices] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicBookingTypes]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicBookingTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClinicBookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicDiscounts]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicDiscounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[Discount] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[IsPercent] [bit] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClinicDiscounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clinics]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinics](
	[Id] [uniqueidentifier] NOT NULL,
	[ClinicName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[EntryOrderId] [int] NULL,
	[BookingPeriod] [int] NULL,
	[ConsultExpiration] [int] NULL,
	[PrintDoctorName] [nvarchar](max) NULL,
	[PrintDoctorDegree] [nvarchar](max) NULL,
	[PrintClinicName] [nvarchar](max) NULL,
	[PrintLogoUrl] [nvarchar](max) NULL,
	[PrintAddress1] [nvarchar](max) NULL,
	[PrintAddress2] [nvarchar](max) NULL,
	[PrintAddress3] [nvarchar](max) NULL,
	[PrintPhone1] [nvarchar](max) NULL,
	[PrintPhone2] [nvarchar](max) NULL,
	[PrintPhone3] [nvarchar](max) NULL,
	[IsAllDaysOn] [bit] NULL,
	[WorkDays] [nvarchar](max) NULL,
	[IsAllDaysSameTime] [bit] NULL,
	[AllDaysTimeFrom] [datetime] NULL,
	[AllDaysTimeTo] [datetime] NULL,
	[SaturdayTimeFrom] [datetime] NULL,
	[SundayTimeFrom] [datetime] NULL,
	[MondayTimeFrom] [datetime] NULL,
	[TuesdayTimeFrom] [datetime] NULL,
	[WednesdayTimeFrom] [datetime] NULL,
	[ThursdayTimeFrom] [datetime] NULL,
	[FridayTimeFrom] [datetime] NULL,
	[SaturdayTimeTo] [datetime2](7) NULL,
	[SundayTimeTo] [datetime2](7) NULL,
	[MondayTimeTo] [datetime2](7) NULL,
	[TuesdayTimeTo] [datetime2](7) NULL,
	[WednesdayTimeTo] [datetime2](7) NULL,
	[ThursdayTimeTo] [datetime2](7) NULL,
	[FridayTimeTo] [datetime2](7) NULL,
 CONSTRAINT [PK_Clinics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicServices]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[Service] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClinicServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicUsers]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicUsers](
	[ClinicId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClinicUsers] PRIMARY KEY CLUSTERED 
(
	[ClinicId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorAnalysisValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorAnalysisValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[AnalysisName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorAnalysisValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorClinics]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorClinics](
	[DoctorId] [uniqueidentifier] NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorClinics] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC,
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorComplaintChoicesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorComplaintChoicesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DetailedComplaintId] [int] NOT NULL,
	[Choice] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorComplaintChoicesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorDetailedComplaintsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDetailedComplaintsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Complaint] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorDetailedComplaintsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorDiagnosisValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDiagnosisValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Diagnosis] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorDiagnosisValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorExaminationAreasValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorExaminationAreasValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[ExaminationArea] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorExaminationAreasValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorExaminationsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorExaminationsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Examination] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorExaminationsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorGeneralComplaintsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorGeneralComplaintsValues](
	[Id] [int] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Complaint] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorGeneralComplaintsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorMedicinesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorMedicinesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorMedicinesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorOperationTypesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorOperationTypesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[OperationType] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorOperationTypesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorRayAreasValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorRayAreasValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[RayArea] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorRayAreasValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorRaysValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorRaysValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[RayName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DoctorRaysValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[SpecialtyId] [int] NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[PatientRecordSections] [nvarchar](max) NULL,
	[DiseasesQuestions] [nvarchar](max) NULL,
	[Phone1] [nvarchar](max) NULL,
	[Phone2] [nvarchar](max) NULL,
	[Phone3] [nvarchar](max) NULL,
	[WhatsApp] [nvarchar](max) NULL,
	[Email1] [nvarchar](max) NULL,
	[Email2] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[LinkedIn] [nvarchar](max) NULL,
	[Instagram] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientAnalysis]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAnalysis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[AnalysisId] [int] NOT NULL,
	[RequestNote] [nvarchar](max) NULL,
	[IsHasResult] [bit] NULL,
	[ResultDate] [datetime] NULL,
	[ResultText] [nvarchar](max) NULL,
	[ResultGradeId] [int] NULL,
	[ResultNote] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientAnalysis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientAnalysisFiles]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAnalysisFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientAnalysisId] [int] NOT NULL,
	[FileTypeId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientAnalysisFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientDetailedComplaints]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDetailedComplaints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[ComplaintChoiceId] [int] NOT NULL,
	[Period] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientDetailedComplaints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiagnosis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[DiagnosisId] [int] NOT NULL,
	[GradeId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientDiagnosis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientDiseases]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiseases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[DiseaseId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientDiseases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientExaminations]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientExaminations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[ExaminationId] [int] NOT NULL,
	[ExaminationAreaId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientExaminations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientGeneralComplaints]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientGeneralComplaints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[GeneralComplaintId] [int] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientGeneralComplaints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientOperations]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientOperations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[OperationTypeId] [int] NOT NULL,
	[OperationDate] [datetime] NULL,
	[Place] [nvarchar](max) NULL,
	[Cost] [decimal](18, 2) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientOperations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientPrescriptions]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientPrescriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[ConcentrationId] [int] NULL,
	[FormId] [int] NULL,
	[DoseId] [int] NULL,
	[TimingId] [int] NULL,
	[PeriodId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsPrint] [bit] NULL,
 CONSTRAINT [PK_PatientPrescriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientRayFiles]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientRayFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientRayId] [int] NOT NULL,
	[FileTypeId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientRayFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientRays]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientRays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[RayId] [int] NOT NULL,
	[RayAreaId] [int] NULL,
	[RequestNote] [nvarchar](max) NULL,
	[IsHasResult] [bit] NULL,
	[ResultDate] [datetime] NULL,
	[ResultText] [nvarchar](max) NULL,
	[ResultGradeId] [int] NULL,
	[ResultNote] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PatientRays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientReferrals]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientReferrals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[ReferralToDoctorId] [uniqueidentifier] NOT NULL,
	[PatientDiagnosisId] [int] NULL,
	[Note] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsRead] [bit] NULL,
	[ReadOn] [datetime] NULL,
	[IsApproved] [bit] NULL,
	[ApprovedOn] [datetime] NULL,
	[IsCanceled] [bit] NULL,
	[CanceledOn] [datetime] NULL,
 CONSTRAINT [PK_PatientReferrals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [uniqueidentifier] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[SeqNo] [int] NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Gender] [bit] NULL,
	[SocialStatusId] [int] NULL,
	[Career] [nvarchar](max) NULL,
	[GovernorateId] [int] NULL,
	[CityId] [int] NULL,
	[Children] [int] NULL,
	[PrevMarriages] [int] NULL,
	[PrevMarriagesPartner] [int] NULL,
	[TreatmentHistory] [nvarchar](max) NULL,
	[FamilyHistory] [nvarchar](max) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Length] [decimal](18, 2) NULL,
	[BodyMass] [decimal](18, 2) NULL,
	[BloodPressureId] [int] NULL,
	[Temperature] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plans]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[SignUpFee] [decimal](18, 2) NULL,
	[RenewalTypeId] [int] NULL,
	[AnnualRenewalFee] [decimal](18, 2) NULL,
	[MonthlyRenewalFee] [decimal](18, 2) NULL,
	[GracePeriodDays] [int] NULL,
	[MaxUsers] [int] NULL,
	[MaxBookingsMonthly] [int] NULL,
	[MaxFilesMonthlyMB] [int] NULL,
	[MaxFileSizeMB] [int] NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubscriptionPayments]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionPayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionId] [int] NOT NULL,
	[Paid] [decimal](18, 2) NOT NULL,
	[NextPaymentDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SubscriptionPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubscriberId] [uniqueidentifier] NOT NULL,
	[SubscriberTypeId] [int] NOT NULL,
	[PlanId] [int] NOT NULL,
	[SubscriptionTypeId] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Note] [nchar](10) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[SignUpFee] [decimal](18, 2) NULL,
	[AnnualRenewalFee] [decimal](18, 2) NULL,
	[MonthlyRenewalFee] [decimal](18, 2) NULL,
	[GracePeriodDays] [int] NULL,
	[MaxUsers] [int] NULL,
	[MaxBookingsMonthly] [int] NULL,
	[MaxFilesMonthlyMB] [int] NULL,
	[MaxFileSizeMB] [int] NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysAnalysisFileTypesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysAnalysisFileTypesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysAnalysisFileTypesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysBloodPressureValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysBloodPressureValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysBloodPressureValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysCitiesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCitiesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GovId] [int] NOT NULL,
	[Text_ar] [nvarchar](256) NOT NULL,
	[Text_en] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysCitiesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysDiseaseGradesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDiseaseGradesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysDiseaseGradesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysDiseasesQuestionsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDiseasesQuestionsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysDiseasesQuestionsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysDoctorsSpecialties]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDoctorsSpecialties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysDoctorsSpecialties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysEntryOrderValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysEntryOrderValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysEntryOrderValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysGovernoratesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGovernoratesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text_ar] [nvarchar](256) NOT NULL,
	[Text_en] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysGovernoratesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineConcentrationsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineConcentrationsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysMedicineConcentrationsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineDosesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineDosesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysMedicineDosesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineFormsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineFormsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysMedicineFormsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicinePeriodsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicinePeriodsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysMedicinePeriodsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicinesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicinesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysMedicinesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineTimingsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineTimingsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysMedicineTimingsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysPatientRecordSectionsValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysPatientRecordSectionsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysPatientRecordSectionsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysRayFileTypesValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRayFileTypesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysRayFileTypesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysRenewalTypeValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRenewalTypeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysRenewalTypeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysSocialStatusValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSocialStatusValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysSocialStatusValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysSubscriberTypeValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSubscriberTypeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysSubscriberTypeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysSubscriptionTypeValues]    Script Date: 28/04/2020 01:16:38 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSubscriptionTypeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SysSubscriptionTypeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200413095840_InitialCreate', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200413230632_DoctorContact', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200414124540_SubscriptionsModels', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200418132803_SubscriptionPaymentModel', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200425104505_ClinicTimeTo', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200425124201_BookingTypeText', N'3.1.3')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Title], [Description]) VALUES (N'18c8a251-e1e0-4415-b78f-481c40caa960', N'doctor', N'DOCTOR', NULL, N'طبيب', N'الأدمن على حساب العيادة وله صلاحيات كاملة على حساب العيادة الخاصة به')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Title], [Description]) VALUES (N'1468e926-f79b-4782-870b-8a47d2441f6e', N'owner', N'OWNER', NULL, N'إدارة', N'ملاك البرنامج صلاحية كاملة على كل العيادات وعلى لوحة التحكم الخاصة بالبرنامج')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Title], [Description]) VALUES (N'1bf305ef-900a-4b8d-8c16-d081650c0606', N'employee', N'EMPLOYEE', NULL, N'موظف', N'صلاحيات محدودة على حساب العيادة التابع لها ولا يرى بيانات السجل المرضي للمريض ولا الإعدادات')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cd048750-2b94-4716-4cda-08d7ea8b0914', N'18c8a251-e1e0-4415-b78f-481c40caa960')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'1468e926-f79b-4782-870b-8a47d2441f6e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e47d02aa-7271-4dc2-97b2-686dde3286a0', N'1468e926-f79b-4782-870b-8a47d2441f6e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a096e3a9-5ff6-4cc5-4cdb-08d7ea8b0914', N'1bf305ef-900a-4b8d-8c16-d081650c0606')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy]) VALUES (N'cd048750-2b94-4716-4cda-08d7ea8b0914', N'bahaaa', N'BAHAAA', N'bahaaa', N'BAHAAA', 0, N'AQAAAAEAACcQAAAAEKEND5gfRTl1bKtwgTiRgWb0J6QlfUXs3seHt9SVxGgL4DKJctjJjnkLApcAJoHLeA==', N'XBR65HE3TL4HS6PG3QPR5QKGJMFNRSQS', N'bf971253-94d9-47c3-aaa4-51f4dceab6e2', NULL, 0, 0, NULL, 1, 0, N'بهاء علي قرنة', 1, 0, CAST(N'2020-04-27T11:11:56.9041021' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:11:56.9042147' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy]) VALUES (N'a096e3a9-5ff6-4cc5-4cdb-08d7ea8b0914', N'ammaar', N'AMMAAR', N'ammaar', N'AMMAAR', 0, N'AQAAAAEAACcQAAAAEHJoFufXySs0nNPNnysJs/29z5Jz3ObGHZB8Y0K7sMsSTU+rHFQSiD3VPT1oJ/FqMw==', N'NPZODJ7KIIURVGVCXORRFFR63GQMHKMA', N'd412c9a1-4b6b-4e25-890a-f9693ff4b433', NULL, 0, 0, NULL, 1, 0, N'عمار بهاء', 1, 0, CAST(N'2020-04-27T11:15:21.2651407' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:15:21.2651546' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy]) VALUES (N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'zizooo.elhor@gmail.com', N'ZIZOOO.ELHOR@GMAIL.COM', N'zizooo.elhor@gmail.com', N'ZIZOOO.ELHOR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM73Cp5SCAIQh4v9grhOFsPtfq9Gq9aQZ5RYR7dHtbD0U894ZWb/75ZR/g9xFuwqiw==', N'CESDIQJMCZVCWJ4F4PHNCWMNJ5O2MYKM', N'82af4d1d-d4ab-433d-ba82-103c86b355d1', NULL, 0, 0, NULL, 1, 0, N'الحُر', 1, 0, CAST(N'2020-04-14T17:11:45.1174899' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-14T17:11:45.1175009' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy]) VALUES (N'e47d02aa-7271-4dc2-97b2-686dde3286a0', N'hatems325@gmail.com', N'HATEMS325@GMAIL.COM', N'hatems325@gmail.com', N'HATEMS325@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGHdAk8qAuUzCk/Xf+FrIKEMA7RNeSoG+ML4fwWE0f/zX7/s3YfKdPmGpsGVAHfAlw==', N'4BY4JSB5WWAWQ6RI6MBQAD6HHLBOZMJQ', N'8e62c9ee-8db7-4489-b968-73882397e001', NULL, 0, 0, NULL, 1, 0, N'حاتم', 1, 0, CAST(N'2020-04-18T14:06:23.8154534' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.8427200' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[ClinicBookingTypes] ON 

INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Text]) VALUES (5, N'32084c94-5b22-4192-9875-a028b092f34e', N'diagnose', CAST(50.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-04-27T11:14:50.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:14:50.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'كشف')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Text]) VALUES (6, N'32084c94-5b22-4192-9875-a028b092f34e', N'consult', CAST(20.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-04-27T11:14:50.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:14:50.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'استشارة')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Text]) VALUES (7, N'32084c94-5b22-4192-9875-a028b092f34e', N'justService', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-04-27T11:14:50.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:14:50.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'خدمة فقط')
SET IDENTITY_INSERT [dbo].[ClinicBookingTypes] OFF
INSERT [dbo].[Clinics] ([Id], [ClinicName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [EntryOrderId], [BookingPeriod], [ConsultExpiration], [PrintDoctorName], [PrintDoctorDegree], [PrintClinicName], [PrintLogoUrl], [PrintAddress1], [PrintAddress2], [PrintAddress3], [PrintPhone1], [PrintPhone2], [PrintPhone3], [IsAllDaysOn], [WorkDays], [IsAllDaysSameTime], [AllDaysTimeFrom], [AllDaysTimeTo], [SaturdayTimeFrom], [SundayTimeFrom], [MondayTimeFrom], [TuesdayTimeFrom], [WednesdayTimeFrom], [ThursdayTimeFrom], [FridayTimeFrom], [SaturdayTimeTo], [SundayTimeTo], [MondayTimeTo], [TuesdayTimeTo], [WednesdayTimeTo], [ThursdayTimeTo], [FridayTimeTo]) VALUES (N'32084c94-5b22-4192-9875-a028b092f34e', N'مركز العظام الدولي', 1, 0, CAST(N'2020-04-27T11:14:50.057' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:14:50.057' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', 3, 15, 15, N'دكتور بهاء قرنة', N'أخصائي تكسير عظام ', N'عيادة العباسية', NULL, N'العباسية', NULL, NULL, N'01111111111', NULL, NULL, 1, N'6, 0, 1, 2, 3, 4, 5', 1, CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'32084c94-5b22-4192-9875-a028b092f34e', N'cd048750-2b94-4716-4cda-08d7ea8b0914')
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'32084c94-5b22-4192-9875-a028b092f34e', N'a096e3a9-5ff6-4cc5-4cdb-08d7ea8b0914')
SET IDENTITY_INSERT [dbo].[DoctorAnalysisValues] ON 

INSERT [dbo].[DoctorAnalysisValues] ([Id], [DoctorId], [AnalysisName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'Diabets', 1, 0, CAST(N'2020-04-28T13:03:02.230' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T13:03:02.233' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorAnalysisValues] OFF
INSERT [dbo].[DoctorClinics] ([DoctorId], [ClinicId]) VALUES (N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'32084c94-5b22-4192-9875-a028b092f34e')
SET IDENTITY_INSERT [dbo].[DoctorComplaintChoicesValues] ON 

INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, N'اليد اليمنى', 1, 0, CAST(N'2020-04-27T15:11:56.257' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T15:11:56.257' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, N'اليد اليسرى', 1, 0, CAST(N'2020-04-27T15:12:04.760' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T15:12:04.763' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorComplaintChoicesValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorDetailedComplaintsValues] ON 

INSERT [dbo].[DoctorDetailedComplaintsValues] ([Id], [DoctorId], [Complaint], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'ورم بكف اليد', 1, 0, CAST(N'2020-04-27T14:58:44.427' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T14:58:44.427' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorDetailedComplaintsValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorDiagnosisValues] ON 

INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'قطع في غضروف الركبة', 1, 0, CAST(N'2020-04-28T11:57:35.860' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T11:57:35.860' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorDiagnosisValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorExaminationAreasValues] ON 

INSERT [dbo].[DoctorExaminationAreasValues] ([Id], [DoctorId], [ExaminationArea], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'منطقة الظهر', 1, 0, CAST(N'2020-04-28T11:42:05.267' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T11:42:05.267' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorExaminationAreasValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorExaminationsValues] ON 

INSERT [dbo].[DoctorExaminationsValues] ([Id], [DoctorId], [Examination], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'فحص جزئي', 1, 0, CAST(N'2020-04-28T11:39:39.267' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T11:39:39.270' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorExaminationsValues] OFF
INSERT [dbo].[DoctorGeneralComplaintsValues] ([Id], [DoctorId], [Complaint], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (0, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'ورم بالكاحل', 1, 0, CAST(N'2020-04-27T14:52:26.777' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T14:52:26.777' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorMedicinesValues] ON 

INSERT [dbo].[DoctorMedicinesValues] ([Id], [DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', 1, 1, 0, CAST(N'2020-04-27T12:11:28.240' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T12:11:28.243' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorMedicinesValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorOperationTypesValues] ON 

INSERT [dbo].[DoctorOperationTypesValues] ([Id], [DoctorId], [OperationType], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'منظار ركبة', 1, 0, CAST(N'2020-04-28T13:14:34.180' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T13:14:34.180' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorOperationTypesValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorRayAreasValues] ON 

INSERT [dbo].[DoctorRayAreasValues] ([Id], [DoctorId], [RayArea], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'Left Hand', 1, 0, CAST(N'2020-04-28T12:17:23.493' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T12:17:23.493' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorRayAreasValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorRaysValues] ON 

INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'X-Ray', 1, 0, CAST(N'2020-04-28T12:17:13.053' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-28T12:17:13.053' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[DoctorRaysValues] OFF
INSERT [dbo].[Doctors] ([Id], [UserId], [SpecialtyId], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [PatientRecordSections], [DiseasesQuestions], [Phone1], [Phone2], [Phone3], [WhatsApp], [Email1], [Email2], [Facebook], [Twitter], [LinkedIn], [Instagram]) VALUES (N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', N'cd048750-2b94-4716-4cda-08d7ea8b0914', 1, N'بهاء علي قرنة', 1, 0, CAST(N'2020-04-27T11:12:07.900' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:12:07.903' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'All', N'All', N'01111111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Plans] ON 

INSERT [dbo].[Plans] ([Id], [Title], [Description], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [RenewalTypeId], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (1, N'الباقة الصغيرة', NULL, 1, 0, CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(500.00 AS Decimal(18, 2)), 1, CAST(300.00 AS Decimal(18, 2)), NULL, 30, 3, 20, 500, 5)
INSERT [dbo].[Plans] ([Id], [Title], [Description], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [RenewalTypeId], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (2, N'الباقة المتوسطة', NULL, 1, 0, CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(3000.00 AS Decimal(18, 2)), 1, CAST(1000.00 AS Decimal(18, 2)), NULL, 30, 10, 500, 1000, 10)
INSERT [dbo].[Plans] ([Id], [Title], [Description], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [RenewalTypeId], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (3, N'الباقة الكبيرة', NULL, 1, 0, CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(10000.00 AS Decimal(18, 2)), 1, CAST(3000.00 AS Decimal(18, 2)), NULL, 30, 100, 2000, 10000, 20)
SET IDENTITY_INSERT [dbo].[Plans] OFF
SET IDENTITY_INSERT [dbo].[SubscriptionPayments] ON 

INSERT [dbo].[SubscriptionPayments] ([Id], [SubscriptionId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 4, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2020-04-30T00:00:00.000' AS DateTime), NULL, CAST(N'2020-04-27T11:12:22.070' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:12:22.070' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[SubscriptionPayments] OFF
SET IDENTITY_INSERT [dbo].[Subscriptions] ON 

INSERT [dbo].[Subscriptions] ([Id], [SubscriberId], [SubscriberTypeId], [PlanId], [SubscriptionTypeId], [StartDate], [EndDate], [Note], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (4, N'a95377e4-a5f6-4b76-9a79-680e44c34ec1', 1, 2, 1, CAST(N'2020-04-27' AS Date), CAST(N'2021-04-27' AS Date), NULL, 1, 0, CAST(N'2020-04-27T11:12:22.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-27T11:12:22.063' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(3000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL, 30, 10, 500, 1000, 10)
SET IDENTITY_INSERT [dbo].[Subscriptions] OFF
SET IDENTITY_INSERT [dbo].[SysBloodPressureValues] ON 

INSERT [dbo].[SysBloodPressureValues] ([Id], [Value], [Text]) VALUES (1, N'Hypotension', N'Hypotension')
INSERT [dbo].[SysBloodPressureValues] ([Id], [Value], [Text]) VALUES (2, N'Normal', N'Normal')
INSERT [dbo].[SysBloodPressureValues] ([Id], [Value], [Text]) VALUES (3, N'Hypertension', N'Hypertension')
SET IDENTITY_INSERT [dbo].[SysBloodPressureValues] OFF
SET IDENTITY_INSERT [dbo].[SysCitiesValues] ON 

INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (1, 1, N'القاهره', N'Cairo')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (2, 2, N'الجيزة', N'Giza')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (3, 2, N'السادس من أكتوبر', N'Sixth of October')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (4, 2, N'الشيخ زايد', N'Cheikh Zayed')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (5, 2, N'الحوامدية', N'Hawamdiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (6, 2, N'البدرشين', N'Al Badrasheen')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (7, 2, N'الصف', N'Saf')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (8, 2, N'أطفيح', N'Atfih')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (9, 2, N'العياط', N'Al Ayat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (10, 2, N'الباويطي', N'Al-Bawaiti')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (11, 2, N'منشأة القناطر', N'ManshiyetAl Qanater')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (12, 2, N'أوسيم', N'Oaseem')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (13, 2, N'كرداسة', N'Kerdasa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (14, 2, N'أبو النمرس', N'Abu Nomros')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (15, 2, N'كفر غطاطي', N'Kafr Ghati')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (16, 2, N'منشأة البكاري', N'Manshiyet Al Bakari')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (17, 3, N'الأسكندرية', N'Alexandria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (18, 3, N'برج العرب', N'Burj Al Arab')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (19, 3, N'برج العرب الجديدة', N'New Burj Al Arab')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (20, 12, N'بنها', N'Banha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (21, 12, N'قليوب', N'Qalyub')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (22, 12, N'شبرا الخيمة', N'Shubra Al Khaimah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (23, 12, N'القناطر الخيرية', N'Al Qanater Charity')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (24, 12, N'الخانكة', N'Khanka')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (25, 12, N'كفر شكر', N'Kafr Shukr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (26, 12, N'طوخ', N'Tukh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (27, 12, N'قها', N'Qaha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (28, 12, N'العبور', N'Obour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (29, 12, N'الخصوص', N'Khosous')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (30, 12, N'شبين القناطر', N'Shibin Al Qanater')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (31, 6, N'دمنهور', N'Damanhour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (32, 6, N'كفر الدوار', N'Kafr El Dawar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (33, 6, N'رشيد', N'Rashid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (34, 6, N'إدكو', N'Edco')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (35, 6, N'أبو المطامير', N'Abu al-Matamir')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (36, 6, N'أبو حمص', N'Abu Homs')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (37, 6, N'الدلنجات', N'Delengat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (38, 6, N'المحمودية', N'Mahmoudiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (39, 6, N'الرحمانية', N'Rahmaniyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (40, 6, N'إيتاي البارود', N'Itai Baroud')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (41, 6, N'حوش عيسى', N'Housh Eissa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (42, 6, N'شبراخيت', N'Shubrakhit')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (43, 6, N'كوم حمادة', N'Kom Hamada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (44, 6, N'بدر', N'Badr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (45, 6, N'وادي النطرون', N'Wadi Natrun')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (46, 6, N'النوبارية الجديدة', N'New Nubaria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (47, 23, N'مرسى مطروح', N'Marsa Matrouh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (48, 23, N'الحمام', N'El Hamam')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (49, 23, N'العلمين', N'Alamein')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (50, 23, N'الضبعة', N'Dabaa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (51, 23, N'النجيلة', N'Al-Nagila')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (52, 23, N'سيدي براني', N'Sidi Brani')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (53, 23, N'السلوم', N'Salloum')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (54, 23, N'سيوة', N'Siwa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (55, 19, N'دمياط', N'Damietta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (56, 19, N'دمياط الجديدة', N'New Damietta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (57, 19, N'رأس البر', N'Ras El Bar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (58, 19, N'فارسكور', N'Faraskour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (59, 19, N'الزرقا', N'Zarqa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (60, 19, N'السرو', N'alsaru')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (61, 19, N'الروضة', N'alruwda')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (62, 19, N'كفر البطيخ', N'Kafr El-Batikh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (63, 19, N'عزبة البرج', N'Azbet Al Burg')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (64, 19, N'ميت أبو غالب', N'Meet Abou Ghalib')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (65, 19, N'كفر سعد', N'Kafr Saad')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (66, 4, N'المنصورة', N'Mansoura')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (67, 4, N'طلخا', N'Talkha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (68, 4, N'ميت غمر', N'Mitt Ghamr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (69, 4, N'دكرنس', N'Dekernes')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (70, 4, N'أجا', N'Aga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (71, 4, N'منية النصر', N'Menia El Nasr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (72, 4, N'السنبلاوين', N'Sinbillawin')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (73, 4, N'الكردي', N'El Kurdi')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (74, 4, N'بني عبيد', N'Bani Ubaid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (75, 4, N'المنزلة', N'Al Manzala')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (76, 4, N'تمي الأمديد', N'tami alamdid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (77, 4, N'الجمالية', N'aljamalia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (78, 4, N'شربين', N'Sherbin')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (79, 4, N'المطرية', N'Mataria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (80, 4, N'بلقاس', N'Belqas')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (81, 4, N'ميت سلسيل', N'Meet Salsil')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (82, 4, N'جمصة', N'Gamasa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (83, 4, N'محلة دمنة', N'Mahalat Damana')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (84, 4, N'نبروه', N'Nabroh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (85, 22, N'كفر الشيخ', N'Kafr El Sheikh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (86, 22, N'دسوق', N'Desouq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (87, 22, N'فوه', N'Fooh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (88, 22, N'مطوبس', N'Metobas')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (89, 22, N'برج البرلس', N'Burg Al Burullus')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (90, 22, N'بلطيم', N'Baltim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (91, 22, N'مصيف بلطيم', N'Masief Baltim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (92, 22, N'الحامول', N'Hamol')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (93, 22, N'بيلا', N'Bella')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (94, 22, N'الرياض', N'Riyadh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (95, 22, N'سيدي سالم', N'Sidi Salm')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (96, 22, N'قلين', N'Qellen')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (97, 22, N'سيدي غازي', N'Sidi Ghazi')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (98, 8, N'طنطا', N'Tanta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (99, 8, N'المحلة الكبرى', N'Al Mahalla Al Kobra')
GO
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (100, 8, N'كفر الزيات', N'Kafr El Zayat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (101, 8, N'زفتى', N'Zefta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (102, 8, N'السنطة', N'El Santa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (103, 8, N'قطور', N'Qutour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (104, 8, N'بسيون', N'Basion')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (105, 8, N'سمنود', N'Samannoud')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (106, 10, N'شبين الكوم', N'Shbeen El Koom')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (107, 10, N'مدينة السادات', N'Sadat City')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (108, 10, N'منوف', N'Menouf')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (109, 10, N'سرس الليان', N'Sars El-Layan')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (110, 10, N'أشمون', N'Ashmon')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (111, 10, N'الباجور', N'Al Bagor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (112, 10, N'قويسنا', N'Quesna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (113, 10, N'بركة السبع', N'Berkat El Saba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (114, 10, N'تلا', N'Tala')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (115, 10, N'الشهداء', N'Al Shohada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (116, 20, N'الزقازيق', N'Zagazig')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (117, 20, N'العاشر من رمضان', N'Al Ashr Men Ramadan')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (118, 20, N'منيا القمح', N'Minya Al Qamh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (119, 20, N'بلبيس', N'Belbeis')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (120, 20, N'مشتول السوق', N'Mashtoul El Souq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (121, 20, N'القنايات', N'Qenaiat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (122, 20, N'أبو حماد', N'Abu Hammad')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (123, 20, N'القرين', N'El Qurain')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (124, 20, N'ههيا', N'Hehia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (125, 20, N'أبو كبير', N'Abu Kabir')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (126, 20, N'فاقوس', N'Faccus')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (127, 20, N'الصالحية الجديدة', N'El Salihia El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (128, 20, N'الإبراهيمية', N'Al Ibrahimiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (129, 20, N'ديرب نجم', N'Deirb Negm')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (130, 20, N'كفر صقر', N'Kafr Saqr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (131, 20, N'أولاد صقر', N'Awlad Saqr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (132, 20, N'الحسينية', N'Husseiniya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (133, 20, N'صان الحجر القبلية', N'san alhajar alqablia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (134, 20, N'منشأة أبو عمر', N'Manshayat Abu Omar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (135, 18, N'بورسعيد', N'PorSaid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (136, 18, N'بورفؤاد', N'PorFouad')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (137, 9, N'الإسماعيلية', N'Ismailia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (138, 9, N'فايد', N'Fayed')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (139, 9, N'القنطرة شرق', N'Qantara Sharq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (140, 9, N'القنطرة غرب', N'Qantara Gharb')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (141, 9, N'التل الكبير', N'El Tal El Kabier')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (142, 9, N'أبو صوير', N'Abu Sawir')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (143, 9, N'القصاصين الجديدة', N'Kasasien El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (144, 14, N'السويس', N'Suez')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (145, 26, N'العريش', N'Arish')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (146, 26, N'نخل', N'Nakhl')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (147, 26, N'رفح', N'Rafah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (148, 26, N'بئر العبد', N'Bir al-Abed')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (149, 26, N'الحسنة', N'Al Hasana')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (150, 21, N'الطور', N'Al Toor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (151, 21, N'شرم الشيخ', N'Sharm El-Shaikh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (152, 21, N'دهب', N'Dahab')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (153, 21, N'نويبع', N'Nuweiba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (154, 21, N'طابا', N'Taba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (155, 21, N'سانت كاترين', N'Saint Catherine')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (156, 21, N'أبو رديس', N'Abu Redis')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (157, 21, N'أبو زنيمة', N'Abu Zenaima')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (158, 21, N'رأس سدر', N'Ras Sidr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (159, 17, N'بني سويف', N'Bani Sweif')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (160, 17, N'بني سويف الجديدة', N'Beni Suef El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (161, 17, N'الواسطى', N'Al Wasta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (162, 17, N'ناصر', N'Naser')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (163, 17, N'إهناسيا', N'Ehnasia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (164, 17, N'ببا', N'beba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (165, 17, N'الفشن', N'Fashn')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (166, 17, N'سمسطا', N'Somasta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (167, 7, N'الفيوم', N'Fayoum')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (168, 7, N'الفيوم الجديدة', N'Fayoum El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (169, 7, N'طامية', N'Tamiya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (170, 7, N'سنورس', N'Snores')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (171, 7, N'إطسا', N'Etsa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (172, 7, N'إبشواي', N'Epschway')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (173, 7, N'يوسف الصديق', N'Yusuf El Sediaq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (174, 11, N'المنيا', N'Minya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (175, 11, N'المنيا الجديدة', N'Minya El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (176, 11, N'العدوة', N'El Adwa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (177, 11, N'مغاغة', N'Magagha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (178, 11, N'بني مزار', N'Bani Mazar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (179, 11, N'مطاي', N'Mattay')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (180, 11, N'سمالوط', N'Samalut')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (181, 11, N'المدينة الفكرية', N'Madinat El Fekria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (182, 11, N'ملوي', N'Meloy')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (183, 11, N'دير مواس', N'Deir Mawas')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (184, 16, N'أسيوط', N'Assiut')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (185, 16, N'أسيوط الجديدة', N'Assiut El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (186, 16, N'ديروط', N'Dayrout')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (187, 16, N'منفلوط', N'Manfalut')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (188, 16, N'القوصية', N'Qusiya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (189, 16, N'أبنوب', N'Abnoub')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (190, 16, N'أبو تيج', N'Abu Tig')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (191, 16, N'الغنايم', N'El Ghanaim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (192, 16, N'ساحل سليم', N'Sahel Selim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (193, 16, N'البداري', N'El Badari')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (194, 16, N'صدفا', N'Sidfa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (195, 13, N'الخارجة', N'El Kharga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (196, 13, N'باريس', N'Paris')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (197, 13, N'موط', N'Mout')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (198, 13, N'الفرافرة', N'Farafra')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (199, 13, N'بلاط', N'Balat')
GO
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (200, 5, N'الغردقة', N'Hurghada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (201, 5, N'رأس غارب', N'Ras Ghareb')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (202, 5, N'سفاجا', N'Safaga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (203, 5, N'القصير', N'El Qusiar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (204, 5, N'مرسى علم', N'Marsa Alam')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (205, 5, N'الشلاتين', N'Shalatin')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (206, 5, N'حلايب', N'Halaib')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (207, 27, N'سوهاج', N'Sohag')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (208, 27, N'سوهاج الجديدة', N'Sohag El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (209, 27, N'أخميم', N'Akhmeem')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (210, 27, N'أخميم الجديدة', N'Akhmim El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (211, 27, N'البلينا', N'Albalina')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (212, 27, N'المراغة', N'El Maragha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (213, 27, N'المنشأة', N'almunshaa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (214, 27, N'دار السلام', N'Dar AISalaam')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (215, 27, N'جرجا', N'Gerga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (216, 27, N'جهينة الغربية', N'Jahina Al Gharbia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (217, 27, N'ساقلته', N'Saqilatuh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (218, 27, N'طما', N'Tama')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (219, 27, N'طهطا', N'Tahta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (220, 25, N'قنا', N'Qena')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (221, 25, N'قنا الجديدة', N'New Qena')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (222, 25, N'أبو تشت', N'Abu Tesht')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (223, 25, N'نجع حمادي', N'Nag Hammadi')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (224, 25, N'دشنا', N'Deshna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (225, 25, N'الوقف', N'Alwaqf')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (226, 25, N'قفط', N'Qaft')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (227, 25, N'نقادة', N'Naqada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (228, 25, N'فرشوط', N'Farshout')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (229, 25, N'قوص', N'Quos')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (230, 24, N'الأقصر', N'Luxor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (231, 24, N'الأقصر الجديدة', N'New Luxor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (232, 24, N'إسنا', N'Esna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (233, 24, N'طيبة الجديدة', N'New Tiba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (234, 24, N'الزينية', N'Al ziynia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (235, 24, N'البياضية', N'Al Bayadieh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (236, 24, N'القرنة', N'Al Qarna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (237, 24, N'أرمنت', N'Armant')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (238, 24, N'الطود', N'Al Tud')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (239, 15, N'أسوان', N'Aswan')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (240, 15, N'أسوان الجديدة', N'Aswan El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (241, 15, N'دراو', N'Drau')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (242, 15, N'كوم أمبو', N'Kom Ombo')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (243, 15, N'نصر النوبة', N'Nasr Al Nuba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (244, 15, N'كلابشة', N'Kalabsha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (245, 15, N'إدفو', N'Edfu')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (246, 15, N'الرديسية', N'Al-Radisiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (247, 15, N'البصيلية', N'Al Basilia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (248, 15, N'السباعية', N'Al Sibaeia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [Text_ar], [Text_en]) VALUES (249, 15, N'ابوسمبل السياحية', N'Abo Simbl Al Siyahia')
SET IDENTITY_INSERT [dbo].[SysCitiesValues] OFF
SET IDENTITY_INSERT [dbo].[SysDiseaseGradesValues] ON 

INSERT [dbo].[SysDiseaseGradesValues] ([Id], [Value], [Text]) VALUES (1, N'Grade 0', N'Grade 0')
INSERT [dbo].[SysDiseaseGradesValues] ([Id], [Value], [Text]) VALUES (2, N'Grade 1', N'Grade 1')
INSERT [dbo].[SysDiseaseGradesValues] ([Id], [Value], [Text]) VALUES (3, N'Grade 2', N'Grade 2')
INSERT [dbo].[SysDiseaseGradesValues] ([Id], [Value], [Text]) VALUES (4, N'Grade 3', N'Grade 3')
INSERT [dbo].[SysDiseaseGradesValues] ([Id], [Value], [Text]) VALUES (5, N'Grade 4', N'Grade 4')
INSERT [dbo].[SysDiseaseGradesValues] ([Id], [Value], [Text]) VALUES (6, N'Grade 5', N'Grade 5')
SET IDENTITY_INSERT [dbo].[SysDiseaseGradesValues] OFF
SET IDENTITY_INSERT [dbo].[SysDiseasesQuestionsValues] ON 

INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (1, N'Do you have blood pressure?', N'هل تعاني من ضغط الدم؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (2, N'Do you have blood thinners?', N'هل تعاني من سيولة الدم؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (3, N'Do you have diabetes?', N'هل تعاني من السكر؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (4, N'Do you have heart disease?', N'هل تعاني من أمراض القلب؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (5, N'Do you have liver disease?', N'هل تعاني من أمراض الكبد؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (6, N'Do you have kidney disease?', N'هل تعاني من أمراض الكلى؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (7, N'Do you have chest diseases?', N'هل تعاني من أمراض الصدر؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (8, N'Do you have psoriasis?', N'هل تعاني من الصدفية؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (9, N'Do you have thyroid disorders?', N'هل تعاني من اضطرابات في الغدة الدرقية؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (10, N'Do you have a pregnancy?', N'هل هناك حمل؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (11, N'Do you have breastfeeding?', N'هل هناك رضاعة؟')
INSERT [dbo].[SysDiseasesQuestionsValues] ([Id], [Value], [Text]) VALUES (12, N'Have you had any surgery in the last six months?', N'هل أجريت أي عملية جراحية خلال آخر ستة شهور؟')
SET IDENTITY_INSERT [dbo].[SysDiseasesQuestionsValues] OFF
SET IDENTITY_INSERT [dbo].[SysDoctorsSpecialties] ON 

INSERT [dbo].[SysDoctorsSpecialties] ([Id], [Value], [Text]) VALUES (1, N'عظام', N'عظام')
INSERT [dbo].[SysDoctorsSpecialties] ([Id], [Value], [Text]) VALUES (2, N'روماتيزم', N'روماتيزم')
INSERT [dbo].[SysDoctorsSpecialties] ([Id], [Value], [Text]) VALUES (3, N'عيون', N'عيون')
SET IDENTITY_INSERT [dbo].[SysDoctorsSpecialties] OFF
SET IDENTITY_INSERT [dbo].[SysEntryOrderValues] ON 

INSERT [dbo].[SysEntryOrderValues] ([Id], [Value], [Text]) VALUES (1, N'According to the Attendance', N'بأسبقية الحضور')
INSERT [dbo].[SysEntryOrderValues] ([Id], [Value], [Text]) VALUES (2, N'According to the Booking Time', N'بموعد الحجز')
INSERT [dbo].[SysEntryOrderValues] ([Id], [Value], [Text]) VALUES (3, N'Manual', N'يدوي')
SET IDENTITY_INSERT [dbo].[SysEntryOrderValues] OFF
SET IDENTITY_INSERT [dbo].[SysGovernoratesValues] ON 

INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (1, N'القاهرة', N'Cairo')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (2, N'الجيزة', N'Giza')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (3, N'الأسكندرية', N'Alexandria')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (4, N'الدقهلية', N'Dakahlia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (5, N'البحر الأحمر', N'Red Sea')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (6, N'البحيرة', N'Beheira')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (7, N'الفيوم', N'Fayoum')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (8, N'الغربية', N'Gharbiya')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (9, N'الإسماعلية', N'Ismailia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (10, N'المنوفية', N'Monofia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (11, N'المنيا', N'Minya')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (12, N'القليوبية', N'Qaliubiya')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (13, N'الوادي الجديد', N'New Valley')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (14, N'السويس', N'Suez')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (15, N'اسوان', N'Aswan')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (16, N'اسيوط', N'Assiut')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (17, N'بني سويف', N'Beni Suef')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (18, N'بورسعيد', N'Port Said')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (19, N'دمياط', N'Damietta')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (20, N'الشرقية', N'Sharkia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (21, N'جنوب سيناء', N'South Sinai')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (22, N'كفر الشيخ', N'Kafr Al sheikh')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (23, N'مطروح', N'Matrouh')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (24, N'الأقصر', N'Luxor')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (25, N'قنا', N'Qena')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (26, N'شمال سيناء', N'North Sinai')
INSERT [dbo].[SysGovernoratesValues] ([Id], [Text_ar], [Text_en]) VALUES (27, N'سوهاج', N'Sohag')
SET IDENTITY_INSERT [dbo].[SysGovernoratesValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineConcentrationsValues] ON 

INSERT [dbo].[SysMedicineConcentrationsValues] ([Id], [Value], [Text]) VALUES (1, N'1 mg', N'1 mg')
INSERT [dbo].[SysMedicineConcentrationsValues] ([Id], [Value], [Text]) VALUES (2, N'2 mg', N'2 mg')
SET IDENTITY_INSERT [dbo].[SysMedicineConcentrationsValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineDosesValues] ON 

INSERT [dbo].[SysMedicineDosesValues] ([Id], [Value], [Text]) VALUES (1, N'مرة واحدة يومياً', N'مرة واحدة يومياً')
INSERT [dbo].[SysMedicineDosesValues] ([Id], [Value], [Text]) VALUES (2, N'مرتان يومياً', N'مرتان يومياً')
INSERT [dbo].[SysMedicineDosesValues] ([Id], [Value], [Text]) VALUES (3, N'ثلاث مرات يومياً', N'ثلاث مرات يومياً')
SET IDENTITY_INSERT [dbo].[SysMedicineDosesValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineFormsValues] ON 

INSERT [dbo].[SysMedicineFormsValues] ([Id], [Value], [Text]) VALUES (1, N'Tab', N'Tab')
SET IDENTITY_INSERT [dbo].[SysMedicineFormsValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicinePeriodsValues] ON 

INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (1, N'لمدة يوم واحد', N'لمدة يوم واحد')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (2, N'لمدة يومين', N'لمدة يومين')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (3, N'لمدة ثلاثة أيام', N'لمدة ثلاثة أيام')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (4, N'لمدة خمسة أيام', N'لمدة خمسة أيام')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (5, N'لمدة أسبوع', N'لمدة أسبوع')
SET IDENTITY_INSERT [dbo].[SysMedicinePeriodsValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicinesValues] ON 

INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (1, N'Antox', N'Antox')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2, N'Cornivita', N'Cornivita')
SET IDENTITY_INSERT [dbo].[SysMedicinesValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineTimingsValues] ON 

INSERT [dbo].[SysMedicineTimingsValues] ([Id], [Value], [Text]) VALUES (1, N'قبل الأكل', N'قبل الأكل')
INSERT [dbo].[SysMedicineTimingsValues] ([Id], [Value], [Text]) VALUES (2, N'بعد الأكل', N'بعد الأكل')
SET IDENTITY_INSERT [dbo].[SysMedicineTimingsValues] OFF
SET IDENTITY_INSERT [dbo].[SysPatientRecordSectionsValues] ON 

INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (1, N'Patient Complaint', N'شكوى المريض')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (2, N'Patient History', N'التاريخ المرضي')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (3, N'Examination', N'الفحص')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (4, N'Diagnosis', N'التشخيص')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (5, N' X-Rays', N'الأشعة')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (6, N'Analyses', N'التحاليل')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (7, N'Operations', N'عمليات')
SET IDENTITY_INSERT [dbo].[SysPatientRecordSectionsValues] OFF
SET IDENTITY_INSERT [dbo].[SysRayFileTypesValues] ON 

INSERT [dbo].[SysRayFileTypesValues] ([Id], [Value], [Text]) VALUES (1, N'قبل العلاج', N'قبل العلاج')
INSERT [dbo].[SysRayFileTypesValues] ([Id], [Value], [Text]) VALUES (2, N'بعد العلاج', N'بعد العلاج')
INSERT [dbo].[SysRayFileTypesValues] ([Id], [Value], [Text]) VALUES (3, N'صورة أشعة', N'صورة أشعة')
INSERT [dbo].[SysRayFileTypesValues] ([Id], [Value], [Text]) VALUES (4, N'تقرير أشعة', N'تقرير أشعة')
SET IDENTITY_INSERT [dbo].[SysRayFileTypesValues] OFF
SET IDENTITY_INSERT [dbo].[SysRenewalTypeValues] ON 

INSERT [dbo].[SysRenewalTypeValues] ([Id], [Value], [Text]) VALUES (1, N'Annual', N'سنوي')
INSERT [dbo].[SysRenewalTypeValues] ([Id], [Value], [Text]) VALUES (2, N'Monthly', N'شهري')
SET IDENTITY_INSERT [dbo].[SysRenewalTypeValues] OFF
SET IDENTITY_INSERT [dbo].[SysSocialStatusValues] ON 

INSERT [dbo].[SysSocialStatusValues] ([Id], [Value], [Text]) VALUES (1, N'Single', N'أعزب / آنسة')
INSERT [dbo].[SysSocialStatusValues] ([Id], [Value], [Text]) VALUES (2, N'Married', N'متزوج / متزوجة')
INSERT [dbo].[SysSocialStatusValues] ([Id], [Value], [Text]) VALUES (3, N'Divorced', N'مطلق / مطلقة')
INSERT [dbo].[SysSocialStatusValues] ([Id], [Value], [Text]) VALUES (4, N'Widower', N'أرمل / أرملة')
SET IDENTITY_INSERT [dbo].[SysSocialStatusValues] OFF
SET IDENTITY_INSERT [dbo].[SysSubscriberTypeValues] ON 

INSERT [dbo].[SysSubscriberTypeValues] ([Id], [Value], [Text]) VALUES (1, N'Doctor', N'عيادة')
INSERT [dbo].[SysSubscriberTypeValues] ([Id], [Value], [Text]) VALUES (2, N'Pharmacy', N'صيدلية')
INSERT [dbo].[SysSubscriberTypeValues] ([Id], [Value], [Text]) VALUES (3, N'Lab', N'معمل تحاليل')
INSERT [dbo].[SysSubscriberTypeValues] ([Id], [Value], [Text]) VALUES (4, N'RaysCenter', N'مركز أشعة')
SET IDENTITY_INSERT [dbo].[SysSubscriberTypeValues] OFF
SET IDENTITY_INSERT [dbo].[SysSubscriptionTypeValues] ON 

INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (1, N'FirstTime', N'اشتراك أول مرة')
INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (2, N'Renewal', N'تجديد اشتراك')
INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (3, N'Upgrade', N'ترقية الباقة')
INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (4, N'DownGrade', N'تخفيض الباقة')
SET IDENTITY_INSERT [dbo].[SysSubscriptionTypeValues] OFF
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPayments_BookingId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_BookingPayments_BookingId] ON [dbo].[BookingPayments]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_DiscountId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_DiscountId] ON [dbo].[Bookings]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_PatientId] ON [dbo].[Bookings]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_TypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_TypeId] ON [dbo].[Bookings]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingServices_ServiceId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_BookingServices_ServiceId] ON [dbo].[BookingServices]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicBookingTypes_ClinicId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicBookingTypes_ClinicId] ON [dbo].[ClinicBookingTypes]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicDiscounts_ClinicId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicDiscounts_ClinicId] ON [dbo].[ClinicDiscounts]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clinics_EntryOrderId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Clinics_EntryOrderId] ON [dbo].[Clinics]
(
	[EntryOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicServices_ClinicId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicServices_ClinicId] ON [dbo].[ClinicServices]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicUsers_UserId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicUsers_UserId] ON [dbo].[ClinicUsers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorAnalysisValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorAnalysisValues_DoctorId] ON [dbo].[DoctorAnalysisValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorClinics_ClinicId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorClinics_ClinicId] ON [dbo].[DoctorClinics]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorComplaintChoicesValues_DetailedComplaintId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorComplaintChoicesValues_DetailedComplaintId] ON [dbo].[DoctorComplaintChoicesValues]
(
	[DetailedComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorDetailedComplaintsValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorDetailedComplaintsValues_DoctorId] ON [dbo].[DoctorDetailedComplaintsValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorDiagnosisValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorDiagnosisValues_DoctorId] ON [dbo].[DoctorDiagnosisValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorExaminationAreasValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorExaminationAreasValues_DoctorId] ON [dbo].[DoctorExaminationAreasValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorExaminationsValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorExaminationsValues_DoctorId] ON [dbo].[DoctorExaminationsValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorGeneralComplaintsValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorGeneralComplaintsValues_DoctorId] ON [dbo].[DoctorGeneralComplaintsValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorMedicinesValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorMedicinesValues_DoctorId] ON [dbo].[DoctorMedicinesValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorMedicinesValues_MedicineId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorMedicinesValues_MedicineId] ON [dbo].[DoctorMedicinesValues]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorOperationTypesValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorOperationTypesValues_DoctorId] ON [dbo].[DoctorOperationTypesValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorRayAreasValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorRayAreasValues_DoctorId] ON [dbo].[DoctorRayAreasValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorRaysValues_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorRaysValues_DoctorId] ON [dbo].[DoctorRaysValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Doctors_SpecialtyId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Doctors_SpecialtyId] ON [dbo].[Doctors]
(
	[SpecialtyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysis_AnalysisId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysis_AnalysisId] ON [dbo].[PatientAnalysis]
(
	[AnalysisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysis_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysis_PatientId] ON [dbo].[PatientAnalysis]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysis_ResultGradeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysis_ResultGradeId] ON [dbo].[PatientAnalysis]
(
	[ResultGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysisFiles_FileTypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysisFiles_FileTypeId] ON [dbo].[PatientAnalysisFiles]
(
	[FileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysisFiles_PatientAnalysisId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysisFiles_PatientAnalysisId] ON [dbo].[PatientAnalysisFiles]
(
	[PatientAnalysisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDetailedComplaints_ComplaintChoiceId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDetailedComplaints_ComplaintChoiceId] ON [dbo].[PatientDetailedComplaints]
(
	[ComplaintChoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDetailedComplaints_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDetailedComplaints_PatientId] ON [dbo].[PatientDetailedComplaints]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiagnosis_DiagnosisId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiagnosis_DiagnosisId] ON [dbo].[PatientDiagnosis]
(
	[DiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiagnosis_GradeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiagnosis_GradeId] ON [dbo].[PatientDiagnosis]
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiagnosis_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiagnosis_PatientId] ON [dbo].[PatientDiagnosis]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiseases_DiseaseId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiseases_DiseaseId] ON [dbo].[PatientDiseases]
(
	[DiseaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiseases_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiseases_PatientId] ON [dbo].[PatientDiseases]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientExaminations_ExaminationAreaId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientExaminations_ExaminationAreaId] ON [dbo].[PatientExaminations]
(
	[ExaminationAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientExaminations_ExaminationId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientExaminations_ExaminationId] ON [dbo].[PatientExaminations]
(
	[ExaminationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientExaminations_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientExaminations_PatientId] ON [dbo].[PatientExaminations]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientGeneralComplaints_GeneralComplaintId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientGeneralComplaints_GeneralComplaintId] ON [dbo].[PatientGeneralComplaints]
(
	[GeneralComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientGeneralComplaints_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientGeneralComplaints_PatientId] ON [dbo].[PatientGeneralComplaints]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientOperations_OperationTypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientOperations_OperationTypeId] ON [dbo].[PatientOperations]
(
	[OperationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientOperations_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientOperations_PatientId] ON [dbo].[PatientOperations]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_ConcentrationId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_ConcentrationId] ON [dbo].[PatientPrescriptions]
(
	[ConcentrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_DoseId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_DoseId] ON [dbo].[PatientPrescriptions]
(
	[DoseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_FormId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_FormId] ON [dbo].[PatientPrescriptions]
(
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_MedicineId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_MedicineId] ON [dbo].[PatientPrescriptions]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_PatientId] ON [dbo].[PatientPrescriptions]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_PeriodId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_PeriodId] ON [dbo].[PatientPrescriptions]
(
	[PeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_TimingId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_TimingId] ON [dbo].[PatientPrescriptions]
(
	[TimingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRayFiles_FileTypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRayFiles_FileTypeId] ON [dbo].[PatientRayFiles]
(
	[FileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRayFiles_PatientRayId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRayFiles_PatientRayId] ON [dbo].[PatientRayFiles]
(
	[PatientRayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_PatientId] ON [dbo].[PatientRays]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_RayAreaId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_RayAreaId] ON [dbo].[PatientRays]
(
	[RayAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_RayId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_RayId] ON [dbo].[PatientRays]
(
	[RayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_ResultGradeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_ResultGradeId] ON [dbo].[PatientRays]
(
	[ResultGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientReferrals_PatientId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientReferrals_PatientId] ON [dbo].[PatientReferrals]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientReferrals_ReferralToDoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientReferrals_ReferralToDoctorId] ON [dbo].[PatientReferrals]
(
	[ReferralToDoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_BloodPressureId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_BloodPressureId] ON [dbo].[Patients]
(
	[BloodPressureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_CityId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_CityId] ON [dbo].[Patients]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_ClinicId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_ClinicId] ON [dbo].[Patients]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_DoctorId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_DoctorId] ON [dbo].[Patients]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_GovernorateId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_GovernorateId] ON [dbo].[Patients]
(
	[GovernorateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_SocialStatusId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_SocialStatusId] ON [dbo].[Patients]
(
	[SocialStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Plans_RenewalTypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Plans_RenewalTypeId] ON [dbo].[Plans]
(
	[RenewalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriptionPayments_SubscriptionId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_SubscriptionPayments_SubscriptionId] ON [dbo].[SubscriptionPayments]
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_PlanId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_PlanId] ON [dbo].[Subscriptions]
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_SubscriberTypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_SubscriberTypeId] ON [dbo].[Subscriptions]
(
	[SubscriberTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_SubscriptionTypeId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_SubscriptionTypeId] ON [dbo].[Subscriptions]
(
	[SubscriptionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SysCitiesValues_GovId]    Script Date: 28/04/2020 01:16:38 م ******/
CREATE NONCLUSTERED INDEX [IX_SysCitiesValues_GovId] ON [dbo].[SysCitiesValues]
(
	[GovId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BookingPayments]  WITH CHECK ADD  CONSTRAINT [FK_BookingPayments_Bookings] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([Id])
GO
ALTER TABLE [dbo].[BookingPayments] CHECK CONSTRAINT [FK_BookingPayments_Bookings]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_ClinicBookingTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ClinicBookingTypes] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_ClinicBookingTypes]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_ClinicDiscounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[ClinicDiscounts] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_ClinicDiscounts]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Patients]
GO
ALTER TABLE [dbo].[BookingServices]  WITH CHECK ADD  CONSTRAINT [FK_BookingServices_Bookings] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([Id])
GO
ALTER TABLE [dbo].[BookingServices] CHECK CONSTRAINT [FK_BookingServices_Bookings]
GO
ALTER TABLE [dbo].[BookingServices]  WITH CHECK ADD  CONSTRAINT [FK_BookingServices_ClinicServices] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[ClinicServices] ([Id])
GO
ALTER TABLE [dbo].[BookingServices] CHECK CONSTRAINT [FK_BookingServices_ClinicServices]
GO
ALTER TABLE [dbo].[ClinicBookingTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClinicBookingTypes_Clinics] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[ClinicBookingTypes] CHECK CONSTRAINT [FK_ClinicBookingTypes_Clinics]
GO
ALTER TABLE [dbo].[ClinicDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_ClinicDiscounts_Clinics] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[ClinicDiscounts] CHECK CONSTRAINT [FK_ClinicDiscounts_Clinics]
GO
ALTER TABLE [dbo].[Clinics]  WITH CHECK ADD  CONSTRAINT [FK_Clinics_SysEntryOrderValues] FOREIGN KEY([EntryOrderId])
REFERENCES [dbo].[SysEntryOrderValues] ([Id])
GO
ALTER TABLE [dbo].[Clinics] CHECK CONSTRAINT [FK_Clinics_SysEntryOrderValues]
GO
ALTER TABLE [dbo].[ClinicServices]  WITH CHECK ADD  CONSTRAINT [FK_ClinicServices_Clinics] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[ClinicServices] CHECK CONSTRAINT [FK_ClinicServices_Clinics]
GO
ALTER TABLE [dbo].[ClinicUsers]  WITH CHECK ADD  CONSTRAINT [FK_ClinicUsers_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClinicUsers] CHECK CONSTRAINT [FK_ClinicUsers_AspNetUsers]
GO
ALTER TABLE [dbo].[ClinicUsers]  WITH CHECK ADD  CONSTRAINT [FK_ClinicUsers_Clinics] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[ClinicUsers] CHECK CONSTRAINT [FK_ClinicUsers_Clinics]
GO
ALTER TABLE [dbo].[DoctorAnalysisValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorAnalysisValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorAnalysisValues] CHECK CONSTRAINT [FK_DoctorAnalysisValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorClinics]  WITH CHECK ADD  CONSTRAINT [FK_DoctorClinics_Clinics] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[DoctorClinics] CHECK CONSTRAINT [FK_DoctorClinics_Clinics]
GO
ALTER TABLE [dbo].[DoctorClinics]  WITH CHECK ADD  CONSTRAINT [FK_DoctorClinics_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorClinics] CHECK CONSTRAINT [FK_DoctorClinics_Doctors]
GO
ALTER TABLE [dbo].[DoctorComplaintChoicesValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorComplaintChoicesValues_DoctorDetailedComplaintsValues] FOREIGN KEY([DetailedComplaintId])
REFERENCES [dbo].[DoctorDetailedComplaintsValues] ([Id])
GO
ALTER TABLE [dbo].[DoctorComplaintChoicesValues] CHECK CONSTRAINT [FK_DoctorComplaintChoicesValues_DoctorDetailedComplaintsValues]
GO
ALTER TABLE [dbo].[DoctorDetailedComplaintsValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDetailedComplaintsValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorDetailedComplaintsValues] CHECK CONSTRAINT [FK_DoctorDetailedComplaintsValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorDiagnosisValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDiagnosisValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorDiagnosisValues] CHECK CONSTRAINT [FK_DoctorDiagnosisValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorExaminationAreasValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorExaminationAreasValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorExaminationAreasValues] CHECK CONSTRAINT [FK_DoctorExaminationAreasValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorExaminationsValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorExaminationsValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorExaminationsValues] CHECK CONSTRAINT [FK_DoctorExaminationsValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorGeneralComplaintsValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorGeneralComplaintsValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorGeneralComplaintsValues] CHECK CONSTRAINT [FK_DoctorGeneralComplaintsValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorMedicinesValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorMedicinesValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorMedicinesValues] CHECK CONSTRAINT [FK_DoctorMedicinesValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorMedicinesValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorMedicinesValues_SysMedicinesValues] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[SysMedicinesValues] ([Id])
GO
ALTER TABLE [dbo].[DoctorMedicinesValues] CHECK CONSTRAINT [FK_DoctorMedicinesValues_SysMedicinesValues]
GO
ALTER TABLE [dbo].[DoctorOperationTypesValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorOperationTypesValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorOperationTypesValues] CHECK CONSTRAINT [FK_DoctorOperationTypesValues_Doctors]
GO
ALTER TABLE [dbo].[DoctorRayAreasValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorRayAreas_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorRayAreasValues] CHECK CONSTRAINT [FK_DoctorRayAreas_Doctors]
GO
ALTER TABLE [dbo].[DoctorRaysValues]  WITH CHECK ADD  CONSTRAINT [FK_DoctorRaysValues_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[DoctorRaysValues] CHECK CONSTRAINT [FK_DoctorRaysValues_Doctors]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_SysDoctorsSpecialties] FOREIGN KEY([SpecialtyId])
REFERENCES [dbo].[SysDoctorsSpecialties] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_SysDoctorsSpecialties]
GO
ALTER TABLE [dbo].[PatientAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_PatientAnalysis_DoctorAnalysisValues] FOREIGN KEY([AnalysisId])
REFERENCES [dbo].[DoctorAnalysisValues] ([Id])
GO
ALTER TABLE [dbo].[PatientAnalysis] CHECK CONSTRAINT [FK_PatientAnalysis_DoctorAnalysisValues]
GO
ALTER TABLE [dbo].[PatientAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_PatientAnalysis_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientAnalysis] CHECK CONSTRAINT [FK_PatientAnalysis_Patients]
GO
ALTER TABLE [dbo].[PatientAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_PatientAnalysis_SysDiseaseGradesValues] FOREIGN KEY([ResultGradeId])
REFERENCES [dbo].[SysDiseaseGradesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientAnalysis] CHECK CONSTRAINT [FK_PatientAnalysis_SysDiseaseGradesValues]
GO
ALTER TABLE [dbo].[PatientAnalysisFiles]  WITH CHECK ADD  CONSTRAINT [FK_PatientAnalysisFiles_PatientAnalysis] FOREIGN KEY([PatientAnalysisId])
REFERENCES [dbo].[PatientAnalysis] ([Id])
GO
ALTER TABLE [dbo].[PatientAnalysisFiles] CHECK CONSTRAINT [FK_PatientAnalysisFiles_PatientAnalysis]
GO
ALTER TABLE [dbo].[PatientAnalysisFiles]  WITH CHECK ADD  CONSTRAINT [FK_PatientAnalysisFiles_SysAnalysisFileTypesValues] FOREIGN KEY([FileTypeId])
REFERENCES [dbo].[SysAnalysisFileTypesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientAnalysisFiles] CHECK CONSTRAINT [FK_PatientAnalysisFiles_SysAnalysisFileTypesValues]
GO
ALTER TABLE [dbo].[PatientDetailedComplaints]  WITH CHECK ADD  CONSTRAINT [FK_PatientDetailedComplaints_DoctorComplaintChoicesValues] FOREIGN KEY([ComplaintChoiceId])
REFERENCES [dbo].[DoctorComplaintChoicesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientDetailedComplaints] CHECK CONSTRAINT [FK_PatientDetailedComplaints_DoctorComplaintChoicesValues]
GO
ALTER TABLE [dbo].[PatientDetailedComplaints]  WITH CHECK ADD  CONSTRAINT [FK_PatientDetailedComplaints_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientDetailedComplaints] CHECK CONSTRAINT [FK_PatientDetailedComplaints_Patients]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_DoctorDiagnosisValues] FOREIGN KEY([DiagnosisId])
REFERENCES [dbo].[DoctorDiagnosisValues] ([Id])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_DoctorDiagnosisValues]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Patients]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_SysDiseaseGradesValues] FOREIGN KEY([GradeId])
REFERENCES [dbo].[SysDiseaseGradesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_SysDiseaseGradesValues]
GO
ALTER TABLE [dbo].[PatientDiseases]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiseases_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientDiseases] CHECK CONSTRAINT [FK_PatientDiseases_Patients]
GO
ALTER TABLE [dbo].[PatientDiseases]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiseases_SysDiseasesQuestionsValues] FOREIGN KEY([DiseaseId])
REFERENCES [dbo].[SysDiseasesQuestionsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientDiseases] CHECK CONSTRAINT [FK_PatientDiseases_SysDiseasesQuestionsValues]
GO
ALTER TABLE [dbo].[PatientExaminations]  WITH CHECK ADD  CONSTRAINT [FK_PatientExaminations_DoctorExaminationAreasValues] FOREIGN KEY([ExaminationAreaId])
REFERENCES [dbo].[DoctorExaminationAreasValues] ([Id])
GO
ALTER TABLE [dbo].[PatientExaminations] CHECK CONSTRAINT [FK_PatientExaminations_DoctorExaminationAreasValues]
GO
ALTER TABLE [dbo].[PatientExaminations]  WITH CHECK ADD  CONSTRAINT [FK_PatientExaminations_DoctorExaminationsValues] FOREIGN KEY([ExaminationId])
REFERENCES [dbo].[DoctorExaminationsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientExaminations] CHECK CONSTRAINT [FK_PatientExaminations_DoctorExaminationsValues]
GO
ALTER TABLE [dbo].[PatientExaminations]  WITH CHECK ADD  CONSTRAINT [FK_PatientExaminations_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientExaminations] CHECK CONSTRAINT [FK_PatientExaminations_Patients]
GO
ALTER TABLE [dbo].[PatientGeneralComplaints]  WITH CHECK ADD  CONSTRAINT [FK_PatientGeneralComplaints_DoctorGeneralComplaintsValues] FOREIGN KEY([GeneralComplaintId])
REFERENCES [dbo].[DoctorGeneralComplaintsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientGeneralComplaints] CHECK CONSTRAINT [FK_PatientGeneralComplaints_DoctorGeneralComplaintsValues]
GO
ALTER TABLE [dbo].[PatientGeneralComplaints]  WITH CHECK ADD  CONSTRAINT [FK_PatientGeneralComplaints_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientGeneralComplaints] CHECK CONSTRAINT [FK_PatientGeneralComplaints_Patients]
GO
ALTER TABLE [dbo].[PatientOperations]  WITH CHECK ADD  CONSTRAINT [FK_PatientOperations_DoctorOperationTypesValues] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[DoctorOperationTypesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientOperations] CHECK CONSTRAINT [FK_PatientOperations_DoctorOperationTypesValues]
GO
ALTER TABLE [dbo].[PatientOperations]  WITH CHECK ADD  CONSTRAINT [FK_PatientOperations_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientOperations] CHECK CONSTRAINT [FK_PatientOperations_Patients]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_DoctorMedicinesValues] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[DoctorMedicinesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_DoctorMedicinesValues]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_Patients]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_SysMedicineConcentrationsValues] FOREIGN KEY([ConcentrationId])
REFERENCES [dbo].[SysMedicineConcentrationsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_SysMedicineConcentrationsValues]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_SysMedicineDosesValues] FOREIGN KEY([DoseId])
REFERENCES [dbo].[SysMedicineDosesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_SysMedicineDosesValues]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_SysMedicineFormsValues] FOREIGN KEY([FormId])
REFERENCES [dbo].[SysMedicineFormsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_SysMedicineFormsValues]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_SysMedicinePeriodsValues] FOREIGN KEY([PeriodId])
REFERENCES [dbo].[SysMedicinePeriodsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_SysMedicinePeriodsValues]
GO
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_SysMedicineTimingsValues] FOREIGN KEY([TimingId])
REFERENCES [dbo].[SysMedicineTimingsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_SysMedicineTimingsValues]
GO
ALTER TABLE [dbo].[PatientRayFiles]  WITH CHECK ADD  CONSTRAINT [FK_PatientRayFiles_PatientRays] FOREIGN KEY([PatientRayId])
REFERENCES [dbo].[PatientRays] ([Id])
GO
ALTER TABLE [dbo].[PatientRayFiles] CHECK CONSTRAINT [FK_PatientRayFiles_PatientRays]
GO
ALTER TABLE [dbo].[PatientRayFiles]  WITH CHECK ADD  CONSTRAINT [FK_PatientRayFiles_SysRayFileTypesValues] FOREIGN KEY([FileTypeId])
REFERENCES [dbo].[SysRayFileTypesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientRayFiles] CHECK CONSTRAINT [FK_PatientRayFiles_SysRayFileTypesValues]
GO
ALTER TABLE [dbo].[PatientRays]  WITH CHECK ADD  CONSTRAINT [FK_PatientRays_DoctorRayAreas] FOREIGN KEY([RayAreaId])
REFERENCES [dbo].[DoctorRayAreasValues] ([Id])
GO
ALTER TABLE [dbo].[PatientRays] CHECK CONSTRAINT [FK_PatientRays_DoctorRayAreas]
GO
ALTER TABLE [dbo].[PatientRays]  WITH CHECK ADD  CONSTRAINT [FK_PatientRays_DoctorRaysValues] FOREIGN KEY([RayId])
REFERENCES [dbo].[DoctorRaysValues] ([Id])
GO
ALTER TABLE [dbo].[PatientRays] CHECK CONSTRAINT [FK_PatientRays_DoctorRaysValues]
GO
ALTER TABLE [dbo].[PatientRays]  WITH CHECK ADD  CONSTRAINT [FK_PatientRays_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientRays] CHECK CONSTRAINT [FK_PatientRays_Patients]
GO
ALTER TABLE [dbo].[PatientRays]  WITH CHECK ADD  CONSTRAINT [FK_PatientRays_SysDiseaseGradesValues] FOREIGN KEY([ResultGradeId])
REFERENCES [dbo].[SysDiseaseGradesValues] ([Id])
GO
ALTER TABLE [dbo].[PatientRays] CHECK CONSTRAINT [FK_PatientRays_SysDiseaseGradesValues]
GO
ALTER TABLE [dbo].[PatientReferrals]  WITH CHECK ADD  CONSTRAINT [FK_PatientReferrals_Doctors] FOREIGN KEY([ReferralToDoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[PatientReferrals] CHECK CONSTRAINT [FK_PatientReferrals_Doctors]
GO
ALTER TABLE [dbo].[PatientReferrals]  WITH CHECK ADD  CONSTRAINT [FK_PatientReferrals_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientReferrals] CHECK CONSTRAINT [FK_PatientReferrals_Patients]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Clinics] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinics] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Clinics]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Doctors]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_SysBloodPressureValues] FOREIGN KEY([BloodPressureId])
REFERENCES [dbo].[SysBloodPressureValues] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_SysBloodPressureValues]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_SysCitiesValues] FOREIGN KEY([CityId])
REFERENCES [dbo].[SysCitiesValues] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_SysCitiesValues]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_SysGovernoratesValues] FOREIGN KEY([GovernorateId])
REFERENCES [dbo].[SysGovernoratesValues] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_SysGovernoratesValues]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_SysSocialStatusValues] FOREIGN KEY([SocialStatusId])
REFERENCES [dbo].[SysSocialStatusValues] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_SysSocialStatusValues]
GO
ALTER TABLE [dbo].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_SysRenewalTypeValues] FOREIGN KEY([RenewalTypeId])
REFERENCES [dbo].[SysRenewalTypeValues] ([Id])
GO
ALTER TABLE [dbo].[Plans] CHECK CONSTRAINT [FK_Plans_SysRenewalTypeValues]
GO
ALTER TABLE [dbo].[SubscriptionPayments]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionPayments_Subscriptions] FOREIGN KEY([SubscriptionId])
REFERENCES [dbo].[Subscriptions] ([Id])
GO
ALTER TABLE [dbo].[SubscriptionPayments] CHECK CONSTRAINT [FK_SubscriptionPayments_Subscriptions]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Plans] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plans] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Plans]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_SysSubscriberTypeValues] FOREIGN KEY([SubscriberTypeId])
REFERENCES [dbo].[SysSubscriberTypeValues] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_SysSubscriberTypeValues]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_SysSubscriptionTypeValues] FOREIGN KEY([SubscriptionTypeId])
REFERENCES [dbo].[SysSubscriptionTypeValues] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_SysSubscriptionTypeValues]
GO
ALTER TABLE [dbo].[SysCitiesValues]  WITH CHECK ADD  CONSTRAINT [FK_SysCitiesValues_SysGovernoratesValues] FOREIGN KEY([GovId])
REFERENCES [dbo].[SysGovernoratesValues] ([Id])
GO
ALTER TABLE [dbo].[SysCitiesValues] CHECK CONSTRAINT [FK_SysCitiesValues_SysGovernoratesValues]
GO
USE [master]
GO
ALTER DATABASE [smart_clinic] SET  READ_WRITE 
GO
