USE [master]
GO
/****** Object:  Database [DB_A61DAE_smartclinic]    Script Date: 05/06/2020 03:49:51 م ******/
CREATE DATABASE [DB_A61DAE_smartclinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A61DAE_smartclinic_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DB_A61DAE_smartclinic_DATA.mdf' , SIZE = 13248KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A61DAE_smartclinic_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DB_A61DAE_smartclinic_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A61DAE_smartclinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_A61DAE_smartclinic] SET QUERY_STORE = OFF
GO
USE [DB_A61DAE_smartclinic]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DB_A61DAE_smartclinic]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Title] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[FullName] [nvarchar](256) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[EditedOn] [datetime2](7) NOT NULL,
	[EditedBy] [uniqueidentifier] NOT NULL,
	[LastActive] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[BookingPayments]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
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
/****** Object:  Table [dbo].[BookingServices]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [uniqueidentifier] NOT NULL,
	[ReceiverId] [uniqueidentifier] NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[SentOn] [datetime] NOT NULL,
	[IsRead] [bit] NULL,
	[ReadOn] [datetime2](7) NULL,
 CONSTRAINT [PK_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicBookingTypes]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicBookingTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClinicBookingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicDiscounts]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicDiscounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[Discount] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clinics]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[PrintLogoPublicId] [nvarchar](max) NULL,
	[PrintAddress1] [nvarchar](max) NULL,
	[PrintAddress2] [nvarchar](max) NULL,
	[PrintAddress3] [nvarchar](max) NULL,
	[PrintPhone1] [nvarchar](256) NULL,
	[PrintPhone2] [nvarchar](256) NULL,
	[PrintPhone3] [nvarchar](256) NULL,
	[IsAllDaysOn] [bit] NULL,
	[WorkDays] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[ClinicServices]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [uniqueidentifier] NOT NULL,
	[Service] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicUsers]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[DoctorAnalysisValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorAnalysisValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[AnalysisName] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorClinics]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[DoctorComplaintChoicesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorComplaintChoicesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DetailedComplaintId] [int] NOT NULL,
	[Choice] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorDetailedComplaintsValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDetailedComplaintsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Complaint] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorDiagnosisValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorDiagnosisValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Diagnosis] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorExaminationAreasValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorExaminationAreasValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[ExaminationArea] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorExaminationsValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorExaminationsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Examination] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorGeneralComplaintsValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorGeneralComplaintsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[Complaint] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorMedicinesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorMedicinesValues](
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
	[DoctorId] ASC,
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorOperationTypesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorOperationTypesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[OperationType] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorRayAreasValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorRayAreasValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[RayArea] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorRaysValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorRaysValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[RayName] [nvarchar](256) NOT NULL,
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
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[PatientRecordSections] [nvarchar](50) NULL,
	[DiseasesQuestions] [nvarchar](50) NULL,
	[Phone1] [nvarchar](256) NULL,
	[Phone2] [nvarchar](256) NULL,
	[Phone3] [nvarchar](256) NULL,
	[WhatsApp] [nvarchar](256) NULL,
	[Email1] [nvarchar](256) NULL,
	[Email2] [nvarchar](256) NULL,
	[Facebook] [nvarchar](256) NULL,
	[Twitter] [nvarchar](256) NULL,
	[LinkedIn] [nvarchar](256) NULL,
	[Instagram] [nvarchar](256) NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeId] [int] NOT NULL,
	[ExpenseCost] [decimal](18, 2) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientAnalysis]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[IsDeleted] [bit] NULL,
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
/****** Object:  Table [dbo].[PatientAnalysisFiles]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[UrlPublicId] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[PatientDetailedComplaints]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDetailedComplaints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[DetailedComplaintId] [int] NOT NULL,
	[ComplaintChoiceId] [int] NULL,
	[Period] [nvarchar](256) NULL,
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
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[PatientDiseases]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[PatientExaminations]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[PatientGeneralComplaints]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[PatientOperations]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[PatientPrescriptions]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientPrescriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
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
/****** Object:  Table [dbo].[PatientRayFiles]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[UrlPublicId] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[PatientRays]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[IsDeleted] [bit] NULL,
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
/****** Object:  Table [dbo].[PatientReferrals]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[Patients]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[Phone] [nvarchar](256) NULL,
	[Phone2] [nvarchar](256) NULL,
	[Age] [int] NULL,
	[Gender] [bit] NULL,
	[SocialStatusId] [int] NULL,
	[Career] [nvarchar](max) NULL,
	[GovernorateId] [int] NULL,
	[CityId] [int] NULL,
	[Note] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[Plans]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
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
/****** Object:  Table [dbo].[PrescriptionMedicines]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionMedicines](
	[PrescriptionId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[DoseId] [int] NULL,
	[TimingId] [int] NULL,
	[PeriodId] [int] NULL,
	[QuantityId] [int] NULL,
 CONSTRAINT [PK_PrescriptionMedicines] PRIMARY KEY CLUSTERED 
(
	[PrescriptionId] ASC,
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubscriptionPayments]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 05/06/2020 03:49:55 م ******/
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
	[Note] [nvarchar](max) NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysAnalysisFileTypesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysAnalysisFileTypesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysAnalysisFileTypesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysBloodPressureValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysBloodPressureValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysBloodPressureValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysCitiesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCitiesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GovId] [int] NOT NULL,
	[TextAR] [nvarchar](256) NOT NULL,
	[TextEN] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysCitiesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysDiseaseGradesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDiseaseGradesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysDiseaseGradesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysDiseasesQuestionsValues]    Script Date: 05/06/2020 03:49:55 م ******/
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
/****** Object:  Table [dbo].[SysDoctorsSpecialties]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDoctorsSpecialties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysDoctorsSpecialties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysEntryOrderValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysEntryOrderValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysEntryOrderValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysExpenseTypes]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysExpenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysExpenseTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysGovernoratesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGovernoratesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TextAR] [nvarchar](256) NOT NULL,
	[TextEN] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysGovernoratesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineDosesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineDosesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysMedicineDosesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicinePeriodsValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicinePeriodsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysMedicinePeriodsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineQuantityValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineQuantityValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysMedicineQuantityValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicinesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicinesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysMedicinesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysMedicineTimingsValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMedicineTimingsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysMedicineTimingsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysPatientRecordSectionsValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysPatientRecordSectionsValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysPatientRecordSectionsValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysRayFileTypesValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRayFileTypesValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysRayFileTypesValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysRenewalTypeValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRenewalTypeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysRenewalTypeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysSocialStatusValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSocialStatusValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysSocialStatusValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysSubscriberTypeValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSubscriberTypeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysSubscriberTypeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SysSubscriptionTypeValues]    Script Date: 05/06/2020 03:49:55 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSubscriptionTypeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[Text] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_SysSubscriptionTypeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200524131943_CreateDB', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200603035422_RequestDelete', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200605080750_UpdatePatients', N'3.1.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200605124709_MedicineQuantity', N'3.1.3')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Title], [Description]) VALUES (N'18c8a251-e1e0-4415-b78f-481c40caa960', N'doctor', N'DOCTOR', NULL, N'طبيب', N'الأدمن على حساب العيادة وله صلاحيات كاملة على حساب العيادة الخاصة به')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Title], [Description]) VALUES (N'1468e926-f79b-4782-870b-8a47d2441f6e', N'owner', N'OWNER', NULL, N'إدارة', N'ملاك البرنامج صلاحية كاملة على كل العيادات وعلى لوحة التحكم الخاصة بالبرنامج')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Title], [Description]) VALUES (N'1bf305ef-900a-4b8d-8c16-d081650c0606', N'employee', N'EMPLOYEE', NULL, N'موظف', N'صلاحيات محدودة على حساب العيادة التابع لها ولا يرى بيانات السجل المرضي للمريض ولا الإعدادات')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'18c8a251-e1e0-4415-b78f-481c40caa960')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'66e2743a-7556-4369-1878-08d803d86466', N'18c8a251-e1e0-4415-b78f-481c40caa960')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'1468e926-f79b-4782-870b-8a47d2441f6e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e47d02aa-7271-4dc2-97b2-686dde3286a0', N'1468e926-f79b-4782-870b-8a47d2441f6e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'1bf305ef-900a-4b8d-8c16-d081650c0606')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ffa7c677-0635-4fd4-af93-08d803de1e84', N'1bf305ef-900a-4b8d-8c16-d081650c0606')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'04209851-d21a-4a80-af94-08d803de1e84', N'1bf305ef-900a-4b8d-8c16-d081650c0606')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'doctor', N'DOCTOR', N'doctor', N'DOCTOR', 0, N'AQAAAAEAACcQAAAAEIGzsSvmQN+ZZTWrtnkWbdcFnHbDJEk/tlIVf5r6iO5fhlezl+80itoxit9IeayeLw==', N'LUVNSDU22HSLJAGZ7I6ZPGC3HXE2MDEZ', N'a2609b96-5c7f-4b88-83bd-c678ce0aaba4', NULL, 0, 0, NULL, 1, 0, N'test doctor', 1, 0, CAST(N'2020-05-29T14:39:19.6596025' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T14:39:19.6600056' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-05T15:42:59.2248843' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'assistant', N'ASSISTANT', N'assistant', N'ASSISTANT', 0, N'AQAAAAEAACcQAAAAEAfapSBaDnHPIj8gBnMdmGhrTF9EhkDle/q4duytjjwIJypZPlBEberQL3c/lQ6kiA==', N'HFCRG5VWCSUKP5NFFMZ62AGWBQ76UHB6', N'f7dc5306-5c35-4bf6-aebc-a310870d967f', NULL, 0, 0, NULL, 1, 0, N'Assistant', 1, 0, CAST(N'2020-05-29T14:43:43.3825946' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T14:43:43.3826266' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-05T12:18:07.4370809' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'66e2743a-7556-4369-1878-08d803d86466', N'hesham.hamoud@gmail.com', N'HESHAM.HAMOUD@GMAIL.COM', N'hesham.hamoud@gmail.com', N'HESHAM.HAMOUD@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOO68tNJ6WLYeDpTVd/nmJOMJQUFvQXAn7gwT2KVMI8vJqfQqZ7Pldhh0LHQhpEZ6A==', N'24F7GMWH2IPJ6K2KMVA6LTYG4ZZ5BTJH', N'5924511d-fabf-4161-be2d-f8c2774e565e', NULL, 0, 0, NULL, 1, 0, N'هشام صلاح السيد حمود', 1, 0, CAST(N'2020-05-29T15:58:40.2628220' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T15:58:40.2634820' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-04T11:00:39.9072147' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'ffa7c677-0635-4fd4-af93-08d803de1e84', N'abeero', N'ABEERO', N'abeero', N'ABEERO', 0, N'AQAAAAEAACcQAAAAEEFeSKHJnlshE7c/ZOaJ7hzvK+vq+VE7FoOTZOWjZKzFQrsQ3u2JsOPfM27kRsaj3Q==', N'TGHN7AGZQICSEZYXBP67WUS7EKAR6EAL', N'0c7e228d-7294-4e4a-92bd-9822ca9de2b7', NULL, 0, 0, NULL, 1, 0, N'عبير عثمان', 1, 0, CAST(N'2020-05-29T16:39:39.9220494' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T16:39:39.9224394' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-03T13:31:26.7568604' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'04209851-d21a-4a80-af94-08d803de1e84', N'ahmedr', N'AHMEDR', N'ahmedr', N'AHMEDR', 0, N'AQAAAAEAACcQAAAAEJJSIM0moeIxw2r4M0CBNXfLGiqliAqgm0PQcTkWcNT1bzBWvcZ1Ybj2Y/3REZk2aw==', N'CL47ESH7YJJMEQUUSNRXP3HR52KSZKMV', N'36a9f82b-c7ca-43b3-8627-ef0a3005e2a0', NULL, 0, 0, NULL, 1, 0, N'احمد رمزى', 1, 0, CAST(N'2020-05-29T16:40:15.2679618' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T16:40:15.2680446' AS DateTime2), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', N'zizooo.elhor@gmail.com', N'ZIZOOO.ELHOR@GMAIL.COM', N'zizooo.elhor@gmail.com', N'ZIZOOO.ELHOR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM73Cp5SCAIQh4v9grhOFsPtfq9Gq9aQZ5RYR7dHtbD0U894ZWb/75ZR/g9xFuwqiw==', N'CESDIQJMCZVCWJ4F4PHNCWMNJ5O2MYKM', N'31a538e3-4f8e-4ec1-9535-a76c0eaf1cc5', NULL, 0, 0, NULL, 1, 0, N'الحُر', 1, 0, CAST(N'2020-04-14T17:11:45.1174899' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-14T17:11:45.1175009' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-05-25T06:47:04.4367431' AS DateTime2))
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [EditedOn], [EditedBy], [LastActive]) VALUES (N'e47d02aa-7271-4dc2-97b2-686dde3286a0', N'hatems325@gmail.com', N'HATEMS325@GMAIL.COM', N'hatems325@gmail.com', N'HATEMS325@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGHdAk8qAuUzCk/Xf+FrIKEMA7RNeSoG+ML4fwWE0f/zX7/s3YfKdPmGpsGVAHfAlw==', N'4BY4JSB5WWAWQ6RI6MBQAD6HHLBOZMJQ', N'e8cb3520-d1dd-4e70-bf48-734fa009509f', NULL, 0, 0, NULL, 1, 0, N'حاتم', 1, 0, CAST(N'2020-04-18T14:06:23.8154534' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.8427200' AS DateTime2), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-05-29T16:40:15.3606339' AS DateTime2))
SET IDENTITY_INSERT [dbo].[BookingPayments] ON 

INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (141, 54, CAST(2300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T17:25:22.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T17:25:22.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (145, 55, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T21:29:41.643' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-05-29T21:29:41.643' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (146, 56, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T21:30:00.543' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-05-29T21:30:00.543' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (148, 57, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T22:05:10.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:05:10.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (149, 58, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T22:05:25.507' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:05:25.507' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (150, 60, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T22:05:38.137' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:05:38.137' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (155, 63, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:07:14.930' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:07:14.930' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (156, 64, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:07:30.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:07:30.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (158, 66, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:08:01.317' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:08:01.317' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (159, 67, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:08:23.487' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:08:23.487' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (160, 65, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:08:42.417' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:08:42.417' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (161, 68, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:09:10.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:09:10.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (162, 69, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:09:30.990' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:09:30.990' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (163, 70, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T00:09:54.017' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:09:54.017' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (172, 78, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:10:14.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:10:14.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (174, 80, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:11:11.070' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:11:11.070' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (175, 81, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:11:37.447' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:11:37.447' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (176, 82, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:12:23.360' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:12:23.360' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (178, 84, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:13:17.523' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:13:17.523' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (180, 86, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:14:07.223' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:14:07.223' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (181, 87, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:15:01.843' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:15:01.843' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (183, 89, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:16:40.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:16:40.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (189, 95, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:30:04.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:30:04.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (192, 96, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:38:17.563' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:38:17.563' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (193, 97, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T02:41:31.750' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:41:31.750' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (200, 104, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T05:57:42.527' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:57:42.527' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (203, 106, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T05:59:44.820' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:59:44.820' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (204, 107, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T06:00:26.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:00:26.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (205, 108, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T06:03:07.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:03:07.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (206, 109, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T06:03:44.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:03:44.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (207, 110, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T06:04:20.923' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:04:20.923' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (211, 102, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T06:10:26.613' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T06:10:26.613' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (212, 59, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T08:34:48.963' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T08:34:48.963' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (219, 113, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T08:35:35.747' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T08:35:35.747' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (223, 114, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T09:48:48.437' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T09:48:48.437' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (225, 116, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T11:11:07.900' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:11:07.900' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (226, 115, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T11:13:17.617' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:13:17.617' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (227, 74, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T11:14:11.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:14:11.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (231, 120, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T11:48:16.830' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:48:16.830' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (232, 121, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T11:58:58.130' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:58:58.130' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (234, 88, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:06:23.867' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:06:23.867' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (235, 83, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:12:37.310' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:12:37.310' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (237, 124, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:14:54.270' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:14:54.270' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (239, 125, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:17:59.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:17:59.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (241, 77, CAST(3300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:19:58.420' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:19:58.420' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (244, 127, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:31:05.533' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:31:05.533' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (245, 128, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:31:05.480' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:31:05.480' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (249, 132, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T12:55:39.403' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:55:39.403' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (250, 133, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T13:04:00.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:04:00.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (251, 134, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T13:05:51.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:05:51.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (253, 135, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T13:07:48.400' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:07:48.400' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (254, 79, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T13:14:25.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:14:25.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (255, 118, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T13:18:24.473' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:18:24.473' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (256, 62, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T13:21:17.743' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:21:17.743' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (259, 136, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T14:21:38.387' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:21:38.387' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (262, 122, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T14:32:35.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:32:35.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (263, 138, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T14:43:33.853' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:43:33.853' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (268, 143, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T15:09:16.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:09:16.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (270, 144, CAST(800.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:28:51.983' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:28:51.983' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (271, 145, CAST(4000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:32:46.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:32:46.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (272, 93, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:34:31.600' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:34:31.600' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (273, 146, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:37:01.970' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:37:01.970' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (274, 75, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:38:07.870' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:38:07.870' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (276, 117, CAST(4300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:40:00.203' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:40:00.203' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (277, 76, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T18:42:02.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:42:02.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (278, 92, CAST(2000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T21:45:08.513' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:45:08.513' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (279, 119, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T21:45:25.500' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:45:25.500' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (280, 71, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T21:45:40.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:45:40.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (281, 90, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T21:47:38.720' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:47:38.720' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (282, 91, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T21:47:57.297' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:47:57.297' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (283, 85, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-31T21:48:19.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:48:19.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (294, 148, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:23:39.180' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:23:39.180' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (296, 149, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:25:12.913' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:25:12.913' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (297, 150, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:26:00.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:26:00.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (298, 151, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:26:37.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:26:37.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (299, 152, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:27:42.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:27:42.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (300, 153, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:28:14.643' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:28:14.643' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (301, 154, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:28:45.453' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:28:45.453' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (302, 72, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:29:30.313' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:29:30.313' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (304, 155, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:49:39.273' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:49:39.273' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (306, 156, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:50:34.250' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:50:34.250' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (307, 157, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:57:16.567' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:57:16.567' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (308, 158, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:57:48.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:57:48.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (309, 159, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:58:23.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:58:23.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (310, 160, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:59:10.780' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:59:10.780' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (311, 161, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T09:59:58.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:59:58.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (312, 162, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T10:03:03.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:03:03.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (313, 163, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T10:03:54.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:03:54.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (314, 164, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T10:09:14.777' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:09:14.777' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (316, 165, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T10:12:47.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:12:47.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (317, 166, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T10:13:33.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:13:33.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (319, 167, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T12:00:24.167' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T12:00:24.167' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (321, 73, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T12:04:20.150' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T12:04:20.150' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (340, 111, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T14:57:10.220' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T14:57:10.220' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (342, 170, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T14:57:06.273' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T14:57:06.273' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (343, 61, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T15:17:52.567' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T15:17:52.567' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (344, 100, CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T15:17:52.587' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T15:17:52.587' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (345, 171, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-01T15:17:52.393' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T15:17:52.393' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (355, 174, CAST(2500.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-02T00:26:58.037' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T00:26:58.037' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
GO
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (366, 169, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-02T03:56:11.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T03:56:11.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (367, 112, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-02T03:56:24.687' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-06-02T03:56:24.687' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (372, 175, CAST(3800.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-02T04:36:58.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:36:58.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (373, 123, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T09:58:19.053' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T09:58:19.053' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (374, 137, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T10:12:24.937' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-03T10:12:24.937' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (375, 141, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T10:12:43.473' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-03T10:12:43.473' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (377, 131, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T10:14:28.447' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-03T10:14:28.447' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (378, 105, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T11:14:26.550' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-03T11:14:26.550' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (380, 147, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T11:47:38.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:47:38.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (381, 126, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:20:54.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:20:54.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (382, 129, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:23:48.810' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:23:48.810' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (383, 179, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:27:33.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:27:33.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (384, 130, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:28:28.823' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:28:28.823' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (385, 142, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:28:44.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:28:44.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (387, 94, CAST(1500.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:29:55.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:29:55.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (389, 178, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T12:33:37.463' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:33:37.463' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (390, 140, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T13:26:43.153' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-03T13:26:43.153' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (391, 139, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T13:27:07.280' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-03T13:27:07.280' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (392, 168, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T20:48:45.507' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-03T20:48:45.507' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (396, 176, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-03T23:38:58.160' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-03T23:38:58.160' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (397, 99, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T00:33:02.573' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T00:33:02.573' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (399, 182, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T00:33:33.280' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T00:33:33.280' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (400, 184, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T00:33:32.907' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T00:33:32.907' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (407, 103, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T08:46:15.027' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-06-04T08:46:15.060' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (421, 101, CAST(250.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T10:16:17.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T10:16:17.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (423, 173, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T12:09:07.717' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-06-04T12:09:07.717' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (426, 177, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T12:59:46.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T12:59:46.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (428, 181, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T13:08:46.303' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:08:46.303' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (429, 186, CAST(4000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T13:51:18.917' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-06-04T13:51:18.917' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (430, 183, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T13:51:49.147' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-06-04T13:51:49.147' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (431, 98, CAST(500.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T14:22:56.353' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T14:22:56.353' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (432, 185, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-04T17:36:00.017' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T17:36:00.017' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (433, 187, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-05T09:51:45.767' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T09:51:45.767' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (435, 172, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-05T09:52:48.760' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T09:52:48.760' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (439, 189, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-05T11:09:18.873' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:09:18.873' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (440, 188, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-05T11:09:43.223' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:09:43.223' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (441, 180, CAST(300.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-05T11:09:55.797' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:09:55.797' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[BookingPayments] ([Id], [BookingId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (442, 190, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-06-05T12:15:12.123' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T12:15:12.123' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
SET IDENTITY_INSERT [dbo].[BookingPayments] OFF
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (54, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-29T09:00:00.000' AS DateTime), 18, NULL, 1, 1, CAST(N'2020-05-29T17:23:50.290' AS DateTime), 1, CAST(N'2020-05-29T17:23:58.517' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-29T17:19:55.337' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T17:25:22.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (55, N'7b5ae34f-6bef-4b33-943a-1f7fade2ad47', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-29T09:15:00.000' AS DateTime), 18, NULL, 2, 1, CAST(N'2020-05-29T19:35:59.033' AS DateTime), 1, CAST(N'2020-05-29T22:56:48.807' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-29T17:20:30.073' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T21:29:41.637' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (56, N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-29T09:30:00.000' AS DateTime), 18, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-05-29T21:30:13.123' AS DateTime), 1, 0, CAST(N'2020-05-29T17:22:15.707' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T21:30:13.123' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (57, N'ae409276-c2b7-4b6a-89a4-05f0738b37ed', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T11:30:00.000' AS DateTime), 22, NULL, 2, 1, CAST(N'2020-05-31T11:23:50.820' AS DateTime), 1, CAST(N'2020-05-31T11:48:08.390' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-29T17:34:00.557' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:05:10.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (58, N'08e25767-2e48-4205-8a60-88d226c92fb2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T11:40:00.000' AS DateTime), 22, NULL, 26, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-29T17:34:54.450' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:05:25.507' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (59, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-30T09:00:00.000' AS DateTime), 18, NULL, 1, 1, CAST(N'2020-05-30T23:34:50.277' AS DateTime), 1, CAST(N'2020-05-30T23:57:20.707' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-29T19:02:35.287' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-30T23:32:46.730' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (60, N'8d451fb1-5c4c-4b0c-a43d-35e888b46075', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T11:50:00.000' AS DateTime), 22, NULL, 6, 1, CAST(N'2020-05-31T11:12:24.600' AS DateTime), 1, CAST(N'2020-05-31T12:56:18.857' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-29T21:41:26.650' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:05:38.137' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (61, N'92c22426-b67b-45f0-ad03-b1211b9f2299', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-30T09:15:00.000' AS DateTime), 18, NULL, 2, 1, CAST(N'2020-05-30T23:33:49.983' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-30T12:47:08.410' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-05-30T12:47:08.410' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (62, N'd054ffa0-bd0b-4bc5-b511-46ff0a443570', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:00:00.000' AS DateTime), 21, NULL, 8, 1, CAST(N'2020-05-31T11:12:18.037' AS DateTime), 1, CAST(N'2020-05-31T13:21:17.773' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:06:45.137' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:21:17.743' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (63, N'0aec7798-1b5b-49c7-9f21-88f8c71f976b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:10:00.000' AS DateTime), 21, NULL, 3, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:07:14.930' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:07:14.930' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (64, N'3204b985-b1bc-4263-992b-195b2ab926df', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:20:00.000' AS DateTime), 21, NULL, 4, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:07:30.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:07:30.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (65, N'd958878c-a513-4b2e-8bf3-71bf062b61e6', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:30:00.000' AS DateTime), 22, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:07:39.260' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:08:42.417' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (66, N'4716b8bd-94c0-4c4a-ae21-278cecf390bb', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:40:00.000' AS DateTime), 21, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:08:01.313' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:08:01.317' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (67, N'95a1438b-a872-4bea-8b9f-1a39c369dbfa', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:50:00.000' AS DateTime), 22, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:08:23.487' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:08:23.487' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (68, N'2ae800c2-1a6a-4139-b030-08ea5b53165d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T13:00:00.000' AS DateTime), 22, NULL, 20, 1, CAST(N'2020-05-31T18:33:41.657' AS DateTime), 1, CAST(N'2020-05-31T21:46:18.037' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:09:10.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:09:10.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (69, N'2f354613-2a5f-4f0e-a86f-f9597b0f94de', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T13:10:00.000' AS DateTime), 22, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:09:30.990' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:09:30.990' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (70, N'4fcd174d-8463-40bc-ae32-a3ad8c13fbbf', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T13:20:00.000' AS DateTime), 22, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:09:54.017' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:09:54.017' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (71, N'7b25632c-f72a-4033-b3f9-5e1676c9220a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T13:30:00.000' AS DateTime), 21, NULL, 17, 1, CAST(N'2020-05-31T14:38:36.193' AS DateTime), 1, CAST(N'2020-05-31T21:46:03.657' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T00:10:59.363' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:45:40.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (72, N'e592c3ee-633b-4d89-886d-b214ad566319', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T12:40:00.000' AS DateTime), 22, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T01:58:56.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:29:30.313' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (73, N'c4be2a14-e698-4e7b-a9dc-c4cb8f3be003', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T14:40:00.000' AS DateTime), 21, NULL, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T01:59:18.367' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T12:04:20.150' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (74, N'fe7ec34e-9565-49b5-a361-e9cd00bef5fb', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T14:00:00.000' AS DateTime), 22, NULL, 9, 1, CAST(N'2020-05-31T11:12:06.977' AS DateTime), 1, CAST(N'2020-05-31T13:21:24.700' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:01:13.567' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:14:11.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (75, N'2d222397-66f6-4c3d-973c-8b8a493c37b8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T14:10:00.000' AS DateTime), 21, NULL, 24, 1, CAST(N'2020-05-31T18:37:37.907' AS DateTime), 1, CAST(N'2020-05-31T21:46:38.420' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:06:36.230' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:38:07.870' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (76, N'2f163031-9cc8-4e61-b785-66e1c67b7675', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T14:20:00.000' AS DateTime), 22, NULL, 25, 1, CAST(N'2020-05-31T18:44:33.927' AS DateTime), 1, CAST(N'2020-05-31T21:46:42.643' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:08:05.810' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:42:02.750' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (77, N'aeb0b926-2535-40b1-b3c4-9c5b22d1663b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T14:30:00.000' AS DateTime), 21, NULL, 5, 1, CAST(N'2020-05-31T11:09:20.157' AS DateTime), 1, CAST(N'2020-05-31T12:24:16.397' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:08:44.863' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:19:58.420' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (78, N'bbd82fb0-b888-4a1e-a90a-a9822555e3ee', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T14:40:00.000' AS DateTime), 21, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:10:14.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:10:14.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (79, N'4b41c307-66b6-47b0-b772-0247434b7604', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T14:50:00.000' AS DateTime), 21, NULL, 11, 1, CAST(N'2020-05-31T12:21:45.260' AS DateTime), 1, CAST(N'2020-05-31T14:37:30.870' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:10:56.280' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:14:25.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (80, N'd691935b-9697-4a89-8519-a0f04fb4d0f8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T15:00:00.000' AS DateTime), 21, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:11:11.070' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:11:11.070' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (81, N'95072bf5-b98b-4052-9802-3cf04722340d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T15:10:00.000' AS DateTime), 27, NULL, 4, 1, CAST(N'2020-05-31T11:08:20.557' AS DateTime), 1, CAST(N'2020-05-31T12:15:22.187' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:11:37.447' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:11:37.447' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (82, N'132378ec-c259-49a5-997f-225b5398e96d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T15:20:00.000' AS DateTime), 21, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:12:23.360' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:12:23.360' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (83, N'64e55be3-e20e-4370-a716-7b40e38fe4f8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T13:20:00.000' AS DateTime), 22, NULL, 19, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:12:51.423' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:12:37.310' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (84, N'48e1d430-8c2c-47e4-b92d-f655926057b2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T15:40:00.000' AS DateTime), 22, NULL, 13, 1, CAST(N'2020-05-31T12:42:55.820' AS DateTime), 1, CAST(N'2020-05-31T18:40:28.480' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:13:17.523' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:13:17.523' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (85, N'd98f4160-f330-4514-9c79-f16af99683f1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T16:30:00.000' AS DateTime), 22, NULL, 23, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:13:44.327' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:48:19.163' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (86, N'fc91be84-ef25-47cd-aeac-bf8eedc848e8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T16:00:00.000' AS DateTime), 22, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:14:07.223' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:14:07.223' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (87, N'a7a677fa-8697-461d-8280-0ff4df94f301', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T16:10:00.000' AS DateTime), 22, NULL, 1, 1, CAST(N'2020-05-31T11:06:06.013' AS DateTime), 1, CAST(N'2020-05-31T11:36:59.177' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:15:01.843' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:15:01.843' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (88, N'f96c9bda-36ab-4127-baa2-044bd5f07071', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T16:20:00.000' AS DateTime), 21, NULL, 10, 1, CAST(N'2020-05-31T12:04:49.560' AS DateTime), 1, CAST(N'2020-05-31T13:53:48.177' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:15:50.787' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:06:23.867' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (89, N'60682fd3-d98d-4d14-9aae-1e84eee558bd', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T16:30:00.000' AS DateTime), 23, NULL, 27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:16:40.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:16:40.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (90, N'90a1d3d5-dda9-420e-af77-4612dfec043a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T16:10:00.000' AS DateTime), 21, NULL, 21, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:17:22.400' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:47:38.720' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (91, N'60f2eb17-d2d6-4018-9999-11594ca4214d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T16:20:00.000' AS DateTime), 21, NULL, 22, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:17:30.647' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:47:57.297' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (92, N'd0e0664a-e25e-43ae-a4af-2e82ade25fe4', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T17:00:00.000' AS DateTime), 23, NULL, 18, 1, CAST(N'2020-05-31T18:26:34.617' AS DateTime), 1, CAST(N'2020-05-31T21:46:08.153' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:17:57.993' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:45:08.500' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (93, N'9f028027-15d7-44b3-b5fd-184e6cd817af', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T17:10:00.000' AS DateTime), 22, NULL, 21, 1, CAST(N'2020-05-31T18:34:06.783' AS DateTime), 1, CAST(N'2020-05-31T21:46:22.367' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:18:14.727' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:34:31.600' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (94, N'686d1195-1278-4d04-bf38-f299d428c1a2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T11:30:00.000' AS DateTime), 27, NULL, 6, 1, CAST(N'2020-06-03T11:46:35.417' AS DateTime), 1, CAST(N'2020-06-03T13:21:08.297' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:21:59.700' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:29:55.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (95, N'220ebac9-090e-4424-9145-7b746a245581', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T11:40:00.000' AS DateTime), 22, NULL, 2, 1, CAST(N'2020-06-03T10:02:12.063' AS DateTime), 1, CAST(N'2020-06-03T11:35:27.160' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:30:04.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:30:04.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (96, N'da16de28-f774-4020-bc4a-5dc689554048', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T11:50:00.000' AS DateTime), 27, NULL, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:37:58.007' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:38:17.563' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (97, N'f7660dc8-0f92-4ff9-9e37-42e2fc1d3460', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T12:00:00.000' AS DateTime), 22, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T02:41:31.750' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:41:31.750' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (98, N'3293506d-2695-4381-a702-d5848d113dfd', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-02T10:00:00.000' AS DateTime), 18, NULL, 4, 1, CAST(N'2020-06-02T03:10:59.650' AS DateTime), 1, CAST(N'2020-06-02T03:10:59.650' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T04:51:57.417' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T14:22:56.353' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (99, N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-31T09:15:00.000' AS DateTime), 18, NULL, 1, 1, CAST(N'2020-05-31T06:13:02.147' AS DateTime), 1, CAST(N'2020-05-31T09:41:53.447' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T04:52:17.177' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T09:41:43.587' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (100, N'92c22426-b67b-45f0-ad03-b1211b9f2299', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-01T09:45:00.000' AS DateTime), 26, 17, 2, 1, CAST(N'2020-05-31T06:12:53.643' AS DateTime), 1, CAST(N'2020-06-01T13:07:31.737' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T04:53:29.093' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:07:03.573' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (101, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-01T11:00:00.000' AS DateTime), 18, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T04:54:55.287' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T10:16:17.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (102, N'08a703db-c53f-4ec7-b2d6-84b1f941d2f7', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-31T10:15:00.000' AS DateTime), 18, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T04:55:40.790' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T06:10:26.610' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (103, N'9c295b45-5a38-4834-8ade-0ec739707965', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-01T09:30:00.000' AS DateTime), 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T05:54:19.970' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T08:46:10.410' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (104, N'6d1600b5-96e9-451b-8d6a-2a5fd1cbbbb0', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T12:10:00.000' AS DateTime), 21, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T05:57:42.527' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:57:42.527' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (105, N'84ff888b-d2cf-4245-bba0-34754cc3413f', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T12:20:00.000' AS DateTime), 22, NULL, 4, 1, CAST(N'2020-06-03T10:01:54.907' AS DateTime), 1, CAST(N'2020-06-03T11:39:24.853' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T05:58:29.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:14:26.543' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (106, N'b1a262dc-9d35-4ed3-b293-1b515a10a197', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T12:30:00.000' AS DateTime), 23, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T05:59:11.037' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:59:44.813' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (107, N'32e943da-c942-4f1d-b4f6-ebc79ec2eab1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T12:40:00.000' AS DateTime), 22, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T06:00:26.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:00:26.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (108, N'77b18b83-cf9f-4c6d-aa3a-a73785dc5954', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T12:50:00.000' AS DateTime), 22, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T06:03:07.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:03:07.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (109, N'7516b7f5-28e3-45cc-aac4-75a277b26a41', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T13:00:00.000' AS DateTime), 22, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T06:03:44.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:03:44.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (110, N'8fd06061-da6f-4e85-a634-37c0db0ebf67', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T13:10:00.000' AS DateTime), 22, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T06:04:20.923' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:04:20.923' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (111, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-05-31T09:30:00.000' AS DateTime), 18, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T06:07:10.407' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T06:07:10.407' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (112, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-02T09:00:00.000' AS DateTime), 18, NULL, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T08:34:48.607' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T03:56:24.687' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (113, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-03T09:00:00.000' AS DateTime), 18, NULL, 1, 1, CAST(N'2020-06-03T05:14:15.023' AS DateTime), 1, CAST(N'2020-06-03T22:56:08.597' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T08:35:35.747' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T08:35:35.747' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (114, N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-03T09:15:00.000' AS DateTime), 19, NULL, 3, 1, CAST(N'2020-06-03T05:31:42.193' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T09:47:58.840' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T09:48:48.437' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (115, N'4bad0e75-1bd5-43f5-8d48-a4fc7956c7f1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T17:20:00.000' AS DateTime), 22, NULL, 3, 1, CAST(N'2020-05-31T11:08:09.917' AS DateTime), 1, CAST(N'2020-05-31T12:08:02.353' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:08:04.420' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:13:17.607' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (116, N'81e87c34-8d13-4456-8d97-6871dbccfe89', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T17:30:00.000' AS DateTime), 22, NULL, 7, 1, CAST(N'2020-05-31T11:11:41.423' AS DateTime), 1, CAST(N'2020-05-31T13:14:23.827' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:11:07.900' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:11:07.900' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (117, N'894403a6-3062-4e48-ba40-50c051fb1e5e', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T13:50:00.000' AS DateTime), 21, NULL, 12, 1, CAST(N'2020-05-31T13:55:21.127' AS DateTime), 1, CAST(N'2020-05-31T18:40:13.407' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:42:40.437' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:40:00.203' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (118, N'8184d7fe-c769-4f83-aca0-369cc3382a1d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T17:50:00.000' AS DateTime), 22, NULL, 14, 1, CAST(N'2020-05-31T13:16:33.457' AS DateTime), 1, CAST(N'2020-05-31T18:41:05.877' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:45:32.857' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:18:24.473' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (119, N'b071c775-565d-490e-86ea-668509b785e0', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:10:00.000' AS DateTime), 21, NULL, 16, 1, CAST(N'2020-05-31T13:22:26.907' AS DateTime), 1, CAST(N'2020-05-31T21:45:58.840' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:47:45.210' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:45:25.500' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (120, N'1af73ecf-cb07-4a2a-86e9-e37d4d220bc1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T12:20:00.000' AS DateTime), 21, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:48:16.830' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:48:16.830' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (121, N'ae409276-c2b7-4b6a-89a4-05f0738b37ed', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-21T11:30:00.000' AS DateTime), 21, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T11:58:58.130' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:58:58.130' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (122, N'ca45dc7a-3573-404a-81d9-ebd2c741154c', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T17:40:00.000' AS DateTime), 21, NULL, 15, 1, CAST(N'2020-05-31T14:32:01.000' AS DateTime), 1, CAST(N'2020-05-31T21:43:58.040' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:03:59.090' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:32:35.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (123, N'ab6ee195-ba9e-4fd5-870f-703e4d1e61e5', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T16:50:00.000' AS DateTime), 22, NULL, 12, 1, CAST(N'2020-06-03T11:46:44.520' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:14:39.953' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T09:58:19.047' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (124, N'62258188-c2bd-4355-802b-35c175c980d6', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T18:10:00.000' AS DateTime), 22, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:14:54.270' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:14:54.270' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (125, N'4bad0e75-1bd5-43f5-8d48-a4fc7956c7f1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-07-05T11:30:00.000' AS DateTime), 21, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:17:59.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:17:59.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (126, N'b0205d6e-900b-40c6-9983-467b4869f438', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T13:30:00.000' AS DateTime), 21, NULL, 5, 1, CAST(N'2020-06-03T12:20:14.523' AS DateTime), 1, CAST(N'2020-06-03T13:20:25.953' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:19:04.823' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:20:54.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (127, N'95072bf5-b98b-4052-9802-3cf04722340d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-10T11:30:00.000' AS DateTime), 21, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:29:53.943' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:29:53.943' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (128, N'95072bf5-b98b-4052-9802-3cf04722340d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-14T11:30:00.000' AS DateTime), 21, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:31:05.480' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:31:05.480' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (129, N'0b388e6b-b71e-49f3-b1e9-f5e4348a828b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T13:40:00.000' AS DateTime), 21, NULL, 7, 1, CAST(N'2020-06-03T12:21:19.807' AS DateTime), 1, CAST(N'2020-06-03T13:21:32.720' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:49:53.900' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:23:48.810' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (130, N'701b11e3-0032-46e0-a9db-45f687796874', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T13:50:00.000' AS DateTime), 21, NULL, 10, 1, CAST(N'2020-06-03T12:21:28.320' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:51:52.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:28:28.823' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (131, N'4c0a32a2-6951-497a-886a-11a778997767', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T14:00:00.000' AS DateTime), 21, NULL, 11, 1, CAST(N'2020-06-03T11:46:41.083' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:52:39.127' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T10:14:28.447' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (132, N'86ab32fe-d683-437d-a2ce-bbfd8b82a907', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T14:10:00.000' AS DateTime), 21, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T12:55:39.403' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:55:39.403' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (133, N'045fc041-1021-40ee-a1b8-f5662457e0ac', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T14:20:00.000' AS DateTime), 21, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T13:04:00.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:04:00.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (134, N'3f896823-30c9-4ac6-91d3-f4de7c258f9f', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T14:30:00.000' AS DateTime), 21, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T13:05:51.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:05:51.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (135, N'd054ffa0-bd0b-4bc5-b511-46ff0a443570', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-14T11:40:00.000' AS DateTime), 21, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T13:07:48.400' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:07:48.400' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (136, N'5adfe2b5-c761-4222-8f85-98e3f818d066', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T14:50:00.000' AS DateTime), 21, NULL, 16, 1, CAST(N'2020-06-03T13:24:22.127' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T14:21:38.387' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:21:38.387' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (137, N'9d9fded6-cbd0-4905-8d87-4c949f8efa5c', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T15:00:00.000' AS DateTime), 21, NULL, 1, 1, CAST(N'2020-06-03T10:01:16.820' AS DateTime), 1, CAST(N'2020-06-03T11:35:19.867' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T14:22:37.567' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T10:12:24.937' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (138, N'e5843740-4b60-4ec1-b14a-e36ff868ab1b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T15:10:00.000' AS DateTime), 21, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T14:43:33.853' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:43:33.853' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (139, N'0c18851a-b8a7-47dc-a3c8-e43af6eaee4a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T15:20:00.000' AS DateTime), 21, NULL, 17, 1, CAST(N'2020-06-03T13:24:53.563' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T14:59:48.280' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T13:27:07.280' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (140, N'4b7378d1-1dee-427b-8e54-d9519f2de26c', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T15:30:00.000' AS DateTime), 21, NULL, 15, 1, CAST(N'2020-06-03T13:24:00.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T15:02:18.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T13:26:43.153' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (141, N'ec081cb3-80d3-48f8-93fc-d1389d206177', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T15:40:00.000' AS DateTime), 21, NULL, 9, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T15:04:16.597' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T10:12:43.473' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (142, N'be6b1333-6c5d-42f8-881d-f2a1a231d8af', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T15:50:00.000' AS DateTime), 21, NULL, 14, 1, CAST(N'2020-06-03T12:26:26.693' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T15:07:13.393' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:28:44.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (143, N'09d4410f-30a0-41ff-9b93-b9a0f45d8562', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T16:00:00.000' AS DateTime), 21, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T15:09:16.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:09:16.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (144, N'20e702c8-d36c-415f-b365-db54a5078df7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T18:00:00.000' AS DateTime), 25, NULL, 19, 1, CAST(N'2020-05-31T18:30:25.770' AS DateTime), 1, CAST(N'2020-05-31T21:46:12.543' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T18:28:51.983' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:28:51.983' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (145, N'25c259da-4905-4357-bf5d-fa8c568b0a60', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T18:20:00.000' AS DateTime), 23, NULL, 22, 1, CAST(N'2020-05-31T18:35:54.897' AS DateTime), 1, CAST(N'2020-05-31T21:46:27.593' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T18:32:46.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:32:46.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (146, N'c01ef91b-b3a0-4a37-bd42-b40d3d356d76', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-05-31T18:30:00.000' AS DateTime), 21, NULL, 23, 1, CAST(N'2020-05-31T18:37:16.607' AS DateTime), 1, CAST(N'2020-05-31T21:46:32.960' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T18:37:01.970' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:37:01.970' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (147, N'433c86ca-aba4-4b9e-be11-e19108c48a49', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T16:40:00.000' AS DateTime), 22, NULL, 8, 1, CAST(N'2020-06-03T11:36:38.480' AS DateTime), 1, CAST(N'2020-06-03T13:22:54.057' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-05-31T21:49:35.017' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:47:38.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (148, N'bd78dc49-0172-4b65-bf01-e00d80a34ca7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T11:30:00.000' AS DateTime), 21, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:23:39.180' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:23:39.180' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (149, N'614747d5-9e7b-48fe-9f62-a2bd8969dfb2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T11:40:00.000' AS DateTime), 23, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:24:37.500' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:25:12.907' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (150, N'411fc261-f91b-4040-a5fc-ec85b682dd35', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T11:50:00.000' AS DateTime), 21, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:26:00.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:26:00.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (151, N'27945e2f-033c-4c1e-8300-7c5773a8936a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T12:00:00.000' AS DateTime), 21, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:26:37.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:26:37.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (152, N'40077b97-768c-4ddb-8788-f0c1c530e8de', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T12:10:00.000' AS DateTime), 21, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:27:42.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:27:42.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
GO
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (153, N'd0d30f1f-39b4-4d77-a42c-b8490d9cc427', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T12:20:00.000' AS DateTime), 21, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:28:14.643' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:28:14.643' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (154, N'0caf0bdd-6160-4a36-bab1-8e0ab6d8f1c7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T12:30:00.000' AS DateTime), 21, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:28:45.453' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:28:45.453' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (155, N'4b41c307-66b6-47b0-b772-0247434b7604', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T12:50:00.000' AS DateTime), 21, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:49:39.273' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:49:39.273' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (156, N'f96c9bda-36ab-4127-baa2-044bd5f07071', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T13:00:00.000' AS DateTime), 22, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:50:08.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:50:34.250' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (157, N'32b162bb-712a-4d65-8d7b-fa9368ed5e4b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T13:10:00.000' AS DateTime), 21, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:57:16.567' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:57:16.567' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (158, N'f60e979b-5ac0-439b-ba21-95a1c3965ee0', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T13:20:00.000' AS DateTime), 21, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:57:48.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:57:48.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (159, N'eeff1b03-88ea-49ae-ac63-0ea5a3f21d2a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T13:30:00.000' AS DateTime), 21, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:58:23.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:58:23.667' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (160, N'20e702c8-d36c-415f-b365-db54a5078df7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-07T13:40:00.000' AS DateTime), 22, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:59:10.780' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:59:10.780' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (161, N'4b7eb9b4-d49f-4386-8d2e-5e2ca8ddb4dd', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-10T11:40:00.000' AS DateTime), 21, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T09:59:58.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:59:58.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (162, N'475e9247-817e-4061-8a8a-ff93e3753c7d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-10T11:50:00.000' AS DateTime), 21, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T10:03:03.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:03:03.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (163, N'27862ee3-b14e-4fcd-83f8-0980fd8afc25', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-10T12:00:00.000' AS DateTime), 21, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T10:03:54.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:03:54.373' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (164, N'930df7b0-5906-44e4-a648-71bfc7286ad1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-10T12:10:00.000' AS DateTime), 21, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T10:09:14.777' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:09:14.777' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (165, N'c56f536f-23b5-423e-b907-10e95df2d26f', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-14T11:50:00.000' AS DateTime), 22, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T10:12:01.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:12:47.940' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (166, N'abb6a4f6-05b3-43da-925b-cb77e33cd778', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-14T12:00:00.000' AS DateTime), 27, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T10:13:33.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:13:33.903' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (167, N'fe7ec34e-9565-49b5-a361-e9cd00bef5fb', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-14T12:10:00.000' AS DateTime), 27, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T10:17:01.570' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T12:00:24.160' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (168, N'e2752548-daba-430f-86d6-fa18bd127857', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-01T10:00:00.000' AS DateTime), 18, NULL, 3, 1, CAST(N'2020-06-01T13:15:21.573' AS DateTime), 1, CAST(N'2020-06-01T13:15:58.193' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T13:15:12.910' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T14:38:01.473' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (169, N'e2752548-daba-430f-86d6-fa18bd127857', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-02T09:15:00.000' AS DateTime), 18, NULL, 2, 1, CAST(N'2020-06-02T03:53:45.947' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T13:16:22.307' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T03:56:11.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (170, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-07T09:00:00.000' AS DateTime), 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T14:57:06.273' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T14:57:06.273' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (171, N'92c22426-b67b-45f0-ad03-b1211b9f2299', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-08T09:00:00.000' AS DateTime), 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T15:17:52.393' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T15:17:52.393' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (172, N'fcf79f3d-4cfb-4f81-b692-b5bd8d4abecf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-01T10:15:00.000' AS DateTime), 18, NULL, 4, 1, CAST(N'2020-06-01T23:53:11.587' AS DateTime), 1, CAST(N'2020-06-01T23:53:15.030' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T23:53:05.100' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T23:53:05.100' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (173, N'fcf79f3d-4cfb-4f81-b692-b5bd8d4abecf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T10:00:00.000' AS DateTime), 18, NULL, 7, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-06-04T13:16:54.357' AS DateTime), 1, 0, CAST(N'2020-06-01T23:53:37.057' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:16:54.357' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (174, N'81ec9ece-a575-4578-9379-2eb668615999', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-01T10:30:00.000' AS DateTime), 26, NULL, 5, 1, CAST(N'2020-06-01T23:54:28.033' AS DateTime), 1, CAST(N'2020-06-01T23:54:28.033' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T23:54:21.070' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T23:54:21.070' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (175, N'81ec9ece-a575-4578-9379-2eb668615999', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-02T09:45:00.000' AS DateTime), 18, NULL, 3, 1, CAST(N'2020-06-02T00:14:44.780' AS DateTime), 1, CAST(N'2020-06-02T00:46:56.053' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-01T23:54:40.783' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:36:58.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (176, N'81ec9ece-a575-4578-9379-2eb668615999', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-03T09:30:00.000' AS DateTime), 18, NULL, 2, 1, CAST(N'2020-06-03T23:44:18.937' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-02T00:26:58.030' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-03T23:38:58.153' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (177, N'81ec9ece-a575-4578-9379-2eb668615999', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T10:15:00.000' AS DateTime), 18, NULL, 5, 0, NULL, 0, NULL, NULL, NULL, 1, CAST(N'2020-06-04T13:42:57.993' AS DateTime), 1, 0, CAST(N'2020-06-02T03:59:23.863' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', CAST(N'2020-06-04T13:42:57.993' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (178, N'beac1c14-256b-46f1-8582-268a6e85cc6b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T17:00:00.000' AS DateTime), 21, 14, 3, 1, CAST(N'2020-06-03T11:38:41.957' AS DateTime), 1, CAST(N'2020-06-03T11:38:58.040' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-03T11:38:34.203' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:33:37.463' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (179, N'327bf17f-9997-4d91-a5e2-5dcdcf5953a5', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', CAST(N'2020-06-03T17:10:00.000' AS DateTime), 21, NULL, 13, 1, CAST(N'2020-06-03T12:27:45.377' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-03T12:27:33.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:27:33.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (180, N'e2752548-daba-430f-86d6-fa18bd127857', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-05T09:25:00.000' AS DateTime), 18, NULL, 4, 1, CAST(N'2020-06-05T11:07:21.290' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-03T20:48:45.150' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:09:55.797' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (181, N'4ff1c9a5-8ba0-4112-b5c3-e06a96ee0f06', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T10:30:00.000' AS DateTime), 18, NULL, 4, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-03T20:49:31.800' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:08:46.303' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (182, N'49a270c2-97c8-4119-ac82-b2bd21cd7810', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T09:00:00.000' AS DateTime), 18, NULL, 6, 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-06-04T13:17:52.467' AS DateTime), 1, 0, CAST(N'2020-06-03T20:50:23.577' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:17:52.467' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (183, N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T09:15:00.000' AS DateTime), 18, NULL, 3, 1, CAST(N'2020-06-04T17:42:52.010' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-04T00:33:02.230' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:51:49.147' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (184, N'49a270c2-97c8-4119-ac82-b2bd21cd7810', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-18T09:00:00.000' AS DateTime), 18, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-04T00:33:32.907' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T00:33:32.907' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (185, N'3293506d-2695-4381-a702-d5848d113dfd', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T09:30:00.000' AS DateTime), 18, NULL, 1, 1, CAST(N'2020-06-04T13:46:09.267' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-04T00:34:59.967' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T17:36:00.010' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (186, N'77822725-f7b6-48ee-ab57-4abf4a0f2957', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-04T09:45:00.000' AS DateTime), 26, NULL, 2, 1, CAST(N'2020-06-04T17:43:46.467' AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-04T00:37:09.827' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:51:18.907' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (187, N'b5190cc5-32d1-4f91-a614-42e1d01ae1b3', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-05T09:00:00.000' AS DateTime), 18, NULL, 5, 1, CAST(N'2020-06-05T12:15:25.717' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-05T09:51:45.767' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T09:51:45.767' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (188, N'81ec9ece-a575-4578-9379-2eb668615999', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-05T09:10:00.000' AS DateTime), 18, NULL, 3, 1, CAST(N'2020-06-05T11:07:27.727' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-05T09:51:56.333' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:09:43.223' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (189, N'fcf79f3d-4cfb-4f81-b692-b5bd8d4abecf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-05T09:20:00.000' AS DateTime), 18, NULL, 1, 1, CAST(N'2020-06-05T11:07:32.163' AS DateTime), 1, CAST(N'2020-06-05T12:17:16.967' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-05T09:52:48.660' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:09:18.870' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[Bookings] ([Id], [PatientId], [DoctorId], [BookingDateTime], [TypeId], [DiscountId], [DaySeqNo], [IsAttend], [AttendanceTime], [IsEnter], [EntryTime], [IsFinish], [FinishTime], [IsCanceled], [CanceledOn], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (190, N'77822725-f7b6-48ee-ab57-4abf4a0f2957', N'1ecb5391-6990-4935-bdbd-571c05a09b69', CAST(N'2020-06-05T09:30:00.000' AS DateTime), 18, NULL, 2, 1, CAST(N'2020-06-05T12:07:12.963' AS DateTime), 1, CAST(N'2020-06-05T12:15:37.713' AS DateTime), NULL, NULL, NULL, NULL, 1, 0, CAST(N'2020-06-05T09:55:15.690' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T12:15:12.117' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (92, 5)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (106, 6)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (117, 6)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (145, 6)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (149, 6)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (94, 7)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (77, 8)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (89, 8)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (54, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (100, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (112, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (174, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (175, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (177, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (186, 9)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (98, 10)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (175, 10)
INSERT [dbo].[BookingServices] ([BookingId], [ServiceId]) VALUES (186, 10)
SET IDENTITY_INSERT [dbo].[ChatMessages] ON 

INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [MessageText], [SentOn], [IsRead], [ReadOn]) VALUES (1027, N'ffa7c677-0635-4fd4-af93-08d803de1e84', N'66e2743a-7556-4369-1878-08d803d86466', N'بعت لحضرتك لينك البرنامج و اسم المستخدم والرقم السرى ', CAST(N'2020-05-31T18:46:15.520' AS DateTime), 1, CAST(N'2020-06-01T12:05:17.3697065' AS DateTime2))
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [MessageText], [SentOn], [IsRead], [ReadOn]) VALUES (1028, N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'test', CAST(N'2020-06-01T13:35:23.773' AS DateTime), 1, CAST(N'2020-06-02T03:50:26.0979462' AS DateTime2))
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [MessageText], [SentOn], [IsRead], [ReadOn]) VALUES (1029, N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'test', CAST(N'2020-06-01T13:38:51.743' AS DateTime), 1, CAST(N'2020-06-02T03:50:26.1167243' AS DateTime2))
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [MessageText], [SentOn], [IsRead], [ReadOn]) VALUES (1030, N'66e2743a-7556-4369-1878-08d803d86466', N'ffa7c677-0635-4fd4-af93-08d803de1e84', N'تمام كدة', CAST(N'2020-06-03T10:13:35.890' AS DateTime), 1, CAST(N'2020-06-03T13:25:33.4264299' AS DateTime2))
INSERT [dbo].[ChatMessages] ([Id], [SenderId], [ReceiverId], [MessageText], [SentOn], [IsRead], [ReadOn]) VALUES (1031, N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'دخل المريض', CAST(N'2020-06-04T13:53:01.803' AS DateTime), 1, CAST(N'2020-06-04T13:53:15.0040897' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ChatMessages] OFF
SET IDENTITY_INSERT [dbo].[ClinicBookingTypes] ON 

INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (18, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'diagnose', N'كشف', CAST(300.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T14:41:49.137' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T13:03:57.540' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (19, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'consult', N'استشارة', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T14:41:49.137' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T13:03:57.547' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (20, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'justService', N'خدمة فقط', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T14:41:49.137' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T14:41:49.150' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (21, N'914870cc-2434-4349-86cb-92421f7cdd18', N'diagnose', N'كشف', CAST(300.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:11:27.963' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-03T12:32:28.033' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (22, N'914870cc-2434-4349-86cb-92421f7cdd18', N'consult', N'استشارة', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:11:27.980' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-03T12:32:28.037' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (23, N'914870cc-2434-4349-86cb-92421f7cdd18', N'justService', N'خدمة فقط', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:11:27.980' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T16:11:27.980' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (24, N'914870cc-2434-4349-86cb-92421f7cdd18', N'كشف مستعجل', N'كشف مستعجل', CAST(600.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:43:30.000' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.040' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (25, N'914870cc-2434-4349-86cb-92421f7cdd18', N'كشف مستعجل فى نفس اليوم', N'كشف مستعجل فى نفس اليوم', CAST(800.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:43:30.017' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.043' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (26, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'كشف مستعجل', N'كشف مستعجل', CAST(500.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:55:52.403' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T13:03:57.550' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicBookingTypes] ([Id], [ClinicId], [Type], [Text], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (27, N'914870cc-2434-4349-86cb-92421f7cdd18', N'متابعة حقن', N'متابعة حقن', CAST(0.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T22:16:26.533' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.047' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
SET IDENTITY_INSERT [dbo].[ClinicBookingTypes] OFF
SET IDENTITY_INSERT [dbo].[ClinicDiscounts] ON 

INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'اضافة خصم 10', CAST(10.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-05-29T16:57:29.893' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T13:03:57.587' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'اضافة خصم 20', CAST(20.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-05-29T17:06:02.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.590' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'اضافة خصم 30', CAST(30.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-05-29T17:06:02.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.593' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'اضافة خصم 40', CAST(40.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-05-29T17:06:02.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.597' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'اضافة خصم 50', CAST(50.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-05-29T17:06:02.313' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.600' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'خصم 100', CAST(100.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:07:44.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.600' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'خصم 200', CAST(200.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:07:44.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.603' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'خصم 300', CAST(300.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:07:44.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.607' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (9, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'خصم 500', CAST(500.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:07:44.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.610' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'خصم 1000', CAST(100.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:07:44.743' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.613' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, N'914870cc-2434-4349-86cb-92421f7cdd18', N'خصم 0', CAST(100.00 AS Decimal(18, 2)), 1, 1, 0, CAST(N'2020-05-29T17:32:32.470' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.100' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, N'914870cc-2434-4349-86cb-92421f7cdd18', N'خصم 100', CAST(100.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:32:32.470' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.110' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'914870cc-2434-4349-86cb-92421f7cdd18', N'خصم 200', CAST(200.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:32:32.470' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.113' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'914870cc-2434-4349-86cb-92421f7cdd18', N'خصم 300', CAST(300.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:32:32.470' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.117' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, N'914870cc-2434-4349-86cb-92421f7cdd18', N'خصم 500', CAST(500.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:32:32.470' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.120' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (16, N'914870cc-2434-4349-86cb-92421f7cdd18', N'خصم 1000', CAST(1000.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-05-29T17:32:32.473' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.123' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicDiscounts] ([Id], [ClinicId], [Discount], [Price], [IsPercent], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (17, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'خصم 0', CAST(0.00 AS Decimal(18, 2)), 0, 1, 0, CAST(N'2020-06-01T13:03:57.613' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:03:57.613' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
SET IDENTITY_INSERT [dbo].[ClinicDiscounts] OFF
INSERT [dbo].[Clinics] ([Id], [ClinicName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [EntryOrderId], [BookingPeriod], [ConsultExpiration], [PrintDoctorName], [PrintDoctorDegree], [PrintClinicName], [PrintLogoUrl], [PrintLogoPublicId], [PrintAddress1], [PrintAddress2], [PrintAddress3], [PrintPhone1], [PrintPhone2], [PrintPhone3], [IsAllDaysOn], [WorkDays], [IsAllDaysSameTime], [AllDaysTimeFrom], [AllDaysTimeTo], [SaturdayTimeFrom], [SundayTimeFrom], [MondayTimeFrom], [TuesdayTimeFrom], [WednesdayTimeFrom], [ThursdayTimeFrom], [FridayTimeFrom], [SaturdayTimeTo], [SundayTimeTo], [MondayTimeTo], [TuesdayTimeTo], [WednesdayTimeTo], [ThursdayTimeTo], [FridayTimeTo]) VALUES (N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'test', 1, 0, CAST(N'2020-05-29T14:41:49.103' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-05T12:09:58.230' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1, 10, 15, N'أ.د/ هشـام حمـــــــــــود', N'دكتوراه الروماتيزم وامراض المفاصل', N'', NULL, NULL, N'5 ش محمد مندور - رابعة العدوية - مدينة نصر - القاهرة', NULL, NULL, N'01005262771 - 01156664588', NULL, NULL, 1, N'6,0,1,2,3,4,5', 1, CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clinics] ([Id], [ClinicName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [EntryOrderId], [BookingPeriod], [ConsultExpiration], [PrintDoctorName], [PrintDoctorDegree], [PrintClinicName], [PrintLogoUrl], [PrintLogoPublicId], [PrintAddress1], [PrintAddress2], [PrintAddress3], [PrintPhone1], [PrintPhone2], [PrintPhone3], [IsAllDaysOn], [WorkDays], [IsAllDaysSameTime], [AllDaysTimeFrom], [AllDaysTimeTo], [SaturdayTimeFrom], [SundayTimeFrom], [MondayTimeFrom], [TuesdayTimeFrom], [WednesdayTimeFrom], [ThursdayTimeFrom], [FridayTimeFrom], [SaturdayTimeTo], [SundayTimeTo], [MondayTimeTo], [TuesdayTimeTo], [WednesdayTimeTo], [ThursdayTimeTo], [FridayTimeTo]) VALUES (N'914870cc-2434-4349-86cb-92421f7cdd18', N'عيادة رابعة العدوية', 1, 0, CAST(N'2020-05-29T16:11:27.950' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-03T12:22:41.867' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', 1, 10, 15, N'أ.د/ هشـام حمـــــــــــود', N'استاذ امراض المفاصل والروماتيزم 
 استشارى امراض العمود الفقرى
          كلية طب الأزهر', NULL, NULL, NULL, N'5 ش محمد مندور - رابعة العدوية - مدينة نصر - القاهرة', NULL, NULL, N'01005262771 - 01156664588', NULL, NULL, 0, N'0,3', 0, CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T11:30:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T11:30:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.000' AS DateTime), CAST(N'2020-01-01T09:00:00.000' AS DateTime), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T19:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T19:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2), CAST(N'2020-01-01T22:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ClinicServices] ON 

INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'914870cc-2434-4349-86cb-92421f7cdd18', N'حقن فقرات عنقية لموضع واحد', CAST(2000.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:47:11.627' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.067' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'914870cc-2434-4349-86cb-92421f7cdd18', N'حقن فقرات عنقية لموضعين', CAST(4000.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:47:11.673' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.070' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'914870cc-2434-4349-86cb-92421f7cdd18', N'حقن فقرات قطنية لموضع واحد', CAST(1500.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:47:11.673' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'914870cc-2434-4349-86cb-92421f7cdd18', N'حقن فقرات قطنية لموضعين', CAST(3000.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:47:11.673' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (9, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'حقن عنقى', CAST(2000.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:56:16.160' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T13:03:57.567' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'حقن قطنى', CAST(1500.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T16:56:34.620' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T13:03:57.570' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicServices] ([Id], [ClinicId], [Service], [Price], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'914870cc-2434-4349-86cb-92421f7cdd18', N'حقن فقرات قطنية لثلاث مواضع', CAST(4500.00 AS Decimal(18, 2)), 1, 0, CAST(N'2020-05-29T22:19:36.790' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:32:28.083' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
SET IDENTITY_INSERT [dbo].[ClinicServices] OFF
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', N'3abe37b3-65db-4f46-005b-08d803cd4ed0')
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'914870cc-2434-4349-86cb-92421f7cdd18', N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'914870cc-2434-4349-86cb-92421f7cdd18', N'ffa7c677-0635-4fd4-af93-08d803de1e84')
INSERT [dbo].[ClinicUsers] ([ClinicId], [UserId]) VALUES (N'914870cc-2434-4349-86cb-92421f7cdd18', N'04209851-d21a-4a80-af94-08d803de1e84')
INSERT [dbo].[DoctorClinics] ([DoctorId], [ClinicId]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b')
INSERT [dbo].[DoctorClinics] ([DoctorId], [ClinicId]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18')
SET IDENTITY_INSERT [dbo].[DoctorComplaintChoicesValues] ON 

INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 2, N'EXERTIONAL', 1, 0, CAST(N'2020-05-31T01:34:29.593' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:34:29.597' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 2, N'WEIGHT', 1, 0, CAST(N'2020-05-31T01:34:53.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:34:53.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 2, N'BEARING', 1, 0, CAST(N'2020-05-31T01:35:23.960' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:35:23.960' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 2, N'NOCTURNAL', 1, 0, CAST(N'2020-05-31T01:36:07.143' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:36:07.143' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, 2, N'WAKES', 1, 0, CAST(N'2020-05-31T01:36:21.927' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:36:21.927' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorComplaintChoicesValues] ([Id], [DetailedComplaintId], [Choice], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, 2, N'FROM SLEEP', 1, 0, CAST(N'2020-05-31T01:36:36.937' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:36:36.940' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
SET IDENTITY_INSERT [dbo].[DoctorComplaintChoicesValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorDetailedComplaintsValues] ON 

INSERT [dbo].[DoctorDetailedComplaintsValues] ([Id], [DoctorId], [Complaint], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'EXERTIONAL', 1, 0, CAST(N'2020-05-31T01:17:07.110' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:17:07.127' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDetailedComplaintsValues] ([Id], [DoctorId], [Complaint], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'pain', 1, 0, CAST(N'2020-05-31T01:33:35.317' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:33:35.317' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
SET IDENTITY_INSERT [dbo].[DoctorDetailedComplaintsValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorDiagnosisValues] ON 

INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N' LBP W RT ST / CPPD', 1, 0, CAST(N'2020-05-29T21:57:08.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T21:57:08.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N' LBP W RT ST / CPPD', 1, 0, CAST(N'2020-05-29T22:25:34.223' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:25:34.227' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CPPD  W  LT EFF', 1, 0, CAST(N'2020-05-29T22:26:14.910' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:26:14.910' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'LBP W RT LS FOR INJ', 1, 0, CAST(N'2020-05-29T22:27:30.607' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:27:30.607' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA CIMZIA', 1, 0, CAST(N'2020-05-29T22:28:34.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:28:34.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (16, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'LBP W LT ST FOR INJ', 1, 0, CAST(N'2020-05-31T01:42:06.717' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:42:06.717' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (17, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W RT ST /B FOR INJ', 1, 0, CAST(N'2020-05-31T01:44:18.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:44:18.730' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (18, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RT WRIST', 1, 0, CAST(N'2020-05-31T01:45:43.837' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:45:43.837' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (19, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W LT ST FOR INJ / LT B', 1, 0, CAST(N'2020-05-31T01:47:43.307' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:47:43.307' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (20, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'  ESKOA CL W  LT B ST', 1, 0, CAST(N'2020-05-31T01:49:02.973' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:49:02.973' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (21, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'FM CL RT B ST', 1, 0, CAST(N'2020-05-31T01:49:37.290' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:49:37.290' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (22, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'J DPM', 1, 0, CAST(N'2020-05-31T02:07:07.477' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:07:07.477' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (23, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'PSA', 1, 0, CAST(N'2020-05-31T02:07:44.827' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:07:44.827' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (24, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'LP W RT ST FOR 5 INJS', 1, 0, CAST(N'2020-05-31T02:27:00.977' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:27:00.977' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (25, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'OA /C SP W LT B', 1, 0, CAST(N'2020-05-31T02:39:36.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T02:39:36.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (26, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'CPPD  W  LT EFF', 1, 0, CAST(N'2020-05-31T04:35:20.247' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T04:35:20.247' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (27, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'RT WRIST', 1, 0, CAST(N'2020-05-31T04:36:41.923' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T04:36:41.923' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (28, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'test', 1, 0, CAST(N'2020-05-31T05:09:16.193' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:09:16.193' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (29, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'الحجز الجديد لقيت فعلا مشكلة بتظهر في حالة تغيير التاريخ هصلحها وأرفعها حالا بإذن الله لكن التشخيصات ممكن تكون بتظهر مشكلة لو زودت التشخيص عن 250 حرف بالمسافات لأن هو ده الحد الأقصى اللي احنا حاطينه لكل أنواع قيم الدكتور في السجل المرضي', 1, 0, CAST(N'2020-05-31T05:18:35.513' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:18:35.513' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (30, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'POST LAM FOR INJ LS RT.LT', 1, 0, CAST(N'2020-05-31T05:21:52.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:21:52.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (31, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'RT K EFF/LT SHOULDER /C SP W LT B', 1, 0, CAST(N'2020-05-31T05:39:59.870' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:39:59.870' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (32, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'HEELS/LBP W LT ST', 1, 0, CAST(N'2020-05-31T05:40:12.257' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:40:12.257' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (33, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'LPB WLT ST.B W LT LS INJ ONE Y AGO /FOR RT LS INJ', 1, 0, CAST(N'2020-05-31T05:40:31.423' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:40:31.423' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (34, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RT K EFF/LT SHOULDER /C SP W LT B', 1, 0, CAST(N'2020-05-31T05:56:11.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:56:11.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (35, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'HEELS/LBP W LT ST', 1, 0, CAST(N'2020-05-31T05:57:02.207' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:57:02.207' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (36, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'SLE', 1, 0, CAST(N'2020-05-31T06:02:07.770' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T06:02:07.770' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (37, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RT WRIST C L W  sp  w rt b', 1, 0, CAST(N'2020-05-31T11:43:44.437' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:43:44.437' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (38, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA /XILJAZ', 1, 0, CAST(N'2020-05-31T11:51:06.600' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:51:06.600' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (39, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N' LBP W RT ST / CPPD FOR INJ', 1, 0, CAST(N'2020-05-31T12:03:43.147' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:03:43.147' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (40, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N' LBP W RT ST / CPPD FOR INJ', 1, 0, CAST(N'2020-05-31T12:03:54.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:03:54.540' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (41, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'LBP W RT /LT ST /KS FOR INJ', 1, 0, CAST(N'2020-05-31T12:07:48.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:07:48.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (42, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'     RA', 1, 0, CAST(N'2020-05-31T12:36:20.130' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:36:20.130' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (43, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'"POST LAM W RT ST FOR INJ / BOTH   20 YS"', 1, 0, CAST(N'2020-05-31T13:00:02.987' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:00:02.987' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (44, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA/ CL W RT ST   RT B', 1, 0, CAST(N'2020-05-31T13:05:20.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:05:20.893' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (45, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA OLUMIANT', 1, 0, CAST(N'2020-05-31T14:33:27.473' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:33:27.473' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (46, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'LBP W RT ST FOR INJ/ BOTH', 1, 0, CAST(N'2020-05-31T18:31:48.867' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:31:48.867' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (47, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA/ FOR LT LS INJ', 1, 0, CAST(N'2020-05-31T18:35:25.763' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:35:25.763' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (48, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'PMR', 1, 0, CAST(N'2020-06-01T09:22:28.467' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:22:28.467' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (49, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W LT ST  RT B FOR RT INJ/HYPERSPLENISM', 1, 0, CAST(N'2020-06-01T09:23:52.647' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:23:52.647' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (50, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W LT B FOR INJ', 1, 0, CAST(N'2020-06-01T09:55:02.430' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-01T09:55:02.437' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (51, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'OA KS CPPD/ KS INJ', 1, 0, CAST(N'2020-06-01T10:02:24.403' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:02:24.403' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (52, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA CYMZIA', 1, 0, CAST(N'2020-06-01T10:12:17.193' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:12:17.193' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (53, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'POST LAMENICTOMY W LT ST  INJ', 1, 0, CAST(N'2020-06-01T10:13:52.237' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:13:52.237' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (54, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'OA KS LT ANS INJ', 1, 0, CAST(N'2020-06-02T10:34:21.753' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:34:21.753' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (55, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'POST TR LBP W LT /RT ST FOR INJ BOTH', 1, 0, CAST(N'2020-06-02T10:36:11.277' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:36:11.277' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (56, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W LT ST  RT B FOR RT INJ/HYPERSPLENISM   ', 1, 0, CAST(N'2020-06-02T10:37:06.423' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:37:06.423' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (57, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'RA /AMJEVITA', 1, 0, CAST(N'2020-06-02T10:38:03.980' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:38:03.980' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (58, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W RT  B LT ST    ', 1, 0, CAST(N'2020-06-02T10:40:15.300' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:40:15.300' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (59, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'AS CIMZIA', 1, 0, CAST(N'2020-06-02T10:43:21.043' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:43:21.043' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (60, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CL W RT  B LT ST     ', 1, 0, CAST(N'2020-06-02T11:19:06.890' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T11:19:06.890' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (61, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'C SP W RT B/LS FOR INJ', 1, 0, CAST(N'2020-06-03T11:40:18.160' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:40:18.160' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[DoctorDiagnosisValues] ([Id], [DoctorId], [Diagnosis], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (62, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'  LBP W RT ST FOR INJ', 1, 0, CAST(N'2020-06-03T11:45:07.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:45:07.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
SET IDENTITY_INSERT [dbo].[DoctorDiagnosisValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorGeneralComplaintsValues] ON 

INSERT [dbo].[DoctorGeneralComplaintsValues] ([Id], [DoctorId], [Complaint], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'pain', 1, 0, CAST(N'2020-05-31T01:14:55.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T01:14:55.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
SET IDENTITY_INSERT [dbo].[DoctorGeneralComplaintsValues] OFF
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 1, 1, 0, CAST(N'2020-05-29T22:59:14.540' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.540' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2, 1, 0, CAST(N'2020-05-29T22:59:14.783' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.790' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 1002, 1, 0, CAST(N'2020-05-29T22:59:15.543' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.543' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 1003, 1, 0, CAST(N'2020-05-29T22:59:14.910' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.910' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2003, 1, 0, CAST(N'2020-05-29T22:59:15.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2004, 1, 0, CAST(N'2020-05-29T22:59:14.540' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.540' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2005, 1, 0, CAST(N'2020-05-29T22:59:15.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2006, 1, 0, CAST(N'2020-05-29T22:59:15.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2007, 1, 0, CAST(N'2020-05-29T22:59:15.293' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.293' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2008, 1, 0, CAST(N'2020-05-29T22:59:14.997' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.997' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2009, 1, 0, CAST(N'2020-05-29T22:59:15.010' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.013' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2010, 1, 0, CAST(N'2020-05-29T22:59:15.230' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.230' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2011, 1, 0, CAST(N'2020-05-29T22:59:14.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2012, 1, 0, CAST(N'2020-05-29T22:59:14.970' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.970' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2013, 1, 0, CAST(N'2020-05-29T22:59:15.220' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.227' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2014, 1, 0, CAST(N'2020-05-29T22:59:15.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.213' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2015, 1, 0, CAST(N'2020-05-29T22:59:15.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.480' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2016, 1, 0, CAST(N'2020-05-29T22:59:14.557' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.557' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2017, 1, 0, CAST(N'2020-05-29T22:59:14.557' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.557' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2018, 1, 0, CAST(N'2020-05-29T22:59:15.590' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.590' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2019, 1, 0, CAST(N'2020-05-29T22:59:15.573' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.573' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2020, 1, 0, CAST(N'2020-05-29T22:59:15.387' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.387' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2021, 1, 0, CAST(N'2020-05-29T22:59:15.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2022, 1, 0, CAST(N'2020-05-29T22:59:15.113' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2023, 1, 0, CAST(N'2020-05-29T22:59:15.423' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.427' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2024, 1, 0, CAST(N'2020-05-29T22:59:15.433' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.437' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2025, 1, 0, CAST(N'2020-05-29T22:59:15.790' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.793' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2026, 1, 0, CAST(N'2020-05-29T22:59:15.797' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.797' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2027, 1, 0, CAST(N'2020-05-29T22:59:15.247' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.247' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2028, 1, 0, CAST(N'2020-05-29T22:59:15.247' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.247' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2029, 1, 0, CAST(N'2020-05-29T22:59:15.340' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.340' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2030, 1, 0, CAST(N'2020-05-29T22:59:15.327' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.327' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2031, 1, 0, CAST(N'2020-05-29T22:59:15.813' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.813' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2032, 1, 0, CAST(N'2020-05-29T22:59:14.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.680' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2033, 1, 0, CAST(N'2020-05-29T22:59:14.940' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.940' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2034, 1, 0, CAST(N'2020-05-29T22:59:14.910' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.923' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2035, 1, 0, CAST(N'2020-05-29T22:59:15.080' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.083' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2036, 1, 0, CAST(N'2020-05-29T22:59:14.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2037, 1, 0, CAST(N'2020-05-29T22:59:14.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2038, 1, 0, CAST(N'2020-05-29T22:59:15.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.047' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2039, 1, 0, CAST(N'2020-05-29T22:59:14.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2040, 1, 0, CAST(N'2020-05-29T22:59:15.620' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.640' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2041, 1, 0, CAST(N'2020-05-29T22:59:15.277' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.277' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2042, 1, 0, CAST(N'2020-05-29T22:59:15.357' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.373' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2043, 1, 0, CAST(N'2020-05-29T22:59:14.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2044, 1, 0, CAST(N'2020-05-29T22:59:14.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2045, 1, 0, CAST(N'2020-05-29T22:59:14.570' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.590' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2046, 1, 0, CAST(N'2020-05-29T22:59:14.893' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.893' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2047, 1, 0, CAST(N'2020-05-29T22:59:15.063' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.063' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2048, 1, 0, CAST(N'2020-05-29T22:59:15.403' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.403' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2049, 1, 0, CAST(N'2020-05-29T22:59:15.403' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.403' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2050, 1, 0, CAST(N'2020-05-29T22:59:14.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2051, 1, 0, CAST(N'2020-05-29T22:59:14.727' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.727' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2052, 1, 0, CAST(N'2020-05-29T22:59:14.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2053, 1, 0, CAST(N'2020-05-29T22:59:14.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2054, 1, 0, CAST(N'2020-05-29T22:59:15.527' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.527' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2055, 1, 0, CAST(N'2020-05-29T22:59:14.863' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.863' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2056, 1, 0, CAST(N'2020-05-29T22:59:14.863' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.863' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2057, 1, 0, CAST(N'2020-05-29T22:59:15.543' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.557' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2058, 1, 0, CAST(N'2020-05-29T22:59:15.147' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2059, 1, 0, CAST(N'2020-05-29T22:59:15.653' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.653' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2060, 1, 0, CAST(N'2020-05-29T22:59:14.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2061, 1, 0, CAST(N'2020-05-29T22:59:15.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2062, 1, 0, CAST(N'2020-05-29T22:59:15.293' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.293' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2063, 1, 0, CAST(N'2020-05-29T22:59:15.277' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.277' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2064, 1, 0, CAST(N'2020-05-29T22:59:14.727' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.727' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2065, 1, 0, CAST(N'2020-05-29T22:59:15.310' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.327' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2066, 1, 0, CAST(N'2020-05-29T22:59:14.570' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.570' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2067, 1, 0, CAST(N'2020-05-29T22:59:14.597' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.603' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2068, 1, 0, CAST(N'2020-05-29T22:59:14.940' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.957' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2069, 1, 0, CAST(N'2020-05-29T22:59:15.147' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.147' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2070, 1, 0, CAST(N'2020-05-29T22:59:14.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.540' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2071, 1, 0, CAST(N'2020-05-29T22:59:14.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2072, 1, 0, CAST(N'2020-05-29T22:59:15.620' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.620' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2073, 1, 0, CAST(N'2020-05-29T22:59:14.727' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.727' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2074, 1, 0, CAST(N'2020-05-29T22:59:15.710' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2075, 1, 0, CAST(N'2020-05-29T22:59:15.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2076, 1, 0, CAST(N'2020-05-29T22:59:14.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2077, 1, 0, CAST(N'2020-05-29T22:59:14.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2078, 1, 0, CAST(N'2020-05-29T22:59:14.797' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.803' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2079, 1, 0, CAST(N'2020-05-29T22:59:14.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2080, 1, 0, CAST(N'2020-05-29T22:59:14.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2081, 1, 0, CAST(N'2020-05-29T22:59:15.263' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.263' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2082, 1, 0, CAST(N'2020-05-29T22:59:14.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2083, 1, 0, CAST(N'2020-05-29T22:59:15.913' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.913' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2084, 1, 0, CAST(N'2020-05-29T22:59:15.670' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.670' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2085, 1, 0, CAST(N'2020-05-29T22:59:15.700' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.703' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2086, 1, 0, CAST(N'2020-05-29T22:59:15.687' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2087, 1, 0, CAST(N'2020-05-29T22:59:15.373' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.373' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2088, 1, 0, CAST(N'2020-05-29T22:59:15.387' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.387' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2089, 1, 0, CAST(N'2020-05-29T22:59:14.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2090, 1, 0, CAST(N'2020-05-29T22:59:15.557' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.573' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2091, 1, 0, CAST(N'2020-05-29T22:59:15.103' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.110' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2092, 1, 0, CAST(N'2020-05-29T22:59:15.897' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.897' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2093, 1, 0, CAST(N'2020-05-29T22:59:15.883' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.883' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2094, 1, 0, CAST(N'2020-05-29T22:59:14.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2095, 1, 0, CAST(N'2020-05-29T22:59:15.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.783' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2096, 1, 0, CAST(N'2020-05-29T22:59:14.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2097, 1, 0, CAST(N'2020-05-29T22:59:14.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2098, 1, 0, CAST(N'2020-05-29T22:59:14.710' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.710' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
GO
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2099, 1, 0, CAST(N'2020-05-29T22:59:15.897' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.913' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2100, 1, 0, CAST(N'2020-05-29T22:59:14.623' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.627' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2101, 1, 0, CAST(N'2020-05-29T22:59:15.857' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.860' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2102, 1, 0, CAST(N'2020-05-29T22:59:14.710' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.710' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2103, 1, 0, CAST(N'2020-05-29T22:59:15.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2104, 1, 0, CAST(N'2020-05-29T22:59:14.923' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.923' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2105, 1, 0, CAST(N'2020-05-29T22:59:14.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2106, 1, 0, CAST(N'2020-05-29T22:59:15.193' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2107, 1, 0, CAST(N'2020-05-29T22:59:15.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2108, 1, 0, CAST(N'2020-05-29T22:59:15.310' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.310' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2109, 1, 0, CAST(N'2020-05-29T22:59:15.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.527' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2110, 1, 0, CAST(N'2020-05-29T22:59:14.987' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.993' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2111, 1, 0, CAST(N'2020-05-29T22:59:15.730' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.730' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2112, 1, 0, CAST(N'2020-05-29T22:59:15.713' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.730' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2113, 1, 0, CAST(N'2020-05-29T22:59:14.607' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.610' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2114, 1, 0, CAST(N'2020-05-29T22:59:15.093' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.097' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2115, 1, 0, CAST(N'2020-05-29T22:59:14.893' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.893' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2116, 1, 0, CAST(N'2020-05-29T22:59:15.183' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.187' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2117, 1, 0, CAST(N'2020-05-29T22:59:15.640' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.653' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2118, 1, 0, CAST(N'2020-05-29T22:59:14.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2119, 1, 0, CAST(N'2020-05-29T22:59:15.607' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.607' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2120, 1, 0, CAST(N'2020-05-29T22:59:15.590' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.590' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2121, 1, 0, CAST(N'2020-05-29T22:59:14.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2122, 1, 0, CAST(N'2020-05-29T22:59:14.750' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.750' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2123, 1, 0, CAST(N'2020-05-29T22:59:15.130' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.130' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2124, 1, 0, CAST(N'2020-05-29T22:59:15.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2125, 1, 0, CAST(N'2020-05-29T22:59:15.747' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.747' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2126, 1, 0, CAST(N'2020-05-29T22:59:15.763' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.763' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2127, 1, 0, CAST(N'2020-05-29T22:59:15.047' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.047' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2128, 1, 0, CAST(N'2020-05-29T22:59:15.047' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.063' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2129, 1, 0, CAST(N'2020-05-29T22:59:14.823' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.827' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2130, 1, 0, CAST(N'2020-05-29T22:59:14.810' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.813' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2131, 1, 0, CAST(N'2020-05-29T22:59:15.340' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.357' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2132, 1, 0, CAST(N'2020-05-29T22:59:15.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2133, 1, 0, CAST(N'2020-05-29T22:59:15.130' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.130' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2134, 1, 0, CAST(N'2020-05-29T22:59:14.757' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.757' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2135, 1, 0, CAST(N'2020-05-29T22:59:15.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.510' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2136, 1, 0, CAST(N'2020-05-29T22:59:14.957' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.957' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2137, 1, 0, CAST(N'2020-05-29T22:59:15.017' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.017' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2138, 1, 0, CAST(N'2020-05-29T22:59:15.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2139, 1, 0, CAST(N'2020-05-29T22:59:14.970' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.970' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2140, 1, 0, CAST(N'2020-05-29T22:59:14.757' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.757' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2141, 1, 0, CAST(N'2020-05-29T22:59:15.443' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.443' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2142, 1, 0, CAST(N'2020-05-29T22:59:15.497' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.497' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2143, 1, 0, CAST(N'2020-05-29T22:59:15.497' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.497' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2144, 1, 0, CAST(N'2020-05-29T22:59:14.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2145, 1, 0, CAST(N'2020-05-29T22:59:14.680' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.680' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2146, 1, 0, CAST(N'2020-05-29T22:59:14.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2147, 1, 0, CAST(N'2020-05-29T22:59:14.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:14.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', 2148, 1, 0, CAST(N'2020-05-29T22:59:15.870' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T22:59:15.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 1, 1, 0, CAST(N'2020-06-02T01:03:05.703' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.703' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2, 1, 0, CAST(N'2020-06-02T01:03:05.873' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.890' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 1002, 1, 0, CAST(N'2020-06-02T01:03:06.553' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.553' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 1003, 1, 0, CAST(N'2020-06-02T01:03:06.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.040' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2003, 1, 0, CAST(N'2020-06-02T01:03:06.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2004, 1, 0, CAST(N'2020-06-02T01:03:05.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.703' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2005, 1, 0, CAST(N'2020-06-02T01:03:06.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2006, 1, 0, CAST(N'2020-06-02T01:03:06.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2007, 1, 0, CAST(N'2020-06-02T01:03:06.320' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.337' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2008, 1, 0, CAST(N'2020-06-02T01:03:06.087' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.103' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2009, 1, 0, CAST(N'2020-06-02T01:03:06.103' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.103' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2010, 1, 0, CAST(N'2020-06-02T01:03:06.273' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.273' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2011, 1, 0, CAST(N'2020-06-02T01:03:05.993' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.993' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2012, 1, 0, CAST(N'2020-06-02T01:03:06.070' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.070' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2013, 1, 0, CAST(N'2020-06-02T01:03:06.273' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.273' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2014, 1, 0, CAST(N'2020-06-02T01:03:06.257' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.257' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2015, 1, 0, CAST(N'2020-06-02T01:03:06.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.493' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2016, 1, 0, CAST(N'2020-06-02T01:03:05.720' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.720' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2017, 1, 0, CAST(N'2020-06-02T01:03:05.703' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.703' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2018, 1, 0, CAST(N'2020-06-02T01:03:06.583' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.583' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2019, 1, 0, CAST(N'2020-06-02T01:03:06.583' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.583' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2020, 1, 0, CAST(N'2020-06-02T01:03:06.400' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.417' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2021, 1, 0, CAST(N'2020-06-02T01:03:06.180' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2022, 1, 0, CAST(N'2020-06-02T01:03:06.180' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.180' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2023, 1, 0, CAST(N'2020-06-02T01:03:06.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2024, 1, 0, CAST(N'2020-06-02T01:03:06.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2025, 1, 0, CAST(N'2020-06-02T01:03:06.737' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.737' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2026, 1, 0, CAST(N'2020-06-02T01:03:06.753' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.753' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2027, 1, 0, CAST(N'2020-06-02T01:03:06.290' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.290' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2028, 1, 0, CAST(N'2020-06-02T01:03:06.290' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.290' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2029, 1, 0, CAST(N'2020-06-02T01:03:06.370' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.370' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2030, 1, 0, CAST(N'2020-06-02T01:03:06.353' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.353' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2031, 1, 0, CAST(N'2020-06-02T01:03:06.753' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.770' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2032, 1, 0, CAST(N'2020-06-02T01:03:05.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.797' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2033, 1, 0, CAST(N'2020-06-02T01:03:06.057' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.057' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2034, 1, 0, CAST(N'2020-06-02T01:03:06.043' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.050' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2035, 1, 0, CAST(N'2020-06-02T01:03:06.150' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.150' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2036, 1, 0, CAST(N'2020-06-02T01:03:05.937' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.940' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2037, 1, 0, CAST(N'2020-06-02T01:03:05.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2038, 1, 0, CAST(N'2020-06-02T01:03:06.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.133' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2039, 1, 0, CAST(N'2020-06-02T01:03:05.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2040, 1, 0, CAST(N'2020-06-02T01:03:06.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2041, 1, 0, CAST(N'2020-06-02T01:03:06.313' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.317' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2042, 1, 0, CAST(N'2020-06-02T01:03:06.383' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.383' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2043, 1, 0, CAST(N'2020-06-02T01:03:05.777' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2044, 1, 0, CAST(N'2020-06-02T01:03:05.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2045, 1, 0, CAST(N'2020-06-02T01:03:05.720' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.737' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2046, 1, 0, CAST(N'2020-06-02T01:03:06.027' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.030' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2047, 1, 0, CAST(N'2020-06-02T01:03:06.150' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.150' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2048, 1, 0, CAST(N'2020-06-02T01:03:06.417' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.417' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
GO
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2049, 1, 0, CAST(N'2020-06-02T01:03:06.430' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.430' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2050, 1, 0, CAST(N'2020-06-02T01:03:05.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.640' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2051, 1, 0, CAST(N'2020-06-02T01:03:05.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.850' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2052, 1, 0, CAST(N'2020-06-02T01:03:05.643' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2053, 1, 0, CAST(N'2020-06-02T01:03:05.757' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.760' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2054, 1, 0, CAST(N'2020-06-02T01:03:06.537' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.537' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2055, 1, 0, CAST(N'2020-06-02T01:03:05.977' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.977' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2056, 1, 0, CAST(N'2020-06-02T01:03:05.977' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.977' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2057, 1, 0, CAST(N'2020-06-02T01:03:06.553' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.553' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2058, 1, 0, CAST(N'2020-06-02T01:03:06.210' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.230' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2059, 1, 0, CAST(N'2020-06-02T01:03:06.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2060, 1, 0, CAST(N'2020-06-02T01:03:05.770' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.770' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2061, 1, 0, CAST(N'2020-06-02T01:03:06.233' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.233' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2062, 1, 0, CAST(N'2020-06-02T01:03:06.320' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.320' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2063, 1, 0, CAST(N'2020-06-02T01:03:06.320' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.320' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2064, 1, 0, CAST(N'2020-06-02T01:03:05.843' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.843' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2065, 1, 0, CAST(N'2020-06-02T01:03:06.353' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.353' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2066, 1, 0, CAST(N'2020-06-02T01:03:05.720' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.720' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2067, 1, 0, CAST(N'2020-06-02T01:03:05.740' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.743' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2068, 1, 0, CAST(N'2020-06-02T01:03:06.057' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.070' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2069, 1, 0, CAST(N'2020-06-02T01:03:06.210' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.210' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2070, 1, 0, CAST(N'2020-06-02T01:03:05.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2071, 1, 0, CAST(N'2020-06-02T01:03:05.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2072, 1, 0, CAST(N'2020-06-02T01:03:06.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2073, 1, 0, CAST(N'2020-06-02T01:03:05.860' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.860' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2074, 1, 0, CAST(N'2020-06-02T01:03:06.677' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.677' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2075, 1, 0, CAST(N'2020-06-02T01:03:06.677' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.677' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2076, 1, 0, CAST(N'2020-06-02T01:03:05.653' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.657' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2077, 1, 0, CAST(N'2020-06-02T01:03:05.650' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.653' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2078, 1, 0, CAST(N'2020-06-02T01:03:05.890' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.890' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2079, 1, 0, CAST(N'2020-06-02T01:03:05.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2080, 1, 0, CAST(N'2020-06-02T01:03:05.667' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.667' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2081, 1, 0, CAST(N'2020-06-02T01:03:06.307' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.310' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2082, 1, 0, CAST(N'2020-06-02T01:03:05.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.780' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2083, 1, 0, CAST(N'2020-06-02T01:03:06.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.847' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2084, 1, 0, CAST(N'2020-06-02T01:03:06.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.647' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2085, 1, 0, CAST(N'2020-06-02T01:03:06.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2086, 1, 0, CAST(N'2020-06-02T01:03:06.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2087, 1, 0, CAST(N'2020-06-02T01:03:06.383' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.383' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2088, 1, 0, CAST(N'2020-06-02T01:03:06.400' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.400' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2089, 1, 0, CAST(N'2020-06-02T01:03:05.660' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.663' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2090, 1, 0, CAST(N'2020-06-02T01:03:06.570' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.570' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2091, 1, 0, CAST(N'2020-06-02T01:03:06.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.180' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2092, 1, 0, CAST(N'2020-06-02T01:03:06.817' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2093, 1, 0, CAST(N'2020-06-02T01:03:06.817' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.817' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2094, 1, 0, CAST(N'2020-06-02T01:03:05.993' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.993' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2095, 1, 0, CAST(N'2020-06-02T01:03:06.737' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.737' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2096, 1, 0, CAST(N'2020-06-02T01:03:05.810' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.813' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2097, 1, 0, CAST(N'2020-06-02T01:03:05.817' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.820' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2098, 1, 0, CAST(N'2020-06-02T01:03:05.827' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2099, 1, 0, CAST(N'2020-06-02T01:03:06.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.830' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2100, 1, 0, CAST(N'2020-06-02T01:03:05.763' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.767' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2101, 1, 0, CAST(N'2020-06-02T01:03:06.800' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.800' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2102, 1, 0, CAST(N'2020-06-02T01:03:05.837' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.837' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2103, 1, 0, CAST(N'2020-06-02T01:03:06.783' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.783' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2104, 1, 0, CAST(N'2020-06-02T01:03:06.057' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.057' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2105, 1, 0, CAST(N'2020-06-02T01:03:05.903' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.920' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2106, 1, 0, CAST(N'2020-06-02T01:03:06.247' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.250' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2107, 1, 0, CAST(N'2020-06-02T01:03:06.257' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.257' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2108, 1, 0, CAST(N'2020-06-02T01:03:06.337' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.337' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2109, 1, 0, CAST(N'2020-06-02T01:03:06.537' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.537' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2110, 1, 0, CAST(N'2020-06-02T01:03:06.087' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.087' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2111, 1, 0, CAST(N'2020-06-02T01:03:06.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.710' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2112, 1, 0, CAST(N'2020-06-02T01:03:06.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.693' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2113, 1, 0, CAST(N'2020-06-02T01:03:05.750' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.753' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2114, 1, 0, CAST(N'2020-06-02T01:03:06.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.163' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2115, 1, 0, CAST(N'2020-06-02T01:03:06.013' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.017' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2116, 1, 0, CAST(N'2020-06-02T01:03:06.240' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.243' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2117, 1, 0, CAST(N'2020-06-02T01:03:06.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.633' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2118, 1, 0, CAST(N'2020-06-02T01:03:05.620' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.627' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2119, 1, 0, CAST(N'2020-06-02T01:03:06.600' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.600' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2120, 1, 0, CAST(N'2020-06-02T01:03:06.583' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.600' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2121, 1, 0, CAST(N'2020-06-02T01:03:05.920' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.920' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2122, 1, 0, CAST(N'2020-06-02T01:03:05.867' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.870' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2123, 1, 0, CAST(N'2020-06-02T01:03:06.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.210' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2124, 1, 0, CAST(N'2020-06-02T01:03:06.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.477' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2125, 1, 0, CAST(N'2020-06-02T01:03:06.717' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.720' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2126, 1, 0, CAST(N'2020-06-02T01:03:06.730' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.730' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2127, 1, 0, CAST(N'2020-06-02T01:03:06.133' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.133' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2128, 1, 0, CAST(N'2020-06-02T01:03:06.133' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.150' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2129, 1, 0, CAST(N'2020-06-02T01:03:05.903' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.903' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2130, 1, 0, CAST(N'2020-06-02T01:03:05.890' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.903' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2131, 1, 0, CAST(N'2020-06-02T01:03:06.370' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.370' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2132, 1, 0, CAST(N'2020-06-02T01:03:06.770' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.770' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2133, 1, 0, CAST(N'2020-06-02T01:03:06.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.197' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2134, 1, 0, CAST(N'2020-06-02T01:03:05.873' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.873' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2135, 1, 0, CAST(N'2020-06-02T01:03:06.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2136, 1, 0, CAST(N'2020-06-02T01:03:06.070' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.070' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2137, 1, 0, CAST(N'2020-06-02T01:03:06.103' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2138, 1, 0, CAST(N'2020-06-02T01:03:06.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.117' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2139, 1, 0, CAST(N'2020-06-02T01:03:06.087' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.087' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2140, 1, 0, CAST(N'2020-06-02T01:03:05.873' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.873' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2141, 1, 0, CAST(N'2020-06-02T01:03:06.447' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.463' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2142, 1, 0, CAST(N'2020-06-02T01:03:06.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.523' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2143, 1, 0, CAST(N'2020-06-02T01:03:06.513' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.517' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2144, 1, 0, CAST(N'2020-06-02T01:03:05.920' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.920' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2145, 1, 0, CAST(N'2020-06-02T01:03:05.803' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.807' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2146, 1, 0, CAST(N'2020-06-02T01:03:05.507' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.507' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2147, 1, 0, CAST(N'2020-06-02T01:03:05.970' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:05.970' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorMedicinesValues] ([DoctorId], [MedicineId], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 2148, 1, 0, CAST(N'2020-06-02T01:03:06.800' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-06-02T01:03:06.800' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
GO
SET IDENTITY_INSERT [dbo].[DoctorRayAreasValues] ON 

INSERT [dbo].[DoctorRayAreasValues] ([Id], [DoctorId], [RayArea], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'Cervical AP', 1, 0, CAST(N'2020-05-31T05:41:49.590' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:41:49.603' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRayAreasValues] ([Id], [DoctorId], [RayArea], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'Lumbar Spine AP', 1, 0, CAST(N'2020-05-31T05:41:58.677' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:41:58.677' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRayAreasValues] ([Id], [DoctorId], [RayArea], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'Shoulder AP', 1, 0, CAST(N'2020-05-31T05:42:05.257' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:42:05.257' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
SET IDENTITY_INSERT [dbo].[DoctorRayAreasValues] OFF
SET IDENTITY_INSERT [dbo].[DoctorRaysValues] ON 

INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'X-Ray', 1, 0, CAST(N'2020-05-31T05:12:53.607' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:12:53.617' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'CT Scan', 1, 0, CAST(N'2020-05-31T05:13:03.673' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:13:03.690' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'MRI', 1, 0, CAST(N'2020-05-31T05:13:12.473' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:13:12.473' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'DEXA', 1, 0, CAST(N'2020-05-31T05:13:21.753' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:13:21.753' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'ْْX-Ray', 1, 0, CAST(N'2020-05-31T05:38:54.623' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:38:54.623' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'CT Scan', 1, 0, CAST(N'2020-05-31T05:39:00.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:39:00.877' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (16, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'MRI', 1, 0, CAST(N'2020-05-31T05:39:14.520' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:39:14.520' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
INSERT [dbo].[DoctorRaysValues] ([Id], [DoctorId], [RayName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (17, N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'DEXA', 1, 0, CAST(N'2020-05-31T05:39:22.023' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-31T05:39:22.023' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
SET IDENTITY_INSERT [dbo].[DoctorRaysValues] OFF
INSERT [dbo].[Doctors] ([Id], [UserId], [SpecialtyId], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [PatientRecordSections], [DiseasesQuestions], [Phone1], [Phone2], [Phone3], [WhatsApp], [Email1], [Email2], [Facebook], [Twitter], [LinkedIn], [Instagram]) VALUES (N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 2, N'test doctor', 1, 0, CAST(N'2020-05-29T14:39:47.047' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T14:39:47.063' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', N'All', N'All', N'01111111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Doctors] ([Id], [UserId], [SpecialtyId], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [PatientRecordSections], [DiseasesQuestions], [Phone1], [Phone2], [Phone3], [WhatsApp], [Email1], [Email2], [Facebook], [Twitter], [LinkedIn], [Instagram]) VALUES (N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'66e2743a-7556-4369-1878-08d803d86466', 2, N'هشام صلاح السيد حمود', 1, 0, CAST(N'2020-05-29T16:00:20.360' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T16:00:20.373' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', N'4,5,6', N'All', N'01100000129', N'01001748047', NULL, N'01100000129', N'hesham.hamoud@gmail.com', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Expenses] ON 

INSERT [dbo].[Expenses] ([Id], [ExpenseTypeId], [ExpenseCost], [ExpenseDate], [Note], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, CAST(195.00 AS Decimal(18, 2)), CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'حجز الدومين لمدة عام', 0, CAST(N'2020-05-24T12:06:09.267' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-05-24T12:06:09.267' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
INSERT [dbo].[Expenses] ([Id], [ExpenseTypeId], [ExpenseCost], [ExpenseDate], [Note], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, CAST(940.00 AS Decimal(18, 2)), CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'حجز الهوست لمدة عام', 0, CAST(N'2020-05-24T12:06:25.753' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-05-24T12:06:25.753' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad')
SET IDENTITY_INSERT [dbo].[Expenses] OFF
SET IDENTITY_INSERT [dbo].[PatientDiagnosis] ON 

INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1034, N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', 11, NULL, N'', CAST(N'2020-05-29T21:57:48.303' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T04:39:21.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1035, N'ae409276-c2b7-4b6a-89a4-05f0738b37ed', 12, NULL, N'', CAST(N'2020-05-29T22:25:53.197' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:25:53.197' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1036, N'08e25767-2e48-4205-8a60-88d226c92fb2', 13, NULL, N'', CAST(N'2020-05-29T22:26:43.003' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:26:43.003' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1037, N'3204b985-b1bc-4263-992b-195b2ab926df', 14, NULL, N'', CAST(N'2020-05-29T22:27:55.397' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:27:55.397' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1038, N'd958878c-a513-4b2e-8bf3-71bf062b61e6', 15, NULL, N'', CAST(N'2020-05-29T22:29:02.197' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:32:27.883' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1039, N'd0e0664a-e25e-43ae-a4af-2e82ade25fe4', 16, NULL, N'', CAST(N'2020-05-31T01:42:50.283' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:42:50.283' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1040, N'60682fd3-d98d-4d14-9aae-1e84eee558bd', 17, NULL, N'', CAST(N'2020-05-31T01:44:48.620' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:44:48.620' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1041, N'a7a677fa-8697-461d-8280-0ff4df94f301', 18, NULL, N'', CAST(N'2020-05-31T01:45:53.263' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:45:53.263' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1042, N'fc91be84-ef25-47cd-aeac-bf8eedc848e8', 19, NULL, N'', CAST(N'2020-05-31T01:48:31.447' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:48:31.447' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1043, N'd98f4160-f330-4514-9c79-f16af99683f1', 20, NULL, N'', CAST(N'2020-05-31T01:49:08.743' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:49:08.743' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1044, N'64e55be3-e20e-4370-a716-7b40e38fe4f8', 21, NULL, N'', CAST(N'2020-05-31T01:49:40.440' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T01:49:40.440' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1045, N'2d222397-66f6-4c3d-973c-8b8a493c37b8', 22, NULL, N'', CAST(N'2020-05-31T02:07:13.710' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:07:13.710' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1046, N'2f163031-9cc8-4e61-b785-66e1c67b7675', 23, NULL, N'', CAST(N'2020-05-31T02:07:54.723' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:07:54.723' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1047, N'686d1195-1278-4d04-bf38-f299d428c1a2', 24, NULL, N'', CAST(N'2020-05-31T02:27:04.197' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:27:04.197' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1048, N'220ebac9-090e-4424-9145-7b746a245581', 16, NULL, N'', CAST(N'2020-05-31T02:29:37.020' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:29:37.020' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1049, N'da16de28-f774-4020-bc4a-5dc689554048', 25, NULL, N'', CAST(N'2020-05-31T02:39:51.623' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:39:51.623' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1050, N'3293506d-2695-4381-a702-d5848d113dfd', 11, NULL, N'', CAST(N'2020-05-31T04:34:59.283' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1051, N'3293506d-2695-4381-a702-d5848d113dfd', 26, NULL, N'', CAST(N'2020-05-31T04:35:32.713' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1052, N'3293506d-2695-4381-a702-d5848d113dfd', 11, NULL, N'', CAST(N'2020-05-31T04:36:26.400' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1053, N'3293506d-2695-4381-a702-d5848d113dfd', 27, NULL, N'', CAST(N'2020-05-31T04:36:52.447' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1054, N'3293506d-2695-4381-a702-d5848d113dfd', 11, 4, N'555555', CAST(N'2020-05-31T04:36:52.450' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1055, N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', 26, NULL, N'', CAST(N'2020-05-31T04:39:21.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T04:39:21.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1056, N'3293506d-2695-4381-a702-d5848d113dfd', 26, NULL, N'', CAST(N'2020-05-31T05:08:52.227' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1057, N'3293506d-2695-4381-a702-d5848d113dfd', 11, 3, N'', CAST(N'2020-05-31T05:09:01.417' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1058, N'3293506d-2695-4381-a702-d5848d113dfd', 28, NULL, N'', CAST(N'2020-05-31T05:09:19.613' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T13:56:19.103' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1059, N'f7660dc8-0f92-4ff9-9e37-42e2fc1d3460', 29, NULL, N'', CAST(N'2020-05-31T05:18:39.590' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:18:39.590' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1060, N'b1a262dc-9d35-4ed3-b293-1b515a10a197', 30, NULL, N'', CAST(N'2020-05-31T05:22:18.673' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:22:18.673' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1061, N'92c22426-b67b-45f0-ad03-b1211b9f2299', 31, NULL, N'', CAST(N'2020-05-31T05:40:35.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:40:35.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1062, N'92c22426-b67b-45f0-ad03-b1211b9f2299', 32, NULL, N'', CAST(N'2020-05-31T05:40:35.973' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:40:35.973' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1063, N'92c22426-b67b-45f0-ad03-b1211b9f2299', 33, NULL, N'', CAST(N'2020-05-31T05:40:35.973' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:40:35.973' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1064, N'77b18b83-cf9f-4c6d-aa3a-a73785dc5954', 34, NULL, N'', CAST(N'2020-05-31T05:56:15.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:56:15.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1065, N'7516b7f5-28e3-45cc-aac4-75a277b26a41', 16, NULL, N'', CAST(N'2020-05-31T05:56:43.187' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:56:43.187' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1066, N'32e943da-c942-4f1d-b4f6-ebc79ec2eab1', 36, NULL, N'??SLE /HEAMOLYTIC ANAMIA FOR LT LS INJ', CAST(N'2020-05-31T06:02:11.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T11:20:37.987' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1067, N'4bad0e75-1bd5-43f5-8d48-a4fc7956c7f1', 38, NULL, N'', CAST(N'2020-05-31T11:51:09.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:51:09.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1068, N'95072bf5-b98b-4052-9802-3cf04722340d', 41, NULL, N'', CAST(N'2020-05-31T12:07:53.120' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:07:53.120' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1069, N'b0205d6e-900b-40c6-9983-467b4869f438', 42, NULL, N'', CAST(N'2020-05-31T12:36:23.427' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:36:23.427' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1070, N'86ab32fe-d683-437d-a2ce-bbfd8b82a907', 43, NULL, N'', CAST(N'2020-05-31T13:00:07.000' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:00:07.000' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1071, N'3f896823-30c9-4ac6-91d3-f4de7c258f9f', 44, NULL, N'', CAST(N'2020-05-31T13:05:24.407' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:05:24.407' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1072, N'ca45dc7a-3573-404a-81d9-ebd2c741154c', 45, NULL, N'', CAST(N'2020-05-31T14:33:31.137' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:33:31.137' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1073, N'4ff1c9a5-8ba0-4112-b5c3-e06a96ee0f06', 33, 4, N'', CAST(N'2020-05-31T18:06:18.780' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T18:06:18.780' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1074, N'4ff1c9a5-8ba0-4112-b5c3-e06a96ee0f06', 27, NULL, N'', CAST(N'2020-05-31T18:06:18.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T18:06:18.817' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1075, N'25c259da-4905-4357-bf5d-fa8c568b0a60', 46, NULL, N'', CAST(N'2020-05-31T18:31:53.047' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:31:53.047' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1076, N'c01ef91b-b3a0-4a37-bd42-b40d3d356d76', 47, NULL, N'', CAST(N'2020-05-31T18:35:28.493' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:35:28.493' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1077, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', 33, NULL, N'', CAST(N'2020-06-01T04:25:46.973' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T04:25:46.973' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1078, N'ec081cb3-80d3-48f8-93fc-d1389d206177', 48, NULL, N'', CAST(N'2020-06-01T09:22:31.950' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:22:31.950' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1079, N'f96c9bda-36ab-4127-baa2-044bd5f07071', 50, NULL, N'', CAST(N'2020-06-01T09:55:54.303' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:55:54.303' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1080, N'4b7eb9b4-d49f-4386-8d2e-5e2ca8ddb4dd', 51, NULL, N'', CAST(N'2020-06-01T10:02:27.707' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:02:27.707' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1081, N'c56f536f-23b5-423e-b907-10e95df2d26f', 52, NULL, N'', CAST(N'2020-06-01T10:12:19.793' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:12:19.793' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1082, N'abb6a4f6-05b3-43da-925b-cb77e33cd778', 53, NULL, N'', CAST(N'2020-06-01T10:14:02.023' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:14:02.023' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1083, N'6d7555fb-182a-4df2-b3cc-bf073740b8ef', 54, NULL, N'', CAST(N'2020-06-02T10:34:25.143' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:34:25.143' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1084, N'6ab6e913-129d-4e31-ae85-acfe8a9b3c34', 55, NULL, N'', CAST(N'2020-06-02T10:36:14.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:36:14.483' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1085, N'bd78dc49-0172-4b65-bf01-e00d80a34ca7', 56, NULL, N'', CAST(N'2020-06-02T10:37:18.557' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:37:18.560' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1086, N'2a1eedf7-30f9-48ed-84da-ca64ded715d8', 57, NULL, N'', CAST(N'2020-06-02T10:38:07.003' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:38:07.003' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1087, N'67637b77-3673-422f-9372-68dc21fafc8b', 58, NULL, N'', CAST(N'2020-06-02T10:40:21.460' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:40:21.460' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1088, N'5c4d0104-4564-49bc-8bf9-154ac9513e1d', 58, NULL, N'', CAST(N'2020-06-02T10:41:36.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:41:36.200' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1089, N'91ce4632-421d-44a9-a9a7-d47c5022d534', 59, NULL, N'', CAST(N'2020-06-02T10:43:24.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:43:24.080' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1090, N'aa36c0b5-91f2-4ee2-998b-84810bee88a2', 16, NULL, N'', CAST(N'2020-06-02T10:44:14.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:44:14.073' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1091, N'8a398df2-e275-4842-9e26-24d071b676c7', 60, NULL, N'', CAST(N'2020-06-02T11:19:14.383' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T11:19:14.383' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1092, N'433c86ca-aba4-4b9e-be11-e19108c48a49', 44, NULL, N'CL W RT B/ ST/ADDICT/??RIETERS', CAST(N'2020-06-03T11:43:04.957' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:43:04.957' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
INSERT [dbo].[PatientDiagnosis] ([Id], [PatientId], [DiagnosisId], [GradeId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1093, N'84ff888b-d2cf-4245-bba0-34754cc3413f', 62, NULL, N'', CAST(N'2020-06-03T11:45:10.413' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:45:10.413' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466')
SET IDENTITY_INSERT [dbo].[PatientDiagnosis] OFF
SET IDENTITY_INSERT [dbo].[PatientPrescriptions] ON 

INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (10, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-02T00:47:23.570' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T00:47:23.570' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (11, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-02T04:27:42.617' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:27:42.617' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (12, N'3293506d-2695-4381-a702-d5848d113dfd', N'', CAST(N'2020-06-02T04:31:24.277' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:31:24.277' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (13, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'', CAST(N'2020-06-02T04:33:31.133' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:33:31.133' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (14, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-02T04:36:05.087' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:36:05.087' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (15, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'', CAST(N'2020-06-02T04:37:15.063' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:37:15.063' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (16, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'', CAST(N'2020-06-02T04:43:06.693' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:43:06.693' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (17, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'', CAST(N'2020-06-02T04:43:29.053' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:43:29.053' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (18, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'', CAST(N'2020-06-02T04:55:44.827' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:55:44.827' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (19, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-02T05:16:55.123' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T05:16:55.123' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 0)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (20, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-02T05:19:42.547' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T05:19:42.547' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (21, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-02T05:20:01.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T05:20:01.943' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 0)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (23, N'3293506d-2695-4381-a702-d5848d113dfd', N'', CAST(N'2020-06-04T14:00:22.680' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-04T14:00:22.680' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (24, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-05T15:34:20.980' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T15:34:20.980' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (25, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-05T15:36:13.573' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T15:36:13.573' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (26, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-05T15:37:00.630' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T15:37:00.630' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (27, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-05T15:41:10.570' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T15:41:10.570' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (28, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-05T15:41:29.067' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T15:41:29.067' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
INSERT [dbo].[PatientPrescriptions] ([Id], [PatientId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsPrint]) VALUES (29, N'81ec9ece-a575-4578-9379-2eb668615999', N'', CAST(N'2020-06-05T15:42:14.867' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T15:42:14.867' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1)
SET IDENTITY_INSERT [dbo].[PatientPrescriptions] OFF
SET IDENTITY_INSERT [dbo].[PatientRays] ON 

INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'3293506d-2695-4381-a702-d5848d113dfd', 14, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-31T05:39:56.563' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:39:56.563' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, N'3293506d-2695-4381-a702-d5848d113dfd', 15, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-31T05:42:38.610' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:42:38.610' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, N'81ec9ece-a575-4578-9379-2eb668615999', 14, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-02T00:48:41.673' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T00:48:41.673' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (9, N'81ec9ece-a575-4578-9379-2eb668615999', 15, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-02T00:48:41.733' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T00:48:41.733' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, N'81ec9ece-a575-4578-9379-2eb668615999', 14, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-02T00:49:54.190' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T00:49:54.190' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', 14, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-02T04:56:36.177' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:56:36.177' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', 14, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-02T04:56:50.290' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T04:56:50.290' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', 15, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, CAST(N'2020-06-02T04:56:50.290' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-03T06:19:28.643' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
INSERT [dbo].[PatientRays] ([Id], [PatientId], [RayId], [RayAreaId], [RequestNote], [IsHasResult], [ResultDate], [ResultText], [ResultGradeId], [ResultNote], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, N'77822725-f7b6-48ee-ab57-4abf4a0f2957', 14, 13, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-06-05T12:09:20.557' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T12:09:20.557' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0')
SET IDENTITY_INSERT [dbo].[PatientRays] OFF
SET IDENTITY_INSERT [dbo].[PatientReferrals] ON 

INSERT [dbo].[PatientReferrals] ([Id], [PatientId], [ReferralToDoctorId], [PatientDiagnosisId], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [IsRead], [ReadOn], [IsApproved], [ApprovedOn], [IsCanceled], [CanceledOn]) VALUES (3, N'81ec9ece-a575-4578-9379-2eb668615999', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', NULL, N'', CAST(N'2020-06-02T00:53:02.090' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-02T00:53:02.090' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', 1, CAST(N'2020-06-02T00:53:39.760' AS DateTime), 0, NULL, 1, CAST(N'2020-06-02T00:53:39.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[PatientReferrals] OFF
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4b41c307-66b6-47b0-b772-0247434b7604', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 21, N'د مصطفي ماهر', 1, 0, CAST(N'2020-05-31T00:16:25.357' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:16:25.357' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005445323', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'f96c9bda-36ab-4127-baa2-044bd5f07071', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 30, N'ايهاب عبدالرحمن', 1, 0, CAST(N'2020-05-31T00:23:14.920' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:23:14.920' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01141981127', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'ae409276-c2b7-4b6a-89a4-05f0738b37ed', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 1, N'د محمد قاسم', 1, 0, CAST(N'2020-05-29T17:33:43.330' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:49:47.227' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01006589509', NULL, NULL, 1, 2, N'طبيب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'2ae800c2-1a6a-4139-b030-08ea5b53165d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 10, N'فضه محمود عبدالمجيد', 1, 0, CAST(N'2020-05-29T22:14:23.063' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:14:23.063' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01222182255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'27862ee3-b14e-4fcd-83f8-0980fd8afc25', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 86, N'محمود سامي', 1, 0, CAST(N'2020-06-01T10:03:47.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:03:47.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005811779', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'eeff1b03-88ea-49ae-ac63-0ea5a3f21d2a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 83, N'فاطمه محمد فوزي', 1, 0, CAST(N'2020-06-01T09:58:17.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:58:17.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01143525596', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'9c295b45-5a38-4834-8ade-0ec739707965', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 7, N'testttt4', 1, 0, CAST(N'2020-05-31T05:45:00.330' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:45:00.330' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'0100000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'a7a677fa-8697-461d-8280-0ff4df94f301', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 29, N'عزه يوسف احمد', 1, 0, CAST(N'2020-05-31T00:22:46.767' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:22:46.767' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01111230943', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'c56f536f-23b5-423e-b907-10e95df2d26f', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 88, N'نجوي عبدالستار', 1, 0, CAST(N'2020-06-01T10:11:55.253' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:11:55.253' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01227394850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'60f2eb17-d2d6-4018-9999-11594ca4214d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 33, N'مها جمال', 1, 0, CAST(N'2020-05-31T00:26:29.107' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:26:29.107' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005888140', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4c0a32a2-6951-497a-886a-11a778997767', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 57, N'امل محمد علي', 1, 0, CAST(N'2020-05-31T12:52:21.580' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:52:21.580' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01025193933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'5c4d0104-4564-49bc-8bf9-154ac9513e1d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 95, N'حمام شلبي حرذ', 1, 0, CAST(N'2020-06-02T10:41:13.690' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:41:13.690' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01225932027', NULL, NULL, 1, NULL, NULL, 4, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'9f028027-15d7-44b3-b5fd-184e6cd817af', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 35, N'المستشار محمد السيد', 1, 0, CAST(N'2020-05-31T00:27:31.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:27:31.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'00000000000', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'3204b985-b1bc-4263-992b-195b2ab926df', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 6, N'هبه كمال اسماعيل', 1, 1, CAST(N'2020-05-29T22:10:31.453' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:46:44.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01113000917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'95a1438b-a872-4bea-8b9f-1a39c369dbfa', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 9, N'احمد السيد احمد', 1, 0, CAST(N'2020-05-29T22:11:57.807' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:11:57.807' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01024827988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'b1a262dc-9d35-4ed3-b293-1b515a10a197', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 41, N'ابو النور محمد ابو النور', 1, 0, CAST(N'2020-05-31T05:20:55.107' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:20:55.107' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01063676731', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'60682fd3-d98d-4d14-9aae-1e84eee558bd', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 31, N'سعيد عبدالرحمن', 1, 0, CAST(N'2020-05-31T00:25:31.570' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:25:31.570' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005152121', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'7b5ae34f-6bef-4b33-943a-1f7fade2ad47', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 1, N'احمد السيد', 1, 0, CAST(N'2020-05-29T17:08:38.423' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T17:08:38.423' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01111111111', NULL, 40, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'132378ec-c259-49a5-997f-225b5398e96d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 24, N'خالد محمد احمد رميح', 1, 0, CAST(N'2020-05-31T00:19:41.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:19:41.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01119998498', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'8a398df2-e275-4842-9e26-24d071b676c7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 98, N'ياسرمحمد عبدالعال', 1, 0, CAST(N'2020-06-02T11:17:52.210' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T11:17:52.210' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01006600200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'beac1c14-256b-46f1-8582-268a6e85cc6b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 99, N'ابرهيم عباس', 1, 0, CAST(N'2020-06-03T11:38:22.933' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T11:38:22.933' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01122129775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4716b8bd-94c0-4c4a-ae21-278cecf390bb', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 8, N'بسمه سيد شلتوت', 1, 0, CAST(N'2020-05-29T22:11:37.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:11:37.153' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01065312016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'6d1600b5-96e9-451b-8d6a-2a5fd1cbbbb0', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 40, N'تغريد ابراهيم', 1, 0, CAST(N'2020-05-31T05:07:16.003' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:07:16.003' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01062506685', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'd0e0664a-e25e-43ae-a4af-2e82ade25fe4', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 34, N'ابراهيم الشتيحي', 1, 0, CAST(N'2020-05-31T00:26:49.873' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:26:49.873' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01065035309', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'81ec9ece-a575-4578-9379-2eb668615999', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 14, N'حميده عبدالرازق', 1, 0, CAST(N'2020-06-01T23:53:56.643' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-05T11:05:39.080' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01155176665', N'', NULL, NULL, NULL, NULL, 3, 18, N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'84ff888b-d2cf-4245-bba0-34754cc3413f', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 42, N'ياسر محمد عبدالعال', 1, 0, CAST(N'2020-05-31T05:23:50.433' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:23:50.433' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01158328497', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'62258188-c2bd-4355-802b-35c175c980d6', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 53, N'حاتم سعيد', 1, 0, CAST(N'2020-05-31T12:09:54.287' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:09:54.287' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'00000000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'8d451fb1-5c4c-4b0c-a43d-35e888b46075', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 3, N'شيماء عبدالفتاح محمد', 1, 0, CAST(N'2020-05-29T21:41:09.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T21:41:09.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01000201004', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'8184d7fe-c769-4f83-aca0-369cc3382a1d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 50, N'ترحيب عطيه محمد', 1, 0, CAST(N'2020-05-31T11:45:24.920' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:45:24.920' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01063549252', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'1caeb0bc-cd2f-41b3-9502-36dba52cc671', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 90, N'زينب رسيم الشافعي', 1, 0, CAST(N'2020-06-01T10:19:14.337' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:19:14.337' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'00000000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'0cfbd0ff-c934-4b79-8fca-37a75ab6b3c5', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 69, N'ايمان عبدالمنعم', 1, 0, CAST(N'2020-05-31T15:10:01.147' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:10:01.147' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01010055370', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'8fd06061-da6f-4e85-a634-37c0db0ebf67', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 46, N'رشا عنتر', 1, 0, CAST(N'2020-05-31T05:32:46.237' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:32:46.237' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01288080705', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'95072bf5-b98b-4052-9802-3cf04722340d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 23, N'فتحيه يوسف جاب الله', 1, 0, CAST(N'2020-05-31T00:17:28.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:17:28.757' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01118027576', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'b5190cc5-32d1-4f91-a614-42e1d01ae1b3', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 9, N'محمود السيد', 1, 0, CAST(N'2020-05-31T17:06:36.097' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T17:06:36.097' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01255654886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'f7660dc8-0f92-4ff9-9e37-42e2fc1d3460', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 39, N'عبير احمد محمد حسن', 1, 0, CAST(N'2020-05-31T02:40:42.457' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:40:42.457' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01000373937', NULL, NULL, 0, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'701b11e3-0032-46e0-a9db-45f687796874', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 56, N'محمود نور بكري', 1, 0, CAST(N'2020-05-31T12:51:14.330' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:51:14.330' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01207409499', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'90a1d3d5-dda9-420e-af77-4612dfec043a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 32, N'رنا اشرف', 1, 0, CAST(N'2020-05-31T00:25:59.970' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:25:59.970' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005888140', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'b0205d6e-900b-40c6-9983-467b4869f438', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 54, N'هاجر مسعد', 1, 0, CAST(N'2020-05-31T12:13:26.957' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:13:26.957' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01102534546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'd054ffa0-bd0b-4bc5-b511-46ff0a443570', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 4, N'مني عباس', 1, 0, CAST(N'2020-05-29T22:01:47.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:01:47.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01000201004', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'77822725-f7b6-48ee-ab57-4abf4a0f2957', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 8, N'test2000', 1, 0, CAST(N'2020-05-31T05:57:27.707' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T05:57:27.707' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01654846460', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'9d9fded6-cbd0-4905-8d87-4c949f8efa5c', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 62, N'منال عبداللاه', 1, 0, CAST(N'2020-05-31T14:17:15.467' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:17:15.467' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'000000000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'894403a6-3062-4e48-ba40-50c051fb1e5e', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 49, N'زينب نسيم الشافعي', 1, 0, CAST(N'2020-05-31T11:42:09.593' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:42:09.593' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'0000000000', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'da16de28-f774-4020-bc4a-5dc689554048', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 38, N'احمد ابراهيم عبدالغفار', 1, 0, CAST(N'2020-05-31T02:37:01.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:37:01.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01224007332', NULL, NULL, 1, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'327bf17f-9997-4d91-a5e2-5dcdcf5953a5', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 100, N'ناجح الداخلي', 1, 0, CAST(N'2020-06-03T12:27:22.580' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T12:27:22.580' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'1155197141', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'7b25632c-f72a-4033-b3f9-5e1676c9220a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 13, N'عبير محمود صالح', 1, 0, CAST(N'2020-05-31T00:10:34.633' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:10:34.637' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01066651360', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4b7eb9b4-d49f-4386-8d2e-5e2ca8ddb4dd', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 84, N'اسماعيل فواد', 1, 0, CAST(N'2020-06-01T09:59:48.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:59:48.713' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005050800', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'b071c775-565d-490e-86ea-668509b785e0', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 49, N'هبه كمال اسماعيل', 1, 0, CAST(N'2020-05-31T11:47:33.490' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:47:33.490' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01113000917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'2f163031-9cc8-4e61-b785-66e1c67b7675', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 18, N'احمد بخيت محمد', 1, 0, CAST(N'2020-05-31T00:13:26.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:13:26.797' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01117918413', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'81e87c34-8d13-4456-8d97-6871dbccfe89', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 48, N'ليلي حمدي محمود الطوبجي', 1, 0, CAST(N'2020-05-31T11:10:26.677' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:10:26.677' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01003534609', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'67637b77-3673-422f-9372-68dc21fafc8b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 94, N'فاطمه صديق السعدني', 1, 0, CAST(N'2020-06-02T10:39:07.310' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:39:07.310' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01277942935', NULL, NULL, NULL, NULL, NULL, 4, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'ab6ee195-ba9e-4fd5-870f-703e4d1e61e5', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 52, N'احمد طلبه', 1, 0, CAST(N'2020-05-31T12:09:38.417' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-03T10:03:43.140' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', N'0000000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'd958878c-a513-4b2e-8bf3-71bf062b61e6', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 7, N'اسماء محمود محمد', 1, 0, CAST(N'2020-05-29T22:11:02.960' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:11:02.960' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01118657177', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'930df7b0-5906-44e4-a648-71bfc7286ad1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 87, N'شيماء حسين', 1, 0, CAST(N'2020-06-01T10:09:05.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:09:05.530' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01116161809', NULL, NULL, NULL, NULL, NULL, 20, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'7516b7f5-28e3-45cc-aac4-75a277b26a41', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 45, N'داليا صبحي', 1, 0, CAST(N'2020-05-31T05:31:48.337' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:31:48.337' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01274553201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'64e55be3-e20e-4370-a716-7b40e38fe4f8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 25, N'ولاء هاشم', 1, 0, CAST(N'2020-05-31T00:20:30.257' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:20:30.257' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01094327120', NULL, NULL, 0, NULL, NULL, 4, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'220ebac9-090e-4424-9145-7b746a245581', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 37, N'مصطفي محمد عبدالحليم', 1, 0, CAST(N'2020-05-31T02:28:58.150' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:28:58.150' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01066501107', NULL, NULL, 1, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'27945e2f-033c-4c1e-8300-7c5773a8936a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 77, N'شريف شيحا', 1, 0, CAST(N'2020-06-01T09:26:30.537' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:26:30.537' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01006021066', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'aa36c0b5-91f2-4ee2-998b-84810bee88a2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 97, N'فاطمه مجدي', 1, 0, CAST(N'2020-06-02T10:43:57.680' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:43:57.680' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01091393006', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'08a703db-c53f-4ec7-b2d6-84b1f941d2f7', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 5, N'testttt2', 1, 0, CAST(N'2020-05-29T18:57:47.870' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T18:57:47.870' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01255654886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'7a6af482-5f03-43d7-be03-873422ae97b9', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 1, N'احمد فرني', 1, 1, CAST(N'2020-05-29T17:28:31.787' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T17:28:48.637' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01000201004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'08e25767-2e48-4205-8a60-88d226c92fb2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 2, N'رجاء عبدالفتاح', 1, 0, CAST(N'2020-05-29T17:34:45.050' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T17:34:45.050' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01008014575', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'0aec7798-1b5b-49c7-9f21-88f8c71f976b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 5, N'عبور فرج', 1, 1, CAST(N'2020-05-29T22:09:24.640' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:46:30.100' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01003008003', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'2d222397-66f6-4c3d-973c-8b8a493c37b8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 17, N'روان ناصر محمد', 1, 0, CAST(N'2020-05-31T00:13:04.027' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:13:04.027' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01146094312', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'0caf0bdd-6160-4a36-bab1-8e0ab6d8f1c7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 80, N'وايل السعيد المغازي', 1, 0, CAST(N'2020-06-01T09:28:38.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:30:08.987' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01008758888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'f60e979b-5ac0-439b-ba21-95a1c3965ee0', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 82, N'خالد شكري', 1, 0, CAST(N'2020-06-01T09:57:43.430' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:57:43.430' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01006367171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'5adfe2b5-c761-4222-8f85-98e3f818d066', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 61, N'سمر مصطفي كمال', 1, 0, CAST(N'2020-05-31T13:06:29.803' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:12:46.627' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005149635', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'aeb0b926-2535-40b1-b3c4-9c5b22d1663b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 19, N'زهره امين', 1, 0, CAST(N'2020-05-31T00:13:56.370' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:13:56.370' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01020404545', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'd691935b-9697-4a89-8519-a0f04fb4d0f8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 22, N'سهير محمود علي', 1, 0, CAST(N'2020-05-31T00:17:01.187' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:17:01.187' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01007409718', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'614747d5-9e7b-48fe-9f62-a2bd8969dfb2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 75, N'زينب عزت ابراهيم', 1, 0, CAST(N'2020-06-01T09:24:18.777' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:24:18.777' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005151910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4fcd174d-8463-40bc-ae32-a3ad8c13fbbf', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 12, N'عطيات عبدالصادق', 1, 0, CAST(N'2020-05-29T22:15:00.230' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:15:00.230' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01113166056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4bad0e75-1bd5-43f5-8d48-a4fc7956c7f1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 47, N'احمد هيكل', 1, 0, CAST(N'2020-05-31T11:07:26.577' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:07:26.577' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01156888739', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'77b18b83-cf9f-4c6d-aa3a-a73785dc5954', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 44, N'منال حسن احمد', 1, 0, CAST(N'2020-05-31T05:27:46.077' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:27:46.077' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01009922868', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'bbd82fb0-b888-4a1e-a90a-a9822555e3ee', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 20, N'سكينه السيد ثابت', 1, 0, CAST(N'2020-05-31T00:14:45.240' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:14:45.240' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01117774751', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'6ab6e913-129d-4e31-ae85-acfe8a9b3c34', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 92, N'محمود حسين علي', 1, 0, CAST(N'2020-06-02T10:35:53.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:35:53.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01000683200', NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'92c22426-b67b-45f0-ad03-b1211b9f2299', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 4, N'testttt', 1, 0, CAST(N'2020-05-29T18:56:17.397' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T18:56:17.397' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01255654886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'e592c3ee-633b-4d89-886d-b214ad566319', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 14, N'اماني عبدالعظيم', 1, 0, CAST(N'2020-05-31T00:11:40.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:11:40.350' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01020046498', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'49a270c2-97c8-4119-ac82-b2bd21cd7810', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 11, N'test 999999', 1, 0, CAST(N'2020-05-31T18:23:26.993' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T18:23:26.993' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'99999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'c01ef91b-b3a0-4a37-bd42-b40d3d356d76', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 72, N'عبدالرحمن ايمن', 1, 0, CAST(N'2020-05-31T18:35:06.077' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:35:06.077' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01068441925', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'fcf79f3d-4cfb-4f81-b692-b5bd8d4abecf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 13, N'محمود حسين علي', 1, 0, CAST(N'2020-06-01T23:52:49.273' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T23:52:49.273' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01000683200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'd0d30f1f-39b4-4d77-a42c-b8490d9cc427', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 79, N'عزه عبدالحميد سليم', 1, 0, CAST(N'2020-06-01T09:28:07.223' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:28:07.223' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01110063806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'09d4410f-30a0-41ff-9b93-b9a0f45d8562', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 68, N'نهله فاروق', 1, 0, CAST(N'2020-05-31T15:08:51.127' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:08:51.127' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01144448919', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'86ab32fe-d683-437d-a2ce-bbfd8b82a907', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 58, N'عفاف عبدالفتاح', 1, 0, CAST(N'2020-05-31T12:53:59.630' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:53:59.633' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01119986223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'6d7555fb-182a-4df2-b3cc-bf073740b8ef', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 91, N'ساميه حلمي', 1, 0, CAST(N'2020-06-01T22:37:51.350' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', CAST(N'2020-06-01T22:37:51.350' AS DateTime), N'ffa7c677-0635-4fd4-af93-08d803de1e84', N'01223122604', NULL, 55, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'fc91be84-ef25-47cd-aeac-bf8eedc848e8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 28, N'محمد البابلي', 1, 0, CAST(N'2020-05-31T00:22:26.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:22:26.517' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01111134322', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'c4be2a14-e698-4e7b-a9dc-c4cb8f3be003', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 15, N'نهله فاروق', 1, 0, CAST(N'2020-05-31T00:12:12.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:12:12.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01144448919', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'2a1eedf7-30f9-48ed-84da-ca64ded715d8', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 93, N'محمد طلعت المدني', 1, 0, CAST(N'2020-06-02T10:37:52.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:37:52.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01063023546', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'abb6a4f6-05b3-43da-925b-cb77e33cd778', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 89, N'يسرا عبدالقادر عليوه', 1, 0, CAST(N'2020-06-01T10:13:20.697' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:13:20.697' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01060881116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'ec081cb3-80d3-48f8-93fc-d1389d206177', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 66, N'حمد عيسي', 1, 0, CAST(N'2020-05-31T15:03:10.983' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:03:10.983' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01099549403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'91ce4632-421d-44a9-a9a7-d47c5022d534', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 96, N'ايهاب عبدربه', 1, 0, CAST(N'2020-06-02T10:43:04.873' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-02T10:43:04.873' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01018495918', NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'3293506d-2695-4381-a702-d5848d113dfd', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 6, N'testttt3', 1, 0, CAST(N'2020-05-29T18:59:49.177' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T18:59:49.177' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01255654886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4b7378d1-1dee-427b-8e54-d9519f2de26c', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 65, N'نجاه ابوبكرعلي', 1, 0, CAST(N'2020-05-31T15:01:47.413' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:01:47.413' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01111733493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'20e702c8-d36c-415f-b365-db54a5078df7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 70, N'ابراهيم سيف', 1, 0, CAST(N'2020-05-31T18:28:24.647' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:28:24.647' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01065525517', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'3c8b38ad-2b70-49f8-ab8f-dc73dcfcdf70', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 3, N'احمد قرني السيد', 1, 0, CAST(N'2020-05-29T17:12:14.633' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T21:34:12.230' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'01222222222', NULL, 40, 1, 2, N'محاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'bd78dc49-0172-4b65-bf01-e00d80a34ca7', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 74, N'حميده عبدالرازق', 1, 0, CAST(N'2020-06-01T09:23:18.807' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:23:18.807' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01155176665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'4ff1c9a5-8ba0-4112-b5c3-e06a96ee0f06', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 10, N'هناء محمود', 1, 0, CAST(N'2020-05-31T17:09:40.913' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-31T17:09:40.913' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'01255654886', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'433c86ca-aba4-4b9e-be11-e19108c48a49', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 73, N'صبري رمضان حفني', 1, 0, CAST(N'2020-05-31T21:48:59.863' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T21:48:59.863' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01149841574', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'2586fd96-6eb0-4b9b-b920-e20214e76eaf', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 2, N'احمد قرني', 1, 0, CAST(N'2020-05-29T17:11:57.917' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-05-29T21:33:30.017' AS DateTime), N'3abe37b3-65db-4f46-005b-08d803cd4ed0', N'01222222222', NULL, 40, 1, 2, N'محاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'e5843740-4b60-4ec1-b14a-e36ff868ab1b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 63, N'سماح عبدالعاطي', 1, 0, CAST(N'2020-05-31T14:41:08.370' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:41:08.370' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01150851737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'1af73ecf-cb07-4a2a-86e9-e37d4d220bc1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 50, N'عبور فرج', 1, 0, CAST(N'2020-05-31T11:48:03.480' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T11:48:03.480' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01003008003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'0c18851a-b8a7-47dc-a3c8-e43af6eaee4a', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 64, N'د نعمه شوكت', 1, 0, CAST(N'2020-05-31T14:44:12.420' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T14:44:12.420' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01003029766', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'fe7ec34e-9565-49b5-a361-e9cd00bef5fb', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 16, N'مريم حامد', 1, 0, CAST(N'2020-05-31T00:12:41.470' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T16:04:56.707' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01004241262', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'32e943da-c942-4f1d-b4f6-ebc79ec2eab1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 43, N'ناديه عبدالوهاب', 1, 0, CAST(N'2020-05-31T05:25:29.180' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T05:25:29.180' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01097552938', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'ca45dc7a-3573-404a-81d9-ebd2c741154c', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 51, N'اسماء محمد يس', 1, 0, CAST(N'2020-05-31T12:03:26.583' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:03:26.583' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01066692072', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'411fc261-f91b-4040-a5fc-ec85b682dd35', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 76, N'حنان محمد عامر', 1, 0, CAST(N'2020-06-01T09:25:49.613' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:25:49.613' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01005151910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'40077b97-768c-4ddb-8788-f0c1c530e8de', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 78, N'صباح بشير طه', 1, 0, CAST(N'2020-06-01T09:27:35.703' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:27:35.703' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01151787481', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'd98f4160-f330-4514-9c79-f16af99683f1', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 27, N'ايمان توفيق ادم', 1, 0, CAST(N'2020-05-31T00:21:35.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:21:35.550' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01111134322', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'686d1195-1278-4d04-bf38-f299d428c1a2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 36, N'مصطفي عبدالله هاشم', 1, 0, CAST(N'2020-05-31T02:20:34.030' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T02:26:22.610' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01066888895', NULL, NULL, 1, NULL, NULL, 12, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'be6b1333-6c5d-42f8-881d-f2a1a231d8af', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 67, N'مني احمد محمود', 1, 0, CAST(N'2020-05-31T15:05:59.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T15:05:59.733' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01154970109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'3f896823-30c9-4ac6-91d3-f4de7c258f9f', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 60, N'رضا عبدالعزيز عامر', 1, 0, CAST(N'2020-05-31T13:04:58.660' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:04:58.660' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01090379734', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'045fc041-1021-40ee-a1b8-f5662457e0ac', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 59, N'ايمان ابراهيم محمود', 1, 0, CAST(N'2020-05-31T13:01:48.843' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T13:01:48.843' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01151906260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'0b388e6b-b71e-49f3-b1e9-f5e4348a828b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 55, N'عبدالرحمن سعيد محمد', 1, 0, CAST(N'2020-05-31T12:48:47.283' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T12:48:47.283' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01207409499', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'48e1d430-8c2c-47e4-b92d-f655926057b2', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 26, N'احمد محمود مرزوق', 1, 0, CAST(N'2020-05-31T00:21:03.740' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T00:21:03.740' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01008834318', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'2f354613-2a5f-4f0e-a86f-f9597b0f94de', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 11, N'زينب ابراهيم امام', 1, 0, CAST(N'2020-05-29T22:14:41.013' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-29T22:14:41.013' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01110093610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'e2752548-daba-430f-86d6-fa18bd127857', N'1ecb5391-6990-4935-bdbd-571c05a09b69', N'bf2732cb-11ca-4228-a90e-1fcecb59b88b', 12, N'اختبار المتبقي', 1, 0, CAST(N'2020-06-01T13:15:00.037' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', CAST(N'2020-06-01T13:15:00.040' AS DateTime), N'184789fe-b18a-4ce2-005a-08d803cd4ed0', N'00000000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'25c259da-4905-4357-bf5d-fa8c568b0a60', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 71, N'وداد محمد', 1, 0, CAST(N'2020-05-31T18:31:28.123' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-05-31T18:31:28.123' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'0100064151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'32b162bb-712a-4d65-8d7b-fa9368ed5e4b', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 81, N'خليل البيومي', 1, 0, CAST(N'2020-06-01T09:57:11.510' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T09:57:11.510' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01227922265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patients] ([Id], [DoctorId], [ClinicId], [SeqNo], [FullName], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Phone], [Phone2], [Age], [Gender], [SocialStatusId], [Career], [GovernorateId], [CityId], [Note], [Children], [PrevMarriages], [PrevMarriagesPartner], [TreatmentHistory], [FamilyHistory], [Weight], [Length], [BodyMass], [BloodPressureId], [Temperature]) VALUES (N'475e9247-817e-4061-8a8a-ff93e3753c7d', N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', N'914870cc-2434-4349-86cb-92421f7cdd18', 85, N'د عمرو مصطفي', 1, 0, CAST(N'2020-06-01T10:02:57.087' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', CAST(N'2020-06-01T10:02:57.087' AS DateTime), N'66e2743a-7556-4369-1878-08d803d86466', N'01001020436', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Plans] ON 

INSERT [dbo].[Plans] ([Id], [Title], [Description], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [RenewalTypeId], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (1, N'الباقة الصغيرة', NULL, 1, 0, CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(600.00 AS Decimal(18, 2)), 1, CAST(200.00 AS Decimal(18, 2)), NULL, 30, 3, 20, 500, 5)
INSERT [dbo].[Plans] ([Id], [Title], [Description], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [RenewalTypeId], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (2, N'الباقة المتوسطة', NULL, 1, 0, CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(3000.00 AS Decimal(18, 2)), 1, CAST(1000.00 AS Decimal(18, 2)), NULL, 30, 10, 500, 1000, 10)
INSERT [dbo].[Plans] ([Id], [Title], [Description], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [RenewalTypeId], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (3, N'الباقة الكبيرة', NULL, 1, 0, CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(N'2020-04-18T14:06:23.817' AS DateTime), N'83dc6c4e-da30-4010-8eb4-2d835bc6edad', CAST(9000.00 AS Decimal(18, 2)), 1, CAST(3000.00 AS Decimal(18, 2)), NULL, 30, 100, 2000, 10000, 20)
SET IDENTITY_INSERT [dbo].[Plans] OFF
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (10, 1002, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (10, 1003, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (10, 2010, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (11, 1002, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (11, 1003, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (11, 2010, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (12, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (13, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (14, 1002, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (14, 1003, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (14, 2010, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (15, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (16, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (17, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (18, 2, 1, NULL, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (19, 1, 1, 2, 1, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (20, 1, 1, 2, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (20, 1002, 2, 2, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (21, 1003, 1, 1, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (23, 2, 1, 2, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (23, 1003, 3, 2, NULL, NULL)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (24, 1002, 2, 2, 4, 2)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (24, 1003, 2, NULL, NULL, 1)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (24, 2010, NULL, NULL, NULL, 3)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (25, 1, 1, 1, 5, 1)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (26, 1, 2, 2, 4, 1)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (27, 1003, 1, 1, NULL, 2)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (28, 1, 2, 2, 4, 1)
INSERT [dbo].[PrescriptionMedicines] ([PrescriptionId], [MedicineId], [DoseId], [TimingId], [PeriodId], [QuantityId]) VALUES (29, 1, 2, 2, 4, 1)
SET IDENTITY_INSERT [dbo].[SubscriptionPayments] ON 

INSERT [dbo].[SubscriptionPayments] ([Id], [SubscriptionId], [Paid], [NextPaymentDate], [Note], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, 8, CAST(3000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2020-05-29T16:00:44.997' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T16:00:45.000' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0')
SET IDENTITY_INSERT [dbo].[SubscriptionPayments] OFF
SET IDENTITY_INSERT [dbo].[Subscriptions] ON 

INSERT [dbo].[Subscriptions] ([Id], [SubscriberId], [SubscriberTypeId], [PlanId], [SubscriptionTypeId], [StartDate], [EndDate], [Note], [IsActive], [IsDeleted], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [SignUpFee], [AnnualRenewalFee], [MonthlyRenewalFee], [GracePeriodDays], [MaxUsers], [MaxBookingsMonthly], [MaxFilesMonthlyMB], [MaxFileSizeMB]) VALUES (8, N'3ee3d945-bc14-4562-aec9-d20eb3fa52b1', 1, 2, 1, CAST(N'2020-05-29' AS Date), CAST(N'2021-05-29' AS Date), NULL, 1, 0, CAST(N'2020-05-29T16:00:44.927' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(N'2020-05-29T16:00:44.927' AS DateTime), N'e47d02aa-7271-4dc2-97b2-686dde3286a0', CAST(3000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL, 30, 10, 500, 1000, 10)
SET IDENTITY_INSERT [dbo].[Subscriptions] OFF
SET IDENTITY_INSERT [dbo].[SysAnalysisFileTypesValues] ON 

INSERT [dbo].[SysAnalysisFileTypesValues] ([Id], [Value], [Text]) VALUES (1, N'ملف التحليل', N'ملف التحليل')
SET IDENTITY_INSERT [dbo].[SysAnalysisFileTypesValues] OFF
SET IDENTITY_INSERT [dbo].[SysBloodPressureValues] ON 

INSERT [dbo].[SysBloodPressureValues] ([Id], [Value], [Text]) VALUES (1, N'Hypotension', N'Hypotension')
INSERT [dbo].[SysBloodPressureValues] ([Id], [Value], [Text]) VALUES (2, N'Normal', N'Normal')
INSERT [dbo].[SysBloodPressureValues] ([Id], [Value], [Text]) VALUES (3, N'Hypertension', N'Hypertension')
SET IDENTITY_INSERT [dbo].[SysBloodPressureValues] OFF
SET IDENTITY_INSERT [dbo].[SysCitiesValues] ON 

INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (1, 1, N'القاهره', N'Cairo')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (2, 2, N'الجيزة', N'Giza')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (3, 2, N'السادس من أكتوبر', N'Sixth of October')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (4, 2, N'الشيخ زايد', N'Cheikh Zayed')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (5, 2, N'الحوامدية', N'Hawamdiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (6, 2, N'البدرشين', N'Al Badrasheen')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (7, 2, N'الصف', N'Saf')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (8, 2, N'أطفيح', N'Atfih')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (9, 2, N'العياط', N'Al Ayat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (10, 2, N'الباويطي', N'Al-Bawaiti')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (11, 2, N'منشأة القناطر', N'ManshiyetAl Qanater')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (12, 2, N'أوسيم', N'Oaseem')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (13, 2, N'كرداسة', N'Kerdasa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (14, 2, N'أبو النمرس', N'Abu Nomros')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (15, 2, N'كفر غطاطي', N'Kafr Ghati')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (16, 2, N'منشأة البكاري', N'Manshiyet Al Bakari')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (17, 3, N'الأسكندرية', N'Alexandria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (18, 3, N'برج العرب', N'Burj Al Arab')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (19, 3, N'برج العرب الجديدة', N'New Burj Al Arab')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (20, 12, N'بنها', N'Banha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (21, 12, N'قليوب', N'Qalyub')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (22, 12, N'شبرا الخيمة', N'Shubra Al Khaimah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (23, 12, N'القناطر الخيرية', N'Al Qanater Charity')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (24, 12, N'الخانكة', N'Khanka')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (25, 12, N'كفر شكر', N'Kafr Shukr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (26, 12, N'طوخ', N'Tukh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (27, 12, N'قها', N'Qaha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (28, 12, N'العبور', N'Obour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (29, 12, N'الخصوص', N'Khosous')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (30, 12, N'شبين القناطر', N'Shibin Al Qanater')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (31, 6, N'دمنهور', N'Damanhour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (32, 6, N'كفر الدوار', N'Kafr El Dawar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (33, 6, N'رشيد', N'Rashid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (34, 6, N'إدكو', N'Edco')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (35, 6, N'أبو المطامير', N'Abu al-Matamir')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (36, 6, N'أبو حمص', N'Abu Homs')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (37, 6, N'الدلنجات', N'Delengat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (38, 6, N'المحمودية', N'Mahmoudiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (39, 6, N'الرحمانية', N'Rahmaniyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (40, 6, N'إيتاي البارود', N'Itai Baroud')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (41, 6, N'حوش عيسى', N'Housh Eissa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (42, 6, N'شبراخيت', N'Shubrakhit')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (43, 6, N'كوم حمادة', N'Kom Hamada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (44, 6, N'بدر', N'Badr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (45, 6, N'وادي النطرون', N'Wadi Natrun')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (46, 6, N'النوبارية الجديدة', N'New Nubaria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (47, 23, N'مرسى مطروح', N'Marsa Matrouh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (48, 23, N'الحمام', N'El Hamam')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (49, 23, N'العلمين', N'Alamein')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (50, 23, N'الضبعة', N'Dabaa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (51, 23, N'النجيلة', N'Al-Nagila')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (52, 23, N'سيدي براني', N'Sidi Brani')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (53, 23, N'السلوم', N'Salloum')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (54, 23, N'سيوة', N'Siwa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (55, 19, N'دمياط', N'Damietta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (56, 19, N'دمياط الجديدة', N'New Damietta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (57, 19, N'رأس البر', N'Ras El Bar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (58, 19, N'فارسكور', N'Faraskour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (59, 19, N'الزرقا', N'Zarqa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (60, 19, N'السرو', N'alsaru')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (61, 19, N'الروضة', N'alruwda')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (62, 19, N'كفر البطيخ', N'Kafr El-Batikh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (63, 19, N'عزبة البرج', N'Azbet Al Burg')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (64, 19, N'ميت أبو غالب', N'Meet Abou Ghalib')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (65, 19, N'كفر سعد', N'Kafr Saad')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (66, 4, N'المنصورة', N'Mansoura')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (67, 4, N'طلخا', N'Talkha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (68, 4, N'ميت غمر', N'Mitt Ghamr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (69, 4, N'دكرنس', N'Dekernes')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (70, 4, N'أجا', N'Aga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (71, 4, N'منية النصر', N'Menia El Nasr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (72, 4, N'السنبلاوين', N'Sinbillawin')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (73, 4, N'الكردي', N'El Kurdi')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (74, 4, N'بني عبيد', N'Bani Ubaid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (75, 4, N'المنزلة', N'Al Manzala')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (76, 4, N'تمي الأمديد', N'tami alamdid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (77, 4, N'الجمالية', N'aljamalia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (78, 4, N'شربين', N'Sherbin')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (79, 4, N'المطرية', N'Mataria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (80, 4, N'بلقاس', N'Belqas')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (81, 4, N'ميت سلسيل', N'Meet Salsil')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (82, 4, N'جمصة', N'Gamasa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (83, 4, N'محلة دمنة', N'Mahalat Damana')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (84, 4, N'نبروه', N'Nabroh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (85, 22, N'كفر الشيخ', N'Kafr El Sheikh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (86, 22, N'دسوق', N'Desouq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (87, 22, N'فوه', N'Fooh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (88, 22, N'مطوبس', N'Metobas')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (89, 22, N'برج البرلس', N'Burg Al Burullus')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (90, 22, N'بلطيم', N'Baltim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (91, 22, N'مصيف بلطيم', N'Masief Baltim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (92, 22, N'الحامول', N'Hamol')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (93, 22, N'بيلا', N'Bella')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (94, 22, N'الرياض', N'Riyadh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (95, 22, N'سيدي سالم', N'Sidi Salm')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (96, 22, N'قلين', N'Qellen')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (97, 22, N'سيدي غازي', N'Sidi Ghazi')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (98, 8, N'طنطا', N'Tanta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (99, 8, N'المحلة الكبرى', N'Al Mahalla Al Kobra')
GO
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (100, 8, N'كفر الزيات', N'Kafr El Zayat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (101, 8, N'زفتى', N'Zefta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (102, 8, N'السنطة', N'El Santa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (103, 8, N'قطور', N'Qutour')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (104, 8, N'بسيون', N'Basion')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (105, 8, N'سمنود', N'Samannoud')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (106, 10, N'شبين الكوم', N'Shbeen El Koom')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (107, 10, N'مدينة السادات', N'Sadat City')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (108, 10, N'منوف', N'Menouf')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (109, 10, N'سرس الليان', N'Sars El-Layan')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (110, 10, N'أشمون', N'Ashmon')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (111, 10, N'الباجور', N'Al Bagor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (112, 10, N'قويسنا', N'Quesna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (113, 10, N'بركة السبع', N'Berkat El Saba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (114, 10, N'تلا', N'Tala')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (115, 10, N'الشهداء', N'Al Shohada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (116, 20, N'الزقازيق', N'Zagazig')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (117, 20, N'العاشر من رمضان', N'Al Ashr Men Ramadan')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (118, 20, N'منيا القمح', N'Minya Al Qamh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (119, 20, N'بلبيس', N'Belbeis')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (120, 20, N'مشتول السوق', N'Mashtoul El Souq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (121, 20, N'القنايات', N'Qenaiat')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (122, 20, N'أبو حماد', N'Abu Hammad')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (123, 20, N'القرين', N'El Qurain')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (124, 20, N'ههيا', N'Hehia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (125, 20, N'أبو كبير', N'Abu Kabir')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (126, 20, N'فاقوس', N'Faccus')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (127, 20, N'الصالحية الجديدة', N'El Salihia El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (128, 20, N'الإبراهيمية', N'Al Ibrahimiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (129, 20, N'ديرب نجم', N'Deirb Negm')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (130, 20, N'كفر صقر', N'Kafr Saqr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (131, 20, N'أولاد صقر', N'Awlad Saqr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (132, 20, N'الحسينية', N'Husseiniya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (133, 20, N'صان الحجر القبلية', N'san alhajar alqablia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (134, 20, N'منشأة أبو عمر', N'Manshayat Abu Omar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (135, 18, N'بورسعيد', N'PorSaid')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (136, 18, N'بورفؤاد', N'PorFouad')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (137, 9, N'الإسماعيلية', N'Ismailia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (138, 9, N'فايد', N'Fayed')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (139, 9, N'القنطرة شرق', N'Qantara Sharq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (140, 9, N'القنطرة غرب', N'Qantara Gharb')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (141, 9, N'التل الكبير', N'El Tal El Kabier')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (142, 9, N'أبو صوير', N'Abu Sawir')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (143, 9, N'القصاصين الجديدة', N'Kasasien El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (144, 14, N'السويس', N'Suez')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (145, 26, N'العريش', N'Arish')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (146, 26, N'نخل', N'Nakhl')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (147, 26, N'رفح', N'Rafah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (148, 26, N'بئر العبد', N'Bir al-Abed')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (149, 26, N'الحسنة', N'Al Hasana')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (150, 21, N'الطور', N'Al Toor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (151, 21, N'شرم الشيخ', N'Sharm El-Shaikh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (152, 21, N'دهب', N'Dahab')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (153, 21, N'نويبع', N'Nuweiba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (154, 21, N'طابا', N'Taba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (155, 21, N'سانت كاترين', N'Saint Catherine')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (156, 21, N'أبو رديس', N'Abu Redis')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (157, 21, N'أبو زنيمة', N'Abu Zenaima')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (158, 21, N'رأس سدر', N'Ras Sidr')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (159, 17, N'بني سويف', N'Bani Sweif')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (160, 17, N'بني سويف الجديدة', N'Beni Suef El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (161, 17, N'الواسطى', N'Al Wasta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (162, 17, N'ناصر', N'Naser')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (163, 17, N'إهناسيا', N'Ehnasia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (164, 17, N'ببا', N'beba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (165, 17, N'الفشن', N'Fashn')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (166, 17, N'سمسطا', N'Somasta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (167, 7, N'الفيوم', N'Fayoum')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (168, 7, N'الفيوم الجديدة', N'Fayoum El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (169, 7, N'طامية', N'Tamiya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (170, 7, N'سنورس', N'Snores')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (171, 7, N'إطسا', N'Etsa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (172, 7, N'إبشواي', N'Epschway')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (173, 7, N'يوسف الصديق', N'Yusuf El Sediaq')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (174, 11, N'المنيا', N'Minya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (175, 11, N'المنيا الجديدة', N'Minya El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (176, 11, N'العدوة', N'El Adwa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (177, 11, N'مغاغة', N'Magagha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (178, 11, N'بني مزار', N'Bani Mazar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (179, 11, N'مطاي', N'Mattay')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (180, 11, N'سمالوط', N'Samalut')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (181, 11, N'المدينة الفكرية', N'Madinat El Fekria')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (182, 11, N'ملوي', N'Meloy')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (183, 11, N'دير مواس', N'Deir Mawas')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (184, 16, N'أسيوط', N'Assiut')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (185, 16, N'أسيوط الجديدة', N'Assiut El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (186, 16, N'ديروط', N'Dayrout')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (187, 16, N'منفلوط', N'Manfalut')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (188, 16, N'القوصية', N'Qusiya')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (189, 16, N'أبنوب', N'Abnoub')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (190, 16, N'أبو تيج', N'Abu Tig')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (191, 16, N'الغنايم', N'El Ghanaim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (192, 16, N'ساحل سليم', N'Sahel Selim')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (193, 16, N'البداري', N'El Badari')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (194, 16, N'صدفا', N'Sidfa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (195, 13, N'الخارجة', N'El Kharga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (196, 13, N'باريس', N'Paris')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (197, 13, N'موط', N'Mout')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (198, 13, N'الفرافرة', N'Farafra')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (199, 13, N'بلاط', N'Balat')
GO
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (200, 5, N'الغردقة', N'Hurghada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (201, 5, N'رأس غارب', N'Ras Ghareb')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (202, 5, N'سفاجا', N'Safaga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (203, 5, N'القصير', N'El Qusiar')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (204, 5, N'مرسى علم', N'Marsa Alam')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (205, 5, N'الشلاتين', N'Shalatin')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (206, 5, N'حلايب', N'Halaib')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (207, 27, N'سوهاج', N'Sohag')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (208, 27, N'سوهاج الجديدة', N'Sohag El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (209, 27, N'أخميم', N'Akhmeem')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (210, 27, N'أخميم الجديدة', N'Akhmim El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (211, 27, N'البلينا', N'Albalina')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (212, 27, N'المراغة', N'El Maragha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (213, 27, N'المنشأة', N'almunshaa')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (214, 27, N'دار السلام', N'Dar AISalaam')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (215, 27, N'جرجا', N'Gerga')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (216, 27, N'جهينة الغربية', N'Jahina Al Gharbia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (217, 27, N'ساقلته', N'Saqilatuh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (218, 27, N'طما', N'Tama')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (219, 27, N'طهطا', N'Tahta')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (220, 25, N'قنا', N'Qena')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (221, 25, N'قنا الجديدة', N'New Qena')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (222, 25, N'أبو تشت', N'Abu Tesht')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (223, 25, N'نجع حمادي', N'Nag Hammadi')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (224, 25, N'دشنا', N'Deshna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (225, 25, N'الوقف', N'Alwaqf')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (226, 25, N'قفط', N'Qaft')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (227, 25, N'نقادة', N'Naqada')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (228, 25, N'فرشوط', N'Farshout')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (229, 25, N'قوص', N'Quos')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (230, 24, N'الأقصر', N'Luxor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (231, 24, N'الأقصر الجديدة', N'New Luxor')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (232, 24, N'إسنا', N'Esna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (233, 24, N'طيبة الجديدة', N'New Tiba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (234, 24, N'الزينية', N'Al ziynia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (235, 24, N'البياضية', N'Al Bayadieh')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (236, 24, N'القرنة', N'Al Qarna')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (237, 24, N'أرمنت', N'Armant')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (238, 24, N'الطود', N'Al Tud')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (239, 15, N'أسوان', N'Aswan')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (240, 15, N'أسوان الجديدة', N'Aswan El Gedida')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (241, 15, N'دراو', N'Drau')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (242, 15, N'كوم أمبو', N'Kom Ombo')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (243, 15, N'نصر النوبة', N'Nasr Al Nuba')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (244, 15, N'كلابشة', N'Kalabsha')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (245, 15, N'إدفو', N'Edfu')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (246, 15, N'الرديسية', N'Al-Radisiyah')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (247, 15, N'البصيلية', N'Al Basilia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (248, 15, N'السباعية', N'Al Sibaeia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (249, 15, N'ابوسمبل السياحية', N'Abo Simbl Al Siyahia')
INSERT [dbo].[SysCitiesValues] ([Id], [GovId], [TextAR], [TextEN]) VALUES (250, 9, N'أبو سلطان', N'Abo Sultan')
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
SET IDENTITY_INSERT [dbo].[SysEntryOrderValues] OFF
SET IDENTITY_INSERT [dbo].[SysExpenseTypes] ON 

INSERT [dbo].[SysExpenseTypes] ([Id], [Value], [Text]) VALUES (1, N'Expense', N'خدمات المشروع')
INSERT [dbo].[SysExpenseTypes] ([Id], [Value], [Text]) VALUES (2, N'AhmedProfit', N'أرباح أحمد')
INSERT [dbo].[SysExpenseTypes] ([Id], [Value], [Text]) VALUES (3, N'HatemProfit', N'أرباح حاتم')
SET IDENTITY_INSERT [dbo].[SysExpenseTypes] OFF
SET IDENTITY_INSERT [dbo].[SysGovernoratesValues] ON 

INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (1, N'القاهرة', N'Cairo')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (2, N'الجيزة', N'Giza')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (3, N'الأسكندرية', N'Alexandria')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (4, N'الدقهلية', N'Dakahlia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (5, N'البحر الأحمر', N'Red Sea')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (6, N'البحيرة', N'Beheira')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (7, N'الفيوم', N'Fayoum')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (8, N'الغربية', N'Gharbiya')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (9, N'الإسماعلية', N'Ismailia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (10, N'المنوفية', N'Monofia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (11, N'المنيا', N'Minya')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (12, N'القليوبية', N'Qaliubiya')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (13, N'الوادي الجديد', N'New Valley')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (14, N'السويس', N'Suez')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (15, N'اسوان', N'Aswan')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (16, N'اسيوط', N'Assiut')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (17, N'بني سويف', N'Beni Suef')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (18, N'بورسعيد', N'Port Said')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (19, N'دمياط', N'Damietta')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (20, N'الشرقية', N'Sharkia')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (21, N'جنوب سيناء', N'South Sinai')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (22, N'كفر الشيخ', N'Kafr Al sheikh')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (23, N'مطروح', N'Matrouh')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (24, N'الأقصر', N'Luxor')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (25, N'قنا', N'Qena')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (26, N'شمال سيناء', N'North Sinai')
INSERT [dbo].[SysGovernoratesValues] ([Id], [TextAR], [TextEN]) VALUES (27, N'سوهاج', N'Sohag')
SET IDENTITY_INSERT [dbo].[SysGovernoratesValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineDosesValues] ON 

INSERT [dbo].[SysMedicineDosesValues] ([Id], [Value], [Text]) VALUES (1, N'مرة واحدة يومياً', N'مرة واحدة يومياً')
INSERT [dbo].[SysMedicineDosesValues] ([Id], [Value], [Text]) VALUES (2, N'مرتان يومياً', N'مرتان يومياً')
INSERT [dbo].[SysMedicineDosesValues] ([Id], [Value], [Text]) VALUES (3, N'ثلاث مرات يومياً', N'ثلاث مرات يومياً')
SET IDENTITY_INSERT [dbo].[SysMedicineDosesValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicinePeriodsValues] ON 

INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (1, N'لمدة يوم واحد', N'لمدة يوم واحد')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (2, N'لمدة يومين', N'لمدة يومين')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (3, N'لمدة ثلاثة أيام', N'لمدة ثلاثة أيام')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (4, N'لمدة خمسة أيام', N'لمدة خمسة أيام')
INSERT [dbo].[SysMedicinePeriodsValues] ([Id], [Value], [Text]) VALUES (5, N'لمدة أسبوع', N'لمدة أسبوع')
SET IDENTITY_INSERT [dbo].[SysMedicinePeriodsValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineQuantityValues] ON 

INSERT [dbo].[SysMedicineQuantityValues] ([Id], [Value], [Text]) VALUES (1, N'نصف قرص', N'نصف قرص')
INSERT [dbo].[SysMedicineQuantityValues] ([Id], [Value], [Text]) VALUES (2, N'قرص', N'قرص')
INSERT [dbo].[SysMedicineQuantityValues] ([Id], [Value], [Text]) VALUES (3, N'قرصين', N'قرصين')
SET IDENTITY_INSERT [dbo].[SysMedicineQuantityValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicinesValues] ON 

INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (1, N'Antox', N'Antox')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2, N'Cornivita', N'Cornivita')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (1002, N'Plaquanile', N'Plaquanile')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (1003, N'Dimra', N'Dimra')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2003, N'Omeprazole', N'Omeprazole')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2004, N'Anti cox II  amp', N'Anti cox II  amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2005, N'Norflex amp ', N'Norflex amp ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2006, N'Norflex amp ', N'Norflex amp ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2007, N'Mobetil amp', N'Mobetil amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2008, N'Feldine', N'Feldine')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2009, N'Feldine amp', N'Feldine amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2010, N'Lurnoxicam amp', N'Lurnoxicam amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2011, N'Depomedrol 40mg', N'Depomedrol 40mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2012, N'Epirelefan 40mg amp', N'Epirelefan 40mg amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2013, N'Lornicam Rapid 8 mg', N'Lornicam Rapid 8 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2014, N'Lornicam Rapid 4 mg', N'Lornicam Rapid 4 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2015, N'Noxilorn 8 mg', N'Noxilorn 8 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2016, N'Arcoxia 90 mg', N'Arcoxia 90 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2017, N'Arcoxia 60 mg', N'Arcoxia 60 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2018, N'Recoxibright 90 mg', N'Recoxibright 90 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2019, N'Recoxibright 60 mg', N'Recoxibright 60 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2020, N'Neurintin 300 mg', N'Neurintin 300 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2021, N'Gaptin 300 mg', N'Gaptin 300 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2022, N'Gaptin 100 mg', N'Gaptin 100 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2023, N'Neurotop 300 mg', N'Neurotop 300 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2024, N'Neurotop 600 mg', N'Neurotop 600 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2025, N'Tegritol 200 CR', N'Tegritol 200 CR')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2026, N'Tegritol 400 CR', N'Tegritol 400 CR')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2027, N'Lyrica 75 mg', N'Lyrica 75 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2028, N'Lyrica 150 mg', N'Lyrica 150 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2029, N'Myafibrol 75 mg', N'Myafibrol 75 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2030, N'Myafibrol 150 mg', N'Myafibrol 150 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2031, N'Trental 400 SR', N'Trental 400 SR')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2032, N'Betaserc 16 mg', N'Betaserc 16 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2033, N'Dramenix ', N'Dramenix ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2034, N'Dimra', N'Dimra')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2035, N'Flexilax', N'Flexilax')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2036, N'Declophin Plus Cap', N'Declophin Plus Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2037, N'Alphentirn', N'Alphentirn')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2038, N'Flamogen', N'Flamogen')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2039, N'Ambezim ', N'Ambezim ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2040, N'Reparil ', N'Reparil ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2041, N'Maxicare Cream', N'Maxicare Cream')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2042, N'Myofen Cap', N'Myofen Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2043, N'Baclofen 10 mg', N'Baclofen 10 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2044, N'Baclofen 25 mg', N'Baclofen 25 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2045, N'Arthrofast 150 ', N'Arthrofast 150 ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2046, N'Diclac 150', N'Diclac 150')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2047, N'Flector 50 mg', N'Flector 50 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2048, N'Neurotone amp', N'Neurotone amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2049, N'Neurotone tab', N'Neurotone tab')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2050, N'CH Alpha Sachet ', N'CH Alpha Sachet ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2051, N'CH Alpha Plus Sachet', N'CH Alpha Plus Sachet')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2052, N'Jonmera Sachet', N'Jonmera Sachet')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2053, N'Avosoya Cap', N'Avosoya Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2054, N'Piascaldine 300 Cap', N'Piascaldine 300 Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2055, N'Deep Heat ', N'Deep Heat ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2056, N'Deep Freez', N'Deep Freez')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2057, N'Plaqunil 200', N'Plaqunil 200')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2058, N'Hydroquine 200', N'Hydroquine 200')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2059, N'Salazopyrine 500 mg', N'Salazopyrine 500 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2060, N'Azathioprine 50 mg', N'Azathioprine 50 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2061, N'Imuran 50 mg', N'Imuran 50 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2062, N'Methotrexate 50 mg', N'Methotrexate 50 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2063, N'Methotrexate 2.5 mg', N'Methotrexate 2.5 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2064, N'Cellcipt 500 mg', N'Cellcipt 500 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2065, N'Mofitil 500 mg', N'Mofitil 500 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2066, N'Arthfree 20 ', N'Arthfree 20 ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2067, N'Avara 20', N'Avara 20')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2068, N'Enbril 50 mg ', N'Enbril 50 mg ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2069, N'Humira 40', N'Humira 40')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2070, N'Amjevita 40', N'Amjevita 40')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2071, N'Amjevita 20', N'Amjevita 20')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2072, N'Remicade 100', N'Remicade 100')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2073, N'Cimzia 200', N'Cimzia 200')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2074, N'Simponi 50 / Month ', N'Simponi 50 / Month ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2075, N'Simponi 50 / Month ', N'Simponi 50 / Month ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2076, N'Stelara Sc 90 mg / 3 months ', N'Stelara Sc 90 mg / 3 months ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2077, N'Stelara  130 mg IV   ', N'Stelara  130 mg IV   ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2078, N'Cosyntex 150', N'Cosyntex 150')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2079, N'Actimra 400', N'Actimra 400')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2080, N'Actimra 200', N'Actimra 200')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2081, N'Mabthera 500', N'Mabthera 500')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2082, N'Baricitinib 4mg', N'Baricitinib 4mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2083, N'Xeljanz 5 mg', N'Xeljanz 5 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2084, N'Sandimmune 100 mg ', N'Sandimmune 100 mg ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2085, N'Sandimmune 50 mg ', N'Sandimmune 50 mg ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2086, N'Sandimmune 25 mg ', N'Sandimmune 25 mg ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2087, N'Neoral 100 mg', N'Neoral 100 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2088, N'Neoral 50 mg', N'Neoral 50 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2089, N'Aclasta 5 mg', N'Aclasta 5 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2090, N'Prolia 60 mg', N'Prolia 60 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2091, N'Forteo 20', N'Forteo 20')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2092, N'Vit D3 50000 IU', N'Vit D3 50000 IU')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2093, N'Vit D3 10000 IU', N'Vit D3 10000 IU')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2094, N'Devarol 200000 IU', N'Devarol 200000 IU')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2095, N'Sterogel 600000 IU', N'Sterogel 600000 IU')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2096, N'Cal D Marine', N'Cal D Marine')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2097, N'Calcitrone', N'Calcitrone')
GO
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2098, N'Calcitrone', N'Calcitrone')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2099, N'Voxazoldine 600', N'Voxazoldine 600')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2100, N'Avrozolid 600 mg', N'Avrozolid 600 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2101, N'Vilzolid 600', N'Vilzolid 600')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2102, N'Cefotrex 1gm', N'Cefotrex 1gm')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2103, N'Unasin 1.5 gm', N'Unasin 1.5 gm')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2104, N'Doxium 500', N'Doxium 500')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2105, N'Daflone 500', N'Daflone 500')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2106, N'Lasilactone 100', N'Lasilactone 100')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2107, N'Lasilactone 50', N'Lasilactone 50')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2108, N'Moduretic', N'Moduretic')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2109, N'Pepzol 40', N'Pepzol 40')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2110, N'Ezogast 40', N'Ezogast 40')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2111, N'Solumedrol 500 mg', N'Solumedrol 500 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2112, N'Solumedrol 1000 mg', N'Solumedrol 1000 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2113, N'Avil Retard  amp', N'Avil Retard  amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2114, N'Fortacortine amp', N'Fortacortine amp')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2115, N'Dexamethazone', N'Dexamethazone')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2116, N'Infex 100 mg', N'Infex 100 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2117, N'Rescuvita SG Cap', N'Rescuvita SG Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2118, N'Beejaxin 1400', N'Beejaxin 1400')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2119, N'Relatrolene 10 mg', N'Relatrolene 10 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2120, N'Relatrolene  ', N'Relatrolene  ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2121, N'Danterelax Comp Cap', N'Danterelax Comp Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2122, N'Colchecine', N'Colchecine')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2123, N'Grapexone Cap', N'Grapexone Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2124, N'Norgesic Tab', N'Norgesic Tab')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2125, N'Soluprid 20 mg', N'Soluprid 20 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2126, N'Soluprid 5 mg', N'Soluprid 5 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2127, N'Flazacore 30 mg', N'Flazacore 30 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2128, N'Flazacore 6 mg', N'Flazacore 6 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2129, N'Cymbalta 60', N'Cymbalta 60')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2130, N'Cymbalta 30', N'Cymbalta 30')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2131, N'Myodonia 25', N'Myodonia 25')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2132, N'Tryptizol 25', N'Tryptizol 25')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2133, N'Giger Tab', N'Giger Tab')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2134, N'Colosalazine 500 mg', N'Colosalazine 500 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2135, N'Pentaza 500 mg', N'Pentaza 500 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2136, N'Eperix 4000 SC', N'Eperix 4000 SC')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2137, N'Feroglobin Cap', N'Feroglobin Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2138, N'Ferrotrone Cap', N'Ferrotrone Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2139, N'Erythropoitin 4000 ', N'Erythropoitin 4000 ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2140, N'Controloc 40 ', N'Controloc 40 ')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2141, N'Nexium 40', N'Nexium 40')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2142, N'Osteorine Cap', N'Osteorine Cap')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2143, N'Orancia vial', N'Orancia vial')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2144, N'Decadurapolina 50 vial', N'Decadurapolina 50 vial')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2145, N'Bravamax 200', N'Bravamax 200')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2146, N'Deconadal 20 mg', N'Deconadal 20 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2147, N'Deconadal 10 mg', N'Deconadal 10 mg')
INSERT [dbo].[SysMedicinesValues] ([Id], [Value], [Text]) VALUES (2148, N'Vilzolid 600', N'Vilzolid 600')
SET IDENTITY_INSERT [dbo].[SysMedicinesValues] OFF
SET IDENTITY_INSERT [dbo].[SysMedicineTimingsValues] ON 

INSERT [dbo].[SysMedicineTimingsValues] ([Id], [Value], [Text]) VALUES (1, N'قبل الأكل', N'قبل الأكل')
INSERT [dbo].[SysMedicineTimingsValues] ([Id], [Value], [Text]) VALUES (2, N'بعد الأكل', N'بعد الأكل')
INSERT [dbo].[SysMedicineTimingsValues] ([Id], [Value], [Text]) VALUES (3, N'اثناء الاكل', N'اثناء الاكل')
SET IDENTITY_INSERT [dbo].[SysMedicineTimingsValues] OFF
SET IDENTITY_INSERT [dbo].[SysPatientRecordSectionsValues] ON 

INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (1, N'Patient Complaint', N'شكوى المريض')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (2, N'Patient History', N'التاريخ المرضي')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (3, N'Examination', N'الفحص')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (4, N'Diagnosis', N'التشخيص')
INSERT [dbo].[SysPatientRecordSectionsValues] ([Id], [Value], [Text]) VALUES (5, N'X-Rays', N'الأشعة')
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
INSERT [dbo].[SysSubscriberTypeValues] ([Id], [Value], [Text]) VALUES (5, N'Advs', N'إعلانات')
SET IDENTITY_INSERT [dbo].[SysSubscriberTypeValues] OFF
SET IDENTITY_INSERT [dbo].[SysSubscriptionTypeValues] ON 

INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (1, N'FirstTime', N'اشتراك أول مرة')
INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (2, N'Renewal', N'تجديد اشتراك')
INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (3, N'Upgrade', N'ترقية الباقة')
INSERT [dbo].[SysSubscriptionTypeValues] ([Id], [Value], [Text]) VALUES (4, N'DownGrade', N'تخفيض الباقة')
SET IDENTITY_INSERT [dbo].[SysSubscriptionTypeValues] OFF
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingPayments_BookingId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_BookingPayments_BookingId] ON [dbo].[BookingPayments]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_DiscountId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_DiscountId] ON [dbo].[Bookings]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_DoctorId] ON [dbo].[Bookings]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_PatientId] ON [dbo].[Bookings]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_TypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_TypeId] ON [dbo].[Bookings]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookingServices_ServiceId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_BookingServices_ServiceId] ON [dbo].[BookingServices]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChatMessages_ReceiverId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_ChatMessages_ReceiverId] ON [dbo].[ChatMessages]
(
	[ReceiverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChatMessages_SenderId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_ChatMessages_SenderId] ON [dbo].[ChatMessages]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicBookingTypes_ClinicId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicBookingTypes_ClinicId] ON [dbo].[ClinicBookingTypes]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicDiscounts_ClinicId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicDiscounts_ClinicId] ON [dbo].[ClinicDiscounts]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clinics_EntryOrderId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Clinics_EntryOrderId] ON [dbo].[Clinics]
(
	[EntryOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicServices_ClinicId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicServices_ClinicId] ON [dbo].[ClinicServices]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClinicUsers_UserId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_ClinicUsers_UserId] ON [dbo].[ClinicUsers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorAnalysisValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorAnalysisValues_DoctorId] ON [dbo].[DoctorAnalysisValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorClinics_ClinicId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorClinics_ClinicId] ON [dbo].[DoctorClinics]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorComplaintChoicesValues_DetailedComplaintId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorComplaintChoicesValues_DetailedComplaintId] ON [dbo].[DoctorComplaintChoicesValues]
(
	[DetailedComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorDetailedComplaintsValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorDetailedComplaintsValues_DoctorId] ON [dbo].[DoctorDetailedComplaintsValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorDiagnosisValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorDiagnosisValues_DoctorId] ON [dbo].[DoctorDiagnosisValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorExaminationAreasValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorExaminationAreasValues_DoctorId] ON [dbo].[DoctorExaminationAreasValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorExaminationsValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorExaminationsValues_DoctorId] ON [dbo].[DoctorExaminationsValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorGeneralComplaintsValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorGeneralComplaintsValues_DoctorId] ON [dbo].[DoctorGeneralComplaintsValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorMedicinesValues_MedicineId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorMedicinesValues_MedicineId] ON [dbo].[DoctorMedicinesValues]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorOperationTypesValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorOperationTypesValues_DoctorId] ON [dbo].[DoctorOperationTypesValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorRayAreasValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorRayAreasValues_DoctorId] ON [dbo].[DoctorRayAreasValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorRaysValues_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_DoctorRaysValues_DoctorId] ON [dbo].[DoctorRaysValues]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Doctors_SpecialtyId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Doctors_SpecialtyId] ON [dbo].[Doctors]
(
	[SpecialtyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Expenses_ExpenseTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Expenses_ExpenseTypeId] ON [dbo].[Expenses]
(
	[ExpenseTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysis_AnalysisId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysis_AnalysisId] ON [dbo].[PatientAnalysis]
(
	[AnalysisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysis_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysis_PatientId] ON [dbo].[PatientAnalysis]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysis_ResultGradeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysis_ResultGradeId] ON [dbo].[PatientAnalysis]
(
	[ResultGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysisFiles_FileTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysisFiles_FileTypeId] ON [dbo].[PatientAnalysisFiles]
(
	[FileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientAnalysisFiles_PatientAnalysisId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientAnalysisFiles_PatientAnalysisId] ON [dbo].[PatientAnalysisFiles]
(
	[PatientAnalysisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDetailedComplaints_ComplaintChoiceId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDetailedComplaints_ComplaintChoiceId] ON [dbo].[PatientDetailedComplaints]
(
	[ComplaintChoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDetailedComplaints_DetailedComplaintId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDetailedComplaints_DetailedComplaintId] ON [dbo].[PatientDetailedComplaints]
(
	[DetailedComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDetailedComplaints_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDetailedComplaints_PatientId] ON [dbo].[PatientDetailedComplaints]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiagnosis_DiagnosisId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiagnosis_DiagnosisId] ON [dbo].[PatientDiagnosis]
(
	[DiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiagnosis_GradeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiagnosis_GradeId] ON [dbo].[PatientDiagnosis]
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiagnosis_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiagnosis_PatientId] ON [dbo].[PatientDiagnosis]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiseases_DiseaseId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiseases_DiseaseId] ON [dbo].[PatientDiseases]
(
	[DiseaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientDiseases_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientDiseases_PatientId] ON [dbo].[PatientDiseases]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientExaminations_ExaminationAreaId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientExaminations_ExaminationAreaId] ON [dbo].[PatientExaminations]
(
	[ExaminationAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientExaminations_ExaminationId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientExaminations_ExaminationId] ON [dbo].[PatientExaminations]
(
	[ExaminationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientExaminations_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientExaminations_PatientId] ON [dbo].[PatientExaminations]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientGeneralComplaints_GeneralComplaintId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientGeneralComplaints_GeneralComplaintId] ON [dbo].[PatientGeneralComplaints]
(
	[GeneralComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientGeneralComplaints_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientGeneralComplaints_PatientId] ON [dbo].[PatientGeneralComplaints]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientOperations_OperationTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientOperations_OperationTypeId] ON [dbo].[PatientOperations]
(
	[OperationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientOperations_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientOperations_PatientId] ON [dbo].[PatientOperations]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientPrescriptions_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientPrescriptions_PatientId] ON [dbo].[PatientPrescriptions]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRayFiles_FileTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRayFiles_FileTypeId] ON [dbo].[PatientRayFiles]
(
	[FileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRayFiles_PatientRayId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRayFiles_PatientRayId] ON [dbo].[PatientRayFiles]
(
	[PatientRayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_PatientId] ON [dbo].[PatientRays]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_RayAreaId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_RayAreaId] ON [dbo].[PatientRays]
(
	[RayAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_RayId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_RayId] ON [dbo].[PatientRays]
(
	[RayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientRays_ResultGradeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientRays_ResultGradeId] ON [dbo].[PatientRays]
(
	[ResultGradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientReferrals_PatientDiagnosisId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientReferrals_PatientDiagnosisId] ON [dbo].[PatientReferrals]
(
	[PatientDiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientReferrals_PatientId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientReferrals_PatientId] ON [dbo].[PatientReferrals]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientReferrals_ReferralToDoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PatientReferrals_ReferralToDoctorId] ON [dbo].[PatientReferrals]
(
	[ReferralToDoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_BloodPressureId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_BloodPressureId] ON [dbo].[Patients]
(
	[BloodPressureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_CityId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_CityId] ON [dbo].[Patients]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_ClinicId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_ClinicId] ON [dbo].[Patients]
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_DoctorId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_DoctorId] ON [dbo].[Patients]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_GovernorateId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_GovernorateId] ON [dbo].[Patients]
(
	[GovernorateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_SocialStatusId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Patients_SocialStatusId] ON [dbo].[Patients]
(
	[SocialStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Plans_RenewalTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Plans_RenewalTypeId] ON [dbo].[Plans]
(
	[RenewalTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionMedicines_DoseId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionMedicines_DoseId] ON [dbo].[PrescriptionMedicines]
(
	[DoseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionMedicines_MedicineId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionMedicines_MedicineId] ON [dbo].[PrescriptionMedicines]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionMedicines_PeriodId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionMedicines_PeriodId] ON [dbo].[PrescriptionMedicines]
(
	[PeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionMedicines_QuantityId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionMedicines_QuantityId] ON [dbo].[PrescriptionMedicines]
(
	[QuantityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrescriptionMedicines_TimingId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_PrescriptionMedicines_TimingId] ON [dbo].[PrescriptionMedicines]
(
	[TimingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriptionPayments_SubscriptionId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_SubscriptionPayments_SubscriptionId] ON [dbo].[SubscriptionPayments]
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_PlanId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_PlanId] ON [dbo].[Subscriptions]
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_SubscriberTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_SubscriberTypeId] ON [dbo].[Subscriptions]
(
	[SubscriberTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_SubscriptionTypeId]    Script Date: 05/06/2020 03:50:30 م ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_SubscriptionTypeId] ON [dbo].[Subscriptions]
(
	[SubscriptionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SysCitiesValues_GovId]    Script Date: 05/06/2020 03:50:30 م ******/
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
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Doctors]
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
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_MessagesReceived_AspNetUsers] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_MessagesReceived_AspNetUsers]
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD  CONSTRAINT [FK_MessagesSent_AspNetUsers] FOREIGN KEY([SenderId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ChatMessages] CHECK CONSTRAINT [FK_MessagesSent_AspNetUsers]
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
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_SysExpenseTypes] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[SysExpenseTypes] ([Id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_SysExpenseTypes]
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
ALTER TABLE [dbo].[PatientDetailedComplaints]  WITH CHECK ADD  CONSTRAINT [FK_PatientDetailedComplaints_DoctorDetailedComplaintsValues] FOREIGN KEY([DetailedComplaintId])
REFERENCES [dbo].[DoctorDetailedComplaintsValues] ([Id])
GO
ALTER TABLE [dbo].[PatientDetailedComplaints] CHECK CONSTRAINT [FK_PatientDetailedComplaints_DoctorDetailedComplaintsValues]
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
ALTER TABLE [dbo].[PatientPrescriptions]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescriptions_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[PatientPrescriptions] CHECK CONSTRAINT [FK_PatientPrescriptions_Patients]
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
ALTER TABLE [dbo].[PatientReferrals]  WITH CHECK ADD  CONSTRAINT [FK_PatientReferrals_PatientDiagnosis] FOREIGN KEY([PatientDiagnosisId])
REFERENCES [dbo].[PatientDiagnosis] ([Id])
GO
ALTER TABLE [dbo].[PatientReferrals] CHECK CONSTRAINT [FK_PatientReferrals_PatientDiagnosis]
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
ALTER TABLE [dbo].[PrescriptionMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionMedicines_PatientPrescriptions_PrescriptionId] FOREIGN KEY([PrescriptionId])
REFERENCES [dbo].[PatientPrescriptions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrescriptionMedicines] CHECK CONSTRAINT [FK_PrescriptionMedicines_PatientPrescriptions_PrescriptionId]
GO
ALTER TABLE [dbo].[PrescriptionMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionMedicines_SysMedicineDosesValues] FOREIGN KEY([DoseId])
REFERENCES [dbo].[SysMedicineDosesValues] ([Id])
GO
ALTER TABLE [dbo].[PrescriptionMedicines] CHECK CONSTRAINT [FK_PrescriptionMedicines_SysMedicineDosesValues]
GO
ALTER TABLE [dbo].[PrescriptionMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionMedicines_SysMedicinePeriodsValues] FOREIGN KEY([PeriodId])
REFERENCES [dbo].[SysMedicinePeriodsValues] ([Id])
GO
ALTER TABLE [dbo].[PrescriptionMedicines] CHECK CONSTRAINT [FK_PrescriptionMedicines_SysMedicinePeriodsValues]
GO
ALTER TABLE [dbo].[PrescriptionMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionMedicines_SysMedicineQuantityValues] FOREIGN KEY([QuantityId])
REFERENCES [dbo].[SysMedicineQuantityValues] ([Id])
GO
ALTER TABLE [dbo].[PrescriptionMedicines] CHECK CONSTRAINT [FK_PrescriptionMedicines_SysMedicineQuantityValues]
GO
ALTER TABLE [dbo].[PrescriptionMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionMedicines_SysMedicinesValue] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[SysMedicinesValues] ([Id])
GO
ALTER TABLE [dbo].[PrescriptionMedicines] CHECK CONSTRAINT [FK_PrescriptionMedicines_SysMedicinesValue]
GO
ALTER TABLE [dbo].[PrescriptionMedicines]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionMedicines_SysMedicineTimingsValues] FOREIGN KEY([TimingId])
REFERENCES [dbo].[SysMedicineTimingsValues] ([Id])
GO
ALTER TABLE [dbo].[PrescriptionMedicines] CHECK CONSTRAINT [FK_PrescriptionMedicines_SysMedicineTimingsValues]
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
ALTER DATABASE [DB_A61DAE_smartclinic] SET  READ_WRITE 
GO
