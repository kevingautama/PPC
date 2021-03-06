USE [master]
GO
/****** Object:  Database [PPC]    Script Date: 11/06/2020 10:52:38 PM ******/
CREATE DATABASE [PPC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PPC', FILENAME = N'C:\Users\Kevin\PPC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PPC_log', FILENAME = N'C:\Users\Kevin\PPC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PPC] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PPC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PPC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PPC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PPC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PPC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PPC] SET ARITHABORT OFF 
GO
ALTER DATABASE [PPC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PPC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PPC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PPC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PPC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PPC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PPC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PPC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PPC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PPC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PPC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PPC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PPC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PPC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PPC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PPC] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PPC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PPC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PPC] SET  MULTI_USER 
GO
ALTER DATABASE [PPC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PPC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PPC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PPC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PPC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PPC] SET QUERY_STORE = OFF
GO
USE [PPC]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PPC]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/06/2020 10:52:39 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
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
/****** Object:  Table [dbo].[Criteria]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[ProjectId] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Weight] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependency]    Script Date: 11/06/2020 10:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependency](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[TaskId] [uniqueidentifier] NOT NULL,
	[MasterTaskId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Dependency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/06/2020 10:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 11/06/2020 10:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[TaskId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 11/06/2020 10:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ManagerId] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[Status] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/06/2020 10:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CriteriaId] [uniqueidentifier] NOT NULL,
	[TaskId] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 11/06/2020 10:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[DeletedDate] [datetime2](7) NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Rank] [int] NULL,
	[Score] [float] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[AssignUserId] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[FinishDate] [datetime2](7) NULL,
	[StartDate] [datetime2](7) NULL,
	[Prioritize] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190307075808_InitialCreate', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190307080900_AddNameColumnIdentity', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190307134815_AddPersonalInfoIdentity', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190307145322_AddIsActiveIdentity', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190311160108_UnrequiredProjectIdCriteria', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190311164236_NullableupdateddeletedateAudit', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190315151545_UpdateAppDb', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190315161331_UpdateAppDb1', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190319175037_UpdateDbApp', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190320132736_ChangeTanknull', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190320142658_AddType', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190323081741_AddTagsProject', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190331125938_AddStartFinishDateTask', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190725111549_AddTaskDependency', N'2.2.2-servicing-10034')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190801123709_AddPrioritizeTask', N'2.2.2-servicing-10034')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'53db7d4a-8fe4-4f10-9f32-0d4ab5857e7e', N'Staff', N'STAFF', N'94e22637-70e7-4865-ad5c-220004646d53')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'76132fd7-4c2b-4f1e-885a-ca0cda0b5aba', N'Manager', N'MANAGER', N'4bfbc2f4-71a3-4155-8533-58a521a1c1c5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'53db7d4a-8fe4-4f10-9f32-0d4ab5857e7e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'481d9525-a067-4360-ba17-36ff02eb22bc', N'76132fd7-4c2b-4f1e-885a-ca0cda0b5aba')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c3a92498-6eec-4c1f-a4b3-fa8f5032db32', N'76132fd7-4c2b-4f1e-885a-ca0cda0b5aba')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Address], [Gender], [IsActive]) VALUES (N'481d9525-a067-4360-ba17-36ff02eb22bc', N'manager', N'MANAGER', N'manager@manager.com', N'MANAGER@MANAGER.COM', 0, N'AQAAAAEAACcQAAAAEPXBRSM09J4I9ZjHg0Intw80jTTNhhwHWh2vVOyj0Bk55WLpvYIdXQ3GAOm8Hn3idw==', N'HHG5IP4MV6GFOA4E3S2BLKCKEIXQBENY', N'd7e3baa9-18eb-4dab-9321-044120b3ece1', NULL, 0, 0, NULL, 1, 0, N'manager', N'alamat manager', N'Male', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Address], [Gender], [IsActive]) VALUES (N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'staff', N'STAFF', N'staff@staff.com', N'STAFF@STAFF.COM', 0, N'AQAAAAEAACcQAAAAELCF9EdiUxnFPaFDa9KLDG4ZLdhZwgRwr01ErspDYmn1KaAASCHNN8MWj6TVG5mpww==', N'ZPYRDZSZJ7A32NNLZ763DGQAMUVEK53I', N'2c3609bd-5ee1-4705-a29e-5e6d4cd8eabf', NULL, 0, 0, NULL, 1, 0, N'staff', N'stafff', N'Male', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Address], [Gender], [IsActive]) VALUES (N'c3a92498-6eec-4c1f-a4b3-fa8f5032db32', N'admin', N'ADMIN', N'admin@admin.com', N'ADMIN@ADMIN.COM', 0, N'AQAAAAEAACcQAAAAEMmHm78w/7gdQUBt+OT61PD7oPSyFmqH3xPaIT+eYwM/hXCm1xOo0Jzcwucku9vzBw==', N'KGVSOKLURO4AFWQS567QXFEZVLL7PLQ3', N'ad72584c-650d-4323-a3fa-789804649de9', NULL, 0, 0, NULL, 1, 0, N'admin', N'admin address', N'Male', 1)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'b6d6d726-4132-424d-3559-08d6c0c2a23f', CAST(N'2019-04-14T17:19:09.7382931' AS DateTime2), NULL, NULL, NULL, CAST(N'2019-09-04T19:31:41.0385239' AS DateTime2), NULL, NULL, N'Task Risks', N'Risk of uncertain events which may occur in future. ', N'Cost', N'23.57', 1)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'bb580ab3-ad82-452b-355a-08d6c0c2a23f', CAST(N'2019-04-14T17:19:09.7888805' AS DateTime2), NULL, NULL, NULL, CAST(N'2019-09-04T19:31:41.0385485' AS DateTime2), NULL, NULL, N'Task Cost', N'The total cost of project includes all the direct and indirect expenditure', N'Cost', N'48.25', 1)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'30be055c-ab61-44be-355b-08d6c0c2a23f', CAST(N'2019-04-14T17:19:09.7895394' AS DateTime2), NULL, NULL, NULL, CAST(N'2019-09-04T19:31:41.0385547' AS DateTime2), NULL, NULL, N'Resource Utilization', N'Resources are needed at each phase of manufacturing the software project', N'Cost', N'4.25', 1)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'c3d8748f-f9e1-4166-355c-08d6c0c2a23f', CAST(N'2019-04-14T17:19:09.7897048' AS DateTime2), NULL, NULL, NULL, CAST(N'2019-09-04T19:31:41.0385596' AS DateTime2), NULL, NULL, N'Completion Time', N'Software project must be completed before the deadline met', N'Cost', N'8.67', 1)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'22dde4b1-73e0-4cda-355d-08d6c0c2a23f', CAST(N'2019-04-14T17:19:09.7897631' AS DateTime2), NULL, NULL, NULL, CAST(N'2019-09-04T19:31:41.0385641' AS DateTime2), NULL, NULL, N'Task Benefits', N'Ability to deliver benefits.', N'Benefit', N'0.26', 1)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'5740283d-f13c-4e47-355e-08d6c0c2a23f', CAST(N'2019-04-14T17:35:09.6349580' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T18:07:49.3030413' AS DateTime2), NULL, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'Task Risks', NULL, N'Cost', N'23.57', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', CAST(N'2019-04-14T17:35:09.6410006' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T18:07:49.3031908' AS DateTime2), NULL, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'Task Cost', NULL, N'Cost', N'48.25', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'731ac174-68ad-40e6-3560-08d6c0c2a23f', CAST(N'2019-04-14T17:35:09.6411422' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T18:07:49.3031978' AS DateTime2), NULL, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'Resource Utilization', NULL, N'Cost', N'4.25', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', CAST(N'2019-04-14T17:35:09.6412728' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T18:07:49.3032027' AS DateTime2), NULL, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'Completion Time', NULL, N'Cost', N'8.67', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', CAST(N'2019-04-14T17:35:09.6413311' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T18:07:49.3032072' AS DateTime2), NULL, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'Task Benefits', NULL, N'Benefit', N'15.26', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'011edba2-f483-417d-8d5c-08d730841e0b', CAST(N'2019-09-03T22:33:49.4077369' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'Task Risks', N'Risk of uncertain events which may occur in future. ', N'Cost', N'23.57', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'35629322-95ba-4f8d-8d5d-08d730841e0b', CAST(N'2019-09-03T22:33:49.4195901' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'Task Cost', N'The total cost of project includes all the direct and indirect expenditure', N'Cost', N'48.25', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'b2fca437-f2a7-4d04-8d5e-08d730841e0b', CAST(N'2019-09-03T22:33:49.4200175' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'Resource Utilization', N'Resources are needed at each phase of manufacturing the software project', N'Cost', N'4.25', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'db0ddd1d-cb2d-469d-8d5f-08d730841e0b', CAST(N'2019-09-03T22:33:49.4201320' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'Completion Time', N'Software project must be completed before the deadline met', N'Cost', N'8.67', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'd2a60d27-5b7d-462d-8d60-08d730841e0b', CAST(N'2019-09-03T22:33:49.4201985' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'Task Benefits', N'Ability to deliver benefits.', N'Benefit', N'15.26', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'4bd6e6b4-e236-49de-27e3-08d731332cee', CAST(N'2019-09-04T19:26:56.3016661' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'f1598018-a41f-47bd-8291-515b0768e1a5', N'Task Risks', N'Risk of uncertain events which may occur in future. ', N'Cost', N'23.57', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'64afe15f-748b-486f-27e4-08d731332cee', CAST(N'2019-09-04T19:26:56.3284450' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'f1598018-a41f-47bd-8291-515b0768e1a5', N'Task Cost', N'The total cost of project includes all the direct and indirect expenditure', N'Cost', N'48.25', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'fe053bf8-0f8b-4df6-27e5-08d731332cee', CAST(N'2019-09-04T19:26:56.3289200' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'f1598018-a41f-47bd-8291-515b0768e1a5', N'Resource Utilization', N'Resources are needed at each phase of manufacturing the software project', N'Cost', N'4.25', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'3a650c3f-cd93-44cf-27e6-08d731332cee', CAST(N'2019-09-04T19:26:56.3290000' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'f1598018-a41f-47bd-8291-515b0768e1a5', N'Completion Time', N'Software project must be completed before the deadline met', N'Cost', N'8.67', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'e1b4e083-2e8f-42e8-27e7-08d731332cee', CAST(N'2019-09-04T19:26:56.3290546' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'f1598018-a41f-47bd-8291-515b0768e1a5', N'Task Benefits', N'Ability to deliver benefits.', N'Benefit', N'15.26', 0)
INSERT [dbo].[Criteria] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [ProjectId], [Name], [Description], [Type], [Weight], [IsDefault]) VALUES (N'9bd6bef3-0401-431a-27e8-08d731332cee', CAST(N'2019-09-04T19:30:25.0225863' AS DateTime2), NULL, NULL, NULL, CAST(N'2019-09-04T19:31:41.0385690' AS DateTime2), NULL, NULL, N'Criteria Skripsi', N'deskripsi', N'Benefit', N'15.00', 1)
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'7e0b43c3-0d1c-4475-edf0-08d71c01a296', CAST(N'2019-08-08T20:09:24.4454185' AS DateTime2), N'admin', CAST(N'2019-08-08T21:08:44.7151767' AS DateTime2), N'admin', NULL, NULL, N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', N'd007013b-892e-4067-9c99-532c30594cf9')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'56d9eec0-7a42-45ec-0175-08d71f21e344', CAST(N'2019-08-12T19:37:50.3383166' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', N'2e81de17-f8bb-43e9-9c92-8217a17620d2')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'f8aebff5-d093-48f4-0176-08d71f21e344', CAST(N'2019-08-12T19:38:08.1224480' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', N'06ca1bab-695e-4ee4-822a-f6bc9db87bce')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'3e8bb7eb-e9bd-402e-0177-08d71f21e344', CAST(N'2019-08-12T19:38:20.4957587' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'd8e376bd-e278-4a8d-bb98-828daf9c3384', N'8ddbb142-1fa3-477d-97fb-7fb80edc863a')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'5237e0db-ec36-441a-0178-08d71f21e344', CAST(N'2019-08-12T19:38:38.3760034' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', N'd007013b-892e-4067-9c99-532c30594cf9')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'10ce7260-08ef-43c0-0179-08d71f21e344', CAST(N'2019-08-12T19:39:04.5426062' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'f8b81731-4fd7-4de3-017a-08d71f21e344', CAST(N'2019-08-12T19:46:16.2783552' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'56a71d30-5419-4695-a985-7f9d94804c0f', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'91b1ec60-1446-47d8-017b-08d71f21e344', CAST(N'2019-08-12T19:46:43.4420378' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'fa35edec-b3f7-446c-8f37-f37d9506eaca', N'd8e376bd-e278-4a8d-bb98-828daf9c3384')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'a6b146df-619c-495f-017c-08d71f21e344', CAST(N'2019-08-12T19:47:10.4676868' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', N'd8e376bd-e278-4a8d-bb98-828daf9c3384')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'b0dcd472-3418-4f6b-017d-08d71f21e344', CAST(N'2019-08-12T19:47:26.1777039' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', N'bed8a471-6dc4-4226-83b4-3c1a729c1e85')
INSERT [dbo].[Dependency] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [TaskId], [MasterTaskId]) VALUES (N'08cc5acb-d2ff-46bb-cd06-08d71fbc555c', CAST(N'2019-08-13T14:03:24.2567614' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', N'd8e376bd-e278-4a8d-bb98-828daf9c3384')
INSERT [dbo].[Member] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [UserId], [ProjectId]) VALUES (N'815a368e-021b-4783-6daf-08d6c0cb8a1e', CAST(N'2019-04-14T18:22:54.7577017' AS DateTime2), NULL, CAST(N'2019-07-16T17:44:59.9288645' AS DateTime2), N'admin', NULL, NULL, N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'7c06ed2a-5e62-4d04-a1b8-de89601727f1')
INSERT [dbo].[Member] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [UserId], [ProjectId]) VALUES (N'6f41d0f3-f34d-47d9-cd00-08d709daa8a0', CAST(N'2019-07-16T17:45:03.2788848' AS DateTime2), NULL, NULL, NULL, NULL, NULL, N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'7c06ed2a-5e62-4d04-a1b8-de89601727f1')
INSERT [dbo].[Member] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [UserId], [ProjectId]) VALUES (N'0b5a45d6-1f31-4d72-2336-08d730864b9b', CAST(N'2019-09-03T22:49:24.8412763' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'8dbbcf23-29c5-4b32-b700-4ae579de35af')
INSERT [dbo].[Project] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [ManagerId], [Code], [StartDate], [Status], [Tags]) VALUES (N'8dbbcf23-29c5-4b32-b700-4ae579de35af', CAST(N'2019-09-03T22:33:49.3747630' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-03T23:17:34.7794537' AS DateTime2), N'admin', N'Dummy Project', NULL, N'c3a92498-6eec-4c1f-a4b3-fa8f5032db32', N'DP', CAST(N'2019-09-03T23:17:34.7794550' AS DateTime2), N'Progress', NULL)
INSERT [dbo].[Project] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [ManagerId], [Code], [StartDate], [Status], [Tags]) VALUES (N'f1598018-a41f-47bd-8291-515b0768e1a5', CAST(N'2019-09-04T19:26:56.2378241' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'UIB', N'Test Sidan Skripsi', N'c3a92498-6eec-4c1f-a4b3-fa8f5032db32', N'UIB', NULL, N'Pending', NULL)
INSERT [dbo].[Project] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [ManagerId], [Code], [StartDate], [Status], [Tags]) VALUES (N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', CAST(N'2019-04-14T17:35:09.5833681' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-08-12T19:52:43.3270423' AS DateTime2), N'admin', N'ProductSiz', N'System to manage product sizing, calculate cost and generate proposal', N'c3a92498-6eec-4c1f-a4b3-fa8f5032db32', N'SS3', CAST(N'2019-08-01T21:48:56.7442405' AS DateTime2), N'Pause', N'asp.net,c#,desktop')
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'776cbced-b917-4c4a-a0f5-00fc31f5d43e', CAST(N'2019-07-21T01:13:17.0180219' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:42.4582666' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'5bb042c3-5036-445f-be41-e7396ffa94b5', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'48ce5da0-5a25-41a8-a914-02bda6c0d2ca', CAST(N'2019-07-21T01:13:17.0178265' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:42.4552254' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'5bb042c3-5036-445f-be41-e7396ffa94b5', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'abd44463-4438-4a7c-a7fd-0426d1392188', CAST(N'2019-07-21T01:21:22.6109228' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:23:14.7544171' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'db72c3b1-ca47-4015-b7a5-0a434a0ba422', CAST(N'2019-07-21T01:18:03.0916684' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:51.5832435' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'ab2adf1c-a7eb-43d5-a0ba-810afbd6921a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'd1014fe1-0a7d-4793-963f-0cd5f6d809f0', CAST(N'2019-04-24T20:39:12.3973327' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'c1a52e30-a654-4a3f-9084-39466399819d', NULL, 0.81)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'83fbaa3d-a4c8-42a5-8f7b-0d043891d1dd', CAST(N'2019-04-24T20:39:48.1316930' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'99ef7c89-87db-4d33-896b-68715896841c', NULL, 0.38)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'faf11fda-b9cb-4bbb-b02c-0fb6b67f6c5c', CAST(N'2019-07-21T01:20:54.1060820' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:20.5537667' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'06ca1bab-695e-4ee4-822a-f6bc9db87bce', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f52d8f6e-d504-4a10-a0c6-103e7cc3d826', CAST(N'2019-07-21T01:17:12.1210410' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:56.6056660' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'9716b19c-be71-46f0-9a79-158bdba92bc2', CAST(N'2019-07-21T01:19:10.0074689' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:42:43.0203697' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'fb604d6a-cfc0-4da3-9be7-1ca729dc0ae6', CAST(N'2019-07-21T01:23:27.0905045' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:19.8281316' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'7d365e1e-f3d7-43c7-867d-08451cbaca10', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'a284e5b1-586f-46e7-8370-1f5dd211e70e', CAST(N'2019-07-21T01:11:33.4749387' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:41:36.4359974' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'3d3e317d-9090-47bf-a425-f23aeae72726', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f879e4b5-8a79-4b92-921f-20de1d3e15f7', CAST(N'2019-07-21T01:23:56.2304013' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:20:18.0937617' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'0f18da10-c08d-4a79-9ec0-221f6dc37620', CAST(N'2019-07-21T01:20:54.1063164' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:20.5595141' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'06ca1bab-695e-4ee4-822a-f6bc9db87bce', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'ad997a02-8bc1-4114-9cfb-258eee06a629', CAST(N'2019-07-21T01:24:23.1504960' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:21:32.0686048' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'56a71d30-5419-4695-a985-7f9d94804c0f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'a8c578f3-2d62-436e-9147-2949872d6026', CAST(N'2019-07-21T01:12:34.1941110' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:29.6134274' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'be6b9291-813c-4583-9177-466b6bf2840f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3f00f286-5ad1-4be9-928c-2fb58a72830e', CAST(N'2019-07-21T01:18:03.0917480' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:51.5879856' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'ab2adf1c-a7eb-43d5-a0ba-810afbd6921a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'677e6f0a-cac5-46ec-bb47-30b1461a8e29', CAST(N'2019-07-21T01:18:23.9693849' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:08.8113405' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'da08d127-b83d-4847-9301-a26a82ae1a45', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'e68bb7df-105f-4613-8750-30d8a5b5463c', CAST(N'2019-07-21T01:23:27.0905406' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:19.8299101' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'7d365e1e-f3d7-43c7-867d-08451cbaca10', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'7cdb956a-7367-4c8d-985b-31489f8fc6e6', CAST(N'2019-07-21T01:22:12.9022487' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:50.7622070' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'358be468-1b13-46d9-af6e-327484d54e07', CAST(N'2019-07-21T01:20:21.6170332' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:34:02.8940972' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'fa35edec-b3f7-446c-8f37-f37d9506eaca', NULL, 1)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'ebedd597-37fc-4352-8446-33861c9f9556', CAST(N'2019-04-24T20:40:19.8821353' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'59b1b12e-ba17-47d7-a0e6-4a742a4b7497', NULL, 0.36)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'54233717-a0b5-4d42-bf24-369e039069c8', CAST(N'2019-07-21T01:22:51.9688636' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:25:47.4935845' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c', NULL, 1)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'e027d8d0-21cb-4abf-a7bf-3a75be37da40', CAST(N'2019-07-21T01:17:12.1209104' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:56.6014071' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'ceabc734-1bf0-4033-b970-403cf6db71f0', CAST(N'2019-07-21T01:18:23.9694193' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:08.8128180' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'da08d127-b83d-4847-9301-a26a82ae1a45', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'02bf40f6-ed3f-4018-aa31-40c86628866f', CAST(N'2019-07-21T01:16:06.4740758' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:46.0621291' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3382760d-6f6f-495e-9e0c-41a5d23036e4', CAST(N'2019-07-21T01:21:22.6108871' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:23:14.7520969' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'dc5c7da2-f451-4e66-8bc4-433eb61a4593', CAST(N'2019-07-21T01:13:17.0181299' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:42.4648248' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'5bb042c3-5036-445f-be41-e7396ffa94b5', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'9c2fc18c-e3ae-40d2-8023-4552179d4aa3', CAST(N'2019-07-21T01:22:12.9025093' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:50.7691408' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'c025e52d-9f85-447c-9b08-45feb332f8e7', CAST(N'2019-07-21T01:21:22.6108456' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:23:14.7504736' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'725ef501-4c74-4b42-8e5a-4763e7fdd728', CAST(N'2019-07-21T01:23:56.2305212' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:20:18.0981495' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'5079d1af-deba-4774-b7f7-476f72f775c3', CAST(N'2019-07-21T01:24:23.1501158' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:21:32.0655710' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'56a71d30-5419-4695-a985-7f9d94804c0f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'61e2d5bf-e7d4-4fcc-947f-4787c5820a72', CAST(N'2019-07-21T01:21:50.0932387' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:21.3814004' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'd551c6c7-c50f-4d78-9c7c-d327847ac2f2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'8d527375-d21b-48ce-a83a-47f5ca080eb1', CAST(N'2019-07-21T01:15:25.7781444' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-08-01T19:28:43.4436767' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'2e81de17-f8bb-43e9-9c92-8217a17620d2', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'd5ef14ce-81d5-4c12-b4a7-4980adc8357f', CAST(N'2019-07-21T01:12:34.1943278' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:29.6184072' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'be6b9291-813c-4583-9177-466b6bf2840f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'0a8bfac5-5253-4194-9769-4a48578f8290', CAST(N'2019-07-21T01:22:12.9023694' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:50.7640982' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f059ebeb-fd09-4ead-ba46-4bbe3fdafad5', CAST(N'2019-07-21T01:16:06.4741900' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:46.0670576' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'c6a9b294-6e6c-468f-88da-4f8b14087b5d', CAST(N'2019-04-24T20:39:12.3970068' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'c1a52e30-a654-4a3f-9084-39466399819d', NULL, 0.7)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'68cd7d15-37c6-4eda-af00-54fe72415aa8', CAST(N'2019-07-21T01:18:23.9692362' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:08.8080833' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'da08d127-b83d-4847-9301-a26a82ae1a45', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'164feb9d-cf9e-4a19-8964-5644eed673a2', CAST(N'2019-07-21T01:15:25.7782294' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-08-01T19:28:43.4465061' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'2e81de17-f8bb-43e9-9c92-8217a17620d2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'494e439e-754d-47f2-8e9d-5b320dedd29b', CAST(N'2019-07-21T01:12:34.1942596' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:29.6168714' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'be6b9291-813c-4583-9177-466b6bf2840f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'ab22f20c-f5f2-4b6d-934e-5b8ce96267fb', CAST(N'2019-07-21T01:11:33.4748570' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:41:36.4320662' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'3d3e317d-9090-47bf-a425-f23aeae72726', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'13b553fe-a165-44a4-90cf-5c39c7a44a5b', CAST(N'2019-04-24T20:40:43.8461090' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'e37a13b9-1a92-4129-be1d-41f3af3ae95f', NULL, 0.85)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'745971c8-7b4f-4de1-80e5-67c0102f2a33', CAST(N'2019-07-21T01:24:23.1506072' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:21:32.0699112' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'56a71d30-5419-4695-a985-7f9d94804c0f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'2c634b2d-5e95-466b-a206-691d247d1267', CAST(N'2019-07-21T01:18:03.0917838' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:51.5892759' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'ab2adf1c-a7eb-43d5-a0ba-810afbd6921a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'816dd6cc-8fff-4f99-852d-69d5b14e31d9', CAST(N'2019-07-21T01:19:10.0073511' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:42:43.0158243' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'fe2a61c1-a19b-473b-9350-6a448c727a01', CAST(N'2019-04-24T20:40:43.8458885' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'e37a13b9-1a92-4129-be1d-41f3af3ae95f', NULL, 0.72)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'fc27dc9e-a377-4885-a829-6c47843185e8', CAST(N'2019-07-21T01:23:56.2304481' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:20:18.0954774' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f5b5a6d0-ce19-45c9-9742-6ecd596e997a', CAST(N'2019-07-21T01:17:12.1209671' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:56.6028525' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f60150f6-3838-4e0d-b17d-707b42c244a9', CAST(N'2019-04-24T20:39:48.1318412' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'99ef7c89-87db-4d33-896b-68715896841c', NULL, 0.63)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'ec2887f1-12d8-4eaf-97c4-707fe1271ffc', CAST(N'2019-07-21T01:12:34.1938516' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:29.6116675' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'be6b9291-813c-4583-9177-466b6bf2840f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'8703b5c4-b103-4703-be73-74e7420ef72c', CAST(N'2019-07-21T01:21:50.0930457' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:21.3763152' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'd551c6c7-c50f-4d78-9c7c-d327847ac2f2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'543a1b7c-058e-4e74-a6d8-74f328184a43', CAST(N'2019-07-21T01:11:33.4748948' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:41:36.4339144' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'3d3e317d-9090-47bf-a425-f23aeae72726', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3dc9fdb5-e76f-477c-99b9-75c77c05c422', CAST(N'2019-07-21T01:23:27.0904204' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:19.8254221' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'7d365e1e-f3d7-43c7-867d-08451cbaca10', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'b757e181-f354-43fb-be34-77038e55f95e', CAST(N'2019-07-21T01:22:51.9691029' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:25:47.4949610' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'bfd29c15-c884-4690-ad55-794d7c02202d', CAST(N'2019-07-21T01:19:10.0074262' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:42:43.0190851' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'9da23ace-9146-4ef5-9e99-79e0304d03a3', CAST(N'2019-07-21T01:21:50.0931517' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:21.3779475' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'd551c6c7-c50f-4d78-9c7c-d327847ac2f2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'68475a5e-29df-48e2-bfb3-82636a9ef77b', CAST(N'2019-07-21T01:21:22.6109659' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:23:14.7558142' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'03ce2bd4-48c6-4453-bcd1-85bed07eaf10', CAST(N'2019-07-21T01:11:33.4747942' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:41:36.4299253' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'3d3e317d-9090-47bf-a425-f23aeae72726', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'607fe5a2-e250-4e5d-88d4-8b8d502e05a0', CAST(N'2019-04-24T20:39:48.1318773' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'99ef7c89-87db-4d33-896b-68715896841c', NULL, 0.46)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'78dd1574-aae8-4226-b55a-8ba1d08ce0e4', CAST(N'2019-07-21T01:17:12.1210040' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:56.6044589' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'2fd1f652-bf9f-4b6b-b25b-8d5ffd96569f', CAST(N'2019-04-24T20:39:48.1318034' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'99ef7c89-87db-4d33-896b-68715896841c', NULL, 0.6)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f35748e9-895f-403b-bcab-8e584c304556', CAST(N'2019-07-21T01:18:23.9693467' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:08.8096056' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'da08d127-b83d-4847-9301-a26a82ae1a45', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'c45c8278-7486-4509-88b6-92d24ef1f408', CAST(N'2019-07-21T01:16:46.1396605' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:24:11.1270180' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'd007013b-892e-4067-9c99-532c30594cf9', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'1c08fce0-ab50-49d2-ac00-93332a31cb55', CAST(N'2019-07-21T01:24:23.1504077' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:21:32.0670818' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'56a71d30-5419-4695-a985-7f9d94804c0f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3c6b410f-7d00-4e7a-90a9-95321093500a', CAST(N'2019-07-21T01:24:23.1507016' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:21:32.0710270' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'56a71d30-5419-4695-a985-7f9d94804c0f', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'493acdae-7e5d-4cbf-ac50-9548702afc65', CAST(N'2019-07-21T01:20:21.6171050' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:34:02.8984308' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'fa35edec-b3f7-446c-8f37-f37d9506eaca', NULL, 0.06)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'573fcde0-7119-4fd3-85d4-960558056e5a', CAST(N'2019-04-24T20:40:19.8820980' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'59b1b12e-ba17-47d7-a0e6-4a742a4b7497', NULL, 0.19)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f7ad08bb-92e4-4adc-a6fc-967c2cab870c', CAST(N'2019-07-21T01:23:56.2304879' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:20:18.0969150' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'e255431e-a666-42fe-9884-99b493b1a302', CAST(N'2019-07-21T01:20:21.6168759' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:34:02.8900456' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'fa35edec-b3f7-446c-8f37-f37d9506eaca', NULL, 0.02)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'7b72782a-f5b5-4ac7-901e-9a35adbfd295', CAST(N'2019-04-24T20:39:48.1319134' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'99ef7c89-87db-4d33-896b-68715896841c', NULL, 0.66)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'efc21209-ac72-4a81-8478-9e4ee6edef11', CAST(N'2019-07-21T01:22:51.9693702' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:25:47.5052826' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c', NULL, 1)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3e37877c-19ac-4466-a14b-a525b95dea5f', CAST(N'2019-04-24T20:40:43.8460318' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'e37a13b9-1a92-4129-be1d-41f3af3ae95f', NULL, 0.78)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'5142989e-aeb9-462e-a6db-a558857b5ff6', CAST(N'2019-07-21T01:22:51.9692942' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:25:47.5033267' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'6d18c549-c020-4694-9cb0-a616c8eb06e7', CAST(N'2019-04-24T20:40:43.8460737' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'e37a13b9-1a92-4129-be1d-41f3af3ae95f', NULL, 0.86)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'79f48f4f-831a-45d8-96e3-ada41aa82deb', CAST(N'2019-07-21T01:19:10.0073905' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:42:43.0176388' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'03cc260a-91d4-488e-9dbe-ae6383eedbcd', CAST(N'2019-07-21T01:18:23.9694653' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:08.8141231' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'da08d127-b83d-4847-9301-a26a82ae1a45', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'6ba5681a-c6f5-4e1d-a88a-aeb1a1c1eba0', CAST(N'2019-07-21T01:16:06.4739375' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:46.0605786' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'e5120b51-0c0c-47a5-9fd0-b1bd15bb7e82', CAST(N'2019-07-21T01:16:46.1394696' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:24:11.1236003' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'd007013b-892e-4067-9c99-532c30594cf9', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'42a2f772-f517-4bbe-9823-b1c53644692d', CAST(N'2019-07-21T01:13:17.0180576' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:42.4633300' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'5bb042c3-5036-445f-be41-e7396ffa94b5', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'7216f8fc-b46f-4c08-9717-b1fe9cad9b1f', CAST(N'2019-04-24T20:39:12.3762639' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'c1a52e30-a654-4a3f-9084-39466399819d', NULL, 0.18)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'c8a18f7f-3f98-490b-909b-b20b09f9d3f4', CAST(N'2019-07-21T01:12:34.1941911' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:29.6149603' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'be6b9291-813c-4583-9177-466b6bf2840f', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'ed65eccf-e0f3-4293-956b-b32f3924caf5', CAST(N'2019-04-24T20:40:19.8819112' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'59b1b12e-ba17-47d7-a0e6-4a742a4b7497', NULL, 0.47)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'9fe26ccd-22de-497e-8b74-b756b05f4509', CAST(N'2019-07-21T01:18:03.0915551' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:51.5817874' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'ab2adf1c-a7eb-43d5-a0ba-810afbd6921a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'25d70fe1-c294-4a9f-965a-b87970b2b64d', CAST(N'2019-07-21T01:20:54.1061961' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:20.5554884' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'06ca1bab-695e-4ee4-822a-f6bc9db87bce', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'fe3290a5-9ac7-4636-8cc7-b942f3524306', CAST(N'2019-07-21T01:23:27.0902410' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:19.8237783' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'7d365e1e-f3d7-43c7-867d-08451cbaca10', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3938ccb4-ebee-44ab-85a3-b9480dc552a5', CAST(N'2019-07-21T01:21:50.0932058' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:21.3798388' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'd551c6c7-c50f-4d78-9c7c-d327847ac2f2', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'fed766b2-1478-4ced-9fac-bb492e13261d', CAST(N'2019-07-21T01:19:10.0072415' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:42:43.0143853' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'27b3ed6d-0474-4025-ab3e-bf74fe4a74da', CAST(N'2019-07-21T01:20:54.1062438' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:20.5571605' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'06ca1bab-695e-4ee4-822a-f6bc9db87bce', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'05bb0c92-c42b-4371-9de1-c3e97e9e943e', CAST(N'2019-07-21T01:19:44.7771173' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:22:44.3933403' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'd8e376bd-e278-4a8d-bb98-828daf9c3384', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'f10ae252-98c4-4f35-b9e3-c8b6aa6a0d19', CAST(N'2019-07-21T01:15:25.7781050' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-08-01T19:28:43.4421866' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'2e81de17-f8bb-43e9-9c92-8217a17620d2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'd30705f4-a21b-449f-ab2d-cae206f4ee2b', CAST(N'2019-04-24T20:40:19.8820602' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'59b1b12e-ba17-47d7-a0e6-4a742a4b7497', NULL, 0.71)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'4d8f5830-f4bd-41f5-a631-cbe4ea15bd83', CAST(N'2019-07-21T01:19:44.7771620' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:22:44.3951548' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'd8e376bd-e278-4a8d-bb98-828daf9c3384', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'233f25a2-8fa0-4286-81ff-cc6f3498fc98', CAST(N'2019-07-21T01:11:33.4725314' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-25T19:41:36.4272675' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'3d3e317d-9090-47bf-a425-f23aeae72726', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'081329c5-5c5b-480f-b501-cd7a847d067b', CAST(N'2019-07-21T01:19:44.7772072' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:22:44.3966402' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'd8e376bd-e278-4a8d-bb98-828daf9c3384', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'924c95e2-15d8-4da3-80a8-ceca53ee04b7', CAST(N'2019-07-21T01:19:44.7770032' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:22:44.3916699' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'd8e376bd-e278-4a8d-bb98-828daf9c3384', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'47d20d5b-6c2c-4ee0-9a02-cf048f0ba887', CAST(N'2019-07-21T01:20:54.1062766' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:20.5583539' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'06ca1bab-695e-4ee4-822a-f6bc9db87bce', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'dfb42b07-7752-438a-a132-d00173f0470a', CAST(N'2019-04-24T20:39:12.3972424' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'c1a52e30-a654-4a3f-9084-39466399819d', NULL, 0.42)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'571242c6-e25b-48ea-9785-d48ba4f8964d', CAST(N'2019-07-21T01:16:06.4741481' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:46.0656618' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'378cb9b1-837c-4361-bdab-d5c47702578a', CAST(N'2019-04-24T20:40:43.8461439' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'e37a13b9-1a92-4129-be1d-41f3af3ae95f', NULL, 0.24)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'7eb143f0-1f4f-40f8-9eac-d631368475bd', CAST(N'2019-04-24T20:39:12.3972933' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'c1a52e30-a654-4a3f-9084-39466399819d', NULL, 0.39)
GO
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'9bc66eb3-a854-4f30-9d53-d92ef63013c0', CAST(N'2019-07-21T01:17:12.1207753' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:19:56.5997436' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'bb91cab4-72dd-47bd-9632-d9b73d630e83', CAST(N'2019-07-21T01:23:56.2302929' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:20:18.0921340' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'2372911b-873d-433b-acfc-d9bce0017f8c', CAST(N'2019-07-21T01:22:12.9024149' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:50.7655335' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'9f414831-7a7e-46ec-b60a-dcfad484f63c', CAST(N'2019-07-21T01:20:21.6169868' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:34:02.8921357' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'fa35edec-b3f7-446c-8f37-f37d9506eaca', NULL, 0.01)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'73172a56-eccc-4f2d-ab1f-dd18f4dbbddf', CAST(N'2019-07-21T01:21:22.6107073' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:23:14.7490984' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'144da041-6419-49d9-b037-dee54865512b', CAST(N'2019-07-21T01:18:03.0917058' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:51.5846262' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'ab2adf1c-a7eb-43d5-a0ba-810afbd6921a', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'fc45dd61-a1d4-4964-a8db-e1d490b6f4d4', CAST(N'2019-07-21T01:21:50.0932715' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:15:21.3829641' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'd551c6c7-c50f-4d78-9c7c-d327847ac2f2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'951e25ee-9598-4987-909f-e3cac5932c41', CAST(N'2019-07-21T01:15:25.7779954' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-08-01T19:28:43.4394577' AS DateTime2), N'admin', N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'2e81de17-f8bb-43e9-9c92-8217a17620d2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'd4195a88-72f7-4192-9158-e7be794343b4', CAST(N'2019-07-21T01:13:17.0179739' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:18:42.4567074' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'5bb042c3-5036-445f-be41-e7396ffa94b5', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'25389e09-0d16-49a4-8a4a-e8269c9f21e8', CAST(N'2019-07-21T01:16:46.1397368' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:24:11.1306554' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'd007013b-892e-4067-9c99-532c30594cf9', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'2eccaeec-ecd8-4fe6-b7d2-e9b0698dc15c', CAST(N'2019-04-24T20:40:19.8820154' AS DateTime2), N'admin', NULL, N'admin', NULL, NULL, N'c7aed907-5f37-4e16-3561-08d6c0c2a23f', N'59b1b12e-ba17-47d7-a0e6-4a742a4b7497', NULL, 0.88)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'd6892c19-00c7-4e31-9c45-e9d0eb7dbe90', CAST(N'2019-07-21T01:15:25.7781871' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-08-01T19:28:43.4448163' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'2e81de17-f8bb-43e9-9c92-8217a17620d2', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'12570f0e-e676-4efd-a296-eaa359bb05e8', CAST(N'2019-07-21T01:22:51.9692183' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:25:47.4965132' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'49afcea2-db71-4d33-94fb-88b8c1c5f85c', NULL, 1)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'32be5bd7-7f58-42a3-9052-f024c12ebd0b', CAST(N'2019-07-21T01:16:46.1396042' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:24:11.1254629' AS DateTime2), N'admin', N'731ac174-68ad-40e6-3560-08d6c0c2a23f', N'd007013b-892e-4067-9c99-532c30594cf9', NULL, 0.75)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'678e4e63-afc0-4c27-8f6e-f1a46510468a', CAST(N'2019-07-21T01:20:21.6170709' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:34:02.8957480' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'fa35edec-b3f7-446c-8f37-f37d9506eaca', NULL, 0.02)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'38c23432-2cfc-44b6-9d54-f23b494d923e', CAST(N'2019-07-21T01:16:06.4741140' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:46.0638940' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'145f4384-4bd4-49c5-bc84-fa131f7278d1', CAST(N'2019-07-21T01:23:27.0904622' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:17:19.8269098' AS DateTime2), N'admin', N'f4798c18-0f45-4eec-3562-08d6c0c2a23f', N'7d365e1e-f3d7-43c7-867d-08451cbaca10', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'a4b2be78-00b6-4c76-b56e-fc2068f5f576', CAST(N'2019-07-21T01:19:44.7772400' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:22:44.3981989' AS DateTime2), N'admin', N'5740283d-f13c-4e47-355e-08d6c0c2a23f', N'd8e376bd-e278-4a8d-bb98-828daf9c3384', NULL, 0.5)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'3f943b1b-5736-45bc-aceb-fd97d90597ae', CAST(N'2019-07-21T01:22:12.9024494' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:16:50.7673981' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', NULL, 0.25)
INSERT [dbo].[Rating] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [CriteriaId], [TaskId], [Notes], [Value]) VALUES (N'0db752a6-d07e-4958-ac41-fee55170d4f9', CAST(N'2019-07-21T01:16:46.1396950' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-07-26T20:24:11.1291195' AS DateTime2), N'admin', N'6ce5bea1-9dbd-45fc-355f-08d6c0c2a23f', N'd007013b-892e-4067-9c99-532c30594cf9', NULL, 0.75)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'7d365e1e-f3d7-43c7-867d-08451cbaca10', CAST(N'2019-07-21T01:09:49.3626377' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.5745452' AS DateTime2), N'admin', N'W772', N'Update project manager table show atleast 15 items', 10, 0.88555, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'1d5aa034-d992-43e3-ab41-310a9ade3dd3', CAST(N'2019-07-21T01:09:59.4895556' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6211454' AS DateTime2), N'admin', N'W776', N'Top assembly number', 18, 0.5, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'c1a52e30-a654-4a3f-9084-39466399819d', CAST(N'2019-04-14T18:19:52.2980677' AS DateTime2), N'admin', CAST(N'2019-07-21T02:21:13.6818261' AS DateTime2), N'admin', CAST(N'2019-04-24T21:28:35.8434943' AS DateTime2), N'admin', N'W710', N'Add backup/ restore project function', 24, 0, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'4e75db09-0275-4a7d-8bbb-3a4b02d0a38e', CAST(N'2019-07-21T01:05:56.6183796' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6282496' AS DateTime2), N'admin', N'W721', N'Batch edit function', 14, 0.74125, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'bed8a471-6dc4-4226-83b4-3c1a729c1e85', CAST(N'2019-07-21T01:08:38.9778968' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6354729' AS DateTime2), N'admin', N'W755', N'Configuration function', 9, 0.42478333333333329, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'e37a13b9-1a92-4129-be1d-41f3af3ae95f', CAST(N'2019-04-14T18:14:11.1716215' AS DateTime2), N'admin', CAST(N'2019-07-21T02:20:15.4175616' AS DateTime2), N'admin', CAST(N'2019-04-24T21:28:35.8819178' AS DateTime2), N'admin', N'F-0002', N'Create Payment Page', 22, 0, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Feature', NULL, CAST(N'2019-04-21T20:50:53.4020929' AS DateTime2), NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'be6b9291-813c-4583-9177-466b6bf2840f', CAST(N'2019-07-21T01:05:07.7124220' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6421268' AS DateTime2), N'admin', N'W712', N'Project import function', 17, 0.69934999999999992, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Feature', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'59b1b12e-ba17-47d7-a0e6-4a742a4b7497', CAST(N'2019-04-14T18:03:20.0057691' AS DateTime2), N'admin', CAST(N'2019-07-21T02:20:11.0914754' AS DateTime2), N'admin', CAST(N'2019-04-24T21:28:35.8857008' AS DateTime2), N'admin', N'F-0001', N'Create catalog page with wishlist', 23, 0, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Feature', CAST(N'2019-04-14T18:04:45.2353894' AS DateTime2), CAST(N'2019-04-14T18:04:42.1780434' AS DateTime2), NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'ac2a2ce4-b9aa-4a17-a7b8-51c37e08dcef', CAST(N'2019-09-03T22:48:54.0698609' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-03T22:50:28.6693967' AS DateTime2), N'staff', N'DM1', N'Dummy Task', NULL, 0, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Finish', N'Task', CAST(N'2019-09-03T22:50:28.6692390' AS DateTime2), CAST(N'2019-09-03T22:50:24.2492791' AS DateTime2), NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'd007013b-892e-4067-9c99-532c30594cf9', CAST(N'2019-07-21T01:06:08.4384361' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6491563' AS DateTime2), N'admin', N'W727', N'Create multi-language framework', 1, 0.32061666666666666, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'99ef7c89-87db-4d33-896b-68715896841c', CAST(N'2019-04-19T20:42:13.8635430' AS DateTime2), N'admin', CAST(N'2019-07-21T02:20:05.5211487' AS DateTime2), N'admin', CAST(N'2019-04-24T21:28:35.8893459' AS DateTime2), N'admin', N'B-0002', N'Add product data failed', 22, 0, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Bug', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'56a71d30-5419-4695-a985-7f9d94804c0f', CAST(N'2019-07-21T01:10:20.8696058' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6570759' AS DateTime2), N'admin', N'W777', N'Spring number', 18, 0.5, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'8ddbb142-1fa3-477d-97fb-7fb80edc863a', CAST(N'2019-07-21T01:07:17.9227668' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6637408' AS DateTime2), N'admin', N'W746', N'Create sizing ui', 4, 0.96184999999999987, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, CAST(N'2019-08-01T21:33:10.3484813' AS DateTime2), NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'ab2adf1c-a7eb-43d5-a0ba-810afbd6921a', CAST(N'2019-07-21T01:06:42.2080513' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6707334' AS DateTime2), N'admin', N'W738', N'Create ui for language selection on project print', 10, 0.88555000000000006, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'2e81de17-f8bb-43e9-9c92-8217a17620d2', CAST(N'2019-07-21T01:05:43.9703726' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6774275' AS DateTime2), N'admin', N'W720', N'Create batch edit ui', 5, 0.9237, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Task', CAST(N'2019-08-01T21:46:22.2396697' AS DateTime2), CAST(N'2019-08-01T21:45:32.6966695' AS DateTime2), NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'd8e376bd-e278-4a8d-bb98-828daf9c3384', CAST(N'2019-07-21T01:07:44.9780729' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6840875' AS DateTime2), N'admin', N'W747', N'sizing function', 7, 0.45773333333333333, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'282805b2-6f21-457c-a795-84001aefb98a', CAST(N'2019-09-04T18:11:18.3587023' AS DateTime2), N'admin', CAST(N'2019-09-04T18:11:25.6724601' AS DateTime2), N'admin', NULL, NULL, N'DM4', N'Test Delete Task', NULL, 0, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', NULL, N'Pending', N'Feature', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'49afcea2-db71-4d33-94fb-88b8c1c5f85c', CAST(N'2019-07-21T01:09:37.9645907' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6907558' AS DateTime2), N'admin', N'W771', N'Cost engine development', 3, 0.4082, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Feature', NULL, NULL, 2)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'da08d127-b83d-4847-9301-a26a82ae1a45', CAST(N'2019-07-21T01:06:52.9999981' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.6973427' AS DateTime2), N'admin', N'W739', N'Create save function ', 14, 0.74125, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'48d516ce-a346-4745-a7ac-a5f8d576d61f', CAST(N'2019-09-03T23:16:33.7239200' AS DateTime2), N'admin', NULL, NULL, NULL, NULL, N'DM3', N'DM3 Description1', NULL, 0, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', NULL, N'Pending', N'Feature', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'7a5962b2-0f6e-4084-a80a-afcf981500df', CAST(N'2019-09-03T22:50:51.7581809' AS DateTime2), N'staff', NULL, NULL, CAST(N'2019-09-03T23:17:26.4923225' AS DateTime2), N'admin', N'DM2', N'test', NULL, 0, N'8dbbcf23-29c5-4b32-b700-4ae579de35af', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Bug', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'82476b05-5fc2-49f5-b6d7-cd3dd59d684f', CAST(N'2019-07-21T01:09:03.9044482' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.7041308' AS DateTime2), N'admin', N'W769', N'Collateral ui', 10, 0.88555000000000006, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'd551c6c7-c50f-4d78-9c7c-d327847ac2f2', CAST(N'2019-07-21T01:08:49.0987529' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.7107429' AS DateTime2), N'admin', N'W762', N'Price summary ui', 5, 0.9237, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Bug', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'5bb042c3-5036-445f-be41-e7396ffa94b5', CAST(N'2019-07-21T01:05:20.6166440' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.7175458' AS DateTime2), N'admin', N'W713', N'Project export function', 16, 0.72059999999999991, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Feature', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'3d3e317d-9090-47bf-a425-f23aeae72726', CAST(N'2019-07-21T01:04:01.6950221' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.7241762' AS DateTime2), N'admin', N'W710', N'Add backup/ restore project function', 13, 0.77231666666666665, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', N'5e45a1db-0cf0-4850-b71c-1c55b02d8226', N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'fa35edec-b3f7-446c-8f37-f37d9506eaca', CAST(N'2019-07-21T01:08:00.7631499' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:34:02.8984600' AS DateTime2), N'admin', N'W749', N'Add autosizing function', NULL, 0, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'06ca1bab-695e-4ee4-822a-f6bc9db87bce', CAST(N'2019-07-21T01:08:14.4508189' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.7375632' AS DateTime2), N'admin', N'W754', N'Configuration ui', 8, 0.88555000000000006, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Task', NULL, NULL, NULL)
INSERT [dbo].[Task] ([Id], [CreatedDate], [CreatedBy], [DeletedDate], [DeletedBy], [UpdatedDate], [UpdatedBy], [Name], [Description], [Rank], [Score], [ProjectId], [AssignUserId], [Status], [Type], [FinishDate], [StartDate], [Prioritize]) VALUES (N'6fc03d40-77e6-4cf0-af64-fd04587ed3e8', CAST(N'2019-07-21T01:06:18.9258216' AS DateTime2), N'admin', NULL, NULL, CAST(N'2019-09-04T19:32:39.7454356' AS DateTime2), N'admin', N'W734', N'Update print proposal function', 2, 0.61785, N'7c06ed2a-5e62-4d04-a1b8-de89601727f1', NULL, N'Pending', N'Bug', NULL, NULL, 1)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Criteria_ProjectId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Criteria_ProjectId] ON [dbo].[Criteria]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Member_ProjectId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Member_ProjectId] ON [dbo].[Member]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Note_TaskId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Note_TaskId] ON [dbo].[Note]
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rating_CriteriaId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_CriteriaId] ON [dbo].[Rating]
(
	[CriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rating_TaskId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_TaskId] ON [dbo].[Rating]
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Task_ProjectId]    Script Date: 11/06/2020 10:52:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Task_ProjectId] ON [dbo].[Task]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (N'') FOR [Code]
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
ALTER TABLE [dbo].[Criteria]  WITH CHECK ADD  CONSTRAINT [FK_Criteria_Project_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Criteria] CHECK CONSTRAINT [FK_Criteria_Project_ProjectId]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Project_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Project_ProjectId]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Task_TaskId] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Task_TaskId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Criteria_CriteriaId] FOREIGN KEY([CriteriaId])
REFERENCES [dbo].[Criteria] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Criteria_CriteriaId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Task_TaskId] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Task_TaskId]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project_ProjectId]
GO
USE [master]
GO
ALTER DATABASE [PPC] SET  READ_WRITE 
GO
