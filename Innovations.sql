/*
** Copyright Neven Dujmovic 2020
** All Rights Reserved.
*/

USE [master]
GO
/****** Object:  Database [Innovations]    Script Date: 20.7.2020. 15:44:44 ******/
CREATE DATABASE [Innovations]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Innovations', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Innovations.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Innovations_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Innovations_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Innovations] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Innovations].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Innovations] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Innovations] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Innovations] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Innovations] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Innovations] SET ARITHABORT OFF 
GO
ALTER DATABASE [Innovations] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Innovations] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Innovations] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Innovations] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Innovations] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Innovations] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Innovations] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Innovations] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Innovations] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Innovations] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Innovations] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Innovations] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Innovations] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Innovations] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Innovations] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Innovations] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Innovations] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Innovations] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Innovations] SET  MULTI_USER 
GO
ALTER DATABASE [Innovations] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Innovations] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Innovations] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Innovations] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Innovations] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Innovations] SET QUERY_STORE = OFF
GO
USE [Innovations]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[ID] [int] NOT NULL,
	[TITLE] [nvarchar](255) NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorsInnovations]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorsInnovations](
	[EMPLOYEE_ID] [int] NOT NULL,
	[INNOVATION_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credits]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credits](
	[ID] [int] NOT NULL,
	[GRADE] [int] NULL,
	[INNOVATION_ID] [int] NULL,
	[SPONZOR_ID] [int] NULL,
 CONSTRAINT [PK_Credits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[AREA_ID] [int] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DevelopersProjects]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevelopersProjects](
	[EMPLOYEE_ID] [int] NOT NULL,
	[PROJECT_ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EMPLOYEE_ID] [int] NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[SURNAME] [nvarchar](255) NULL,
	[DEPARTMENT] [int] NULL,
	[IBAN_NUMBER] [nvarchar](255) NULL,
	[GENDER] [nvarchar](255) NULL,
	[EXTERNAL] [bit] NOT NULL,
	[UNION_STATUS] [int] NULL,
	[DISABILITY_PERCENTAGE] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EMPLOYEE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSkills]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSkills](
	[EMPLOYEE_ID] [int] NULL,
	[SKILL_ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Innovations]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Innovations](
	[INNOVATION_ID] [int] NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[CATEGORY_ID] [int] NULL,
 CONSTRAINT [PK_Innovations] PRIMARY KEY CLUSTERED 
(
	[INNOVATION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Methodologies]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Methodologies](
	[ID] [int] NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
 CONSTRAINT [PK_Methodologies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[SPONSOR_ID] [int] NULL,
	[METHODOLOGY_ID] [int] NULL,
	[BUDGET] [money] NULL,
	[INNOVATION_ID] [int] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[ID] [int] NOT NULL,
	[NAME] [nvarchar](255) NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solutions]    Script Date: 20.7.2020. 15:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solutions](
	[ID] [int] NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[PROJECT_ID] [int] NULL,
 CONSTRAINT [PK_Solutions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (1, N'CEO')
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (2, N'CTO')
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (3, N'CHRO')
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (4, N'COO-B')
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (5, N'COO-R')
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (6, N'CFO')
INSERT [dbo].[Areas] ([ID], [TITLE]) VALUES (7, N'CMO')
GO
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 1)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 2)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 3)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (19, 3)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 4)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 5)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 6)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 7)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 8)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 8)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 9)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 9)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 9)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 9)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 10)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 11)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 12)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 12)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (19, 13)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 14)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 15)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 15)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 16)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (17, 17)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 18)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 19)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 20)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (17, 21)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (17, 22)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 22)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (19, 22)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 22)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 23)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 24)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 24)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 25)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 26)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 27)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 28)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (17, 29)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 30)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (19, 31)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 32)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (15, 33)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 34)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (17, 35)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 36)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (19, 37)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (20, 38)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (16, 39)
INSERT [dbo].[AuthorsInnovations] ([EMPLOYEE_ID], [INNOVATION_ID]) VALUES (18, 40)
GO
INSERT [dbo].[Categories] ([ID], [NAME], [DESCRIPTION]) VALUES (1, N'Process design', N'Process Improvement is the proactive task of identifying, analyzing and improving upon existing business processes within an organization for optimization and to meet new quotas or standards of quality.')
INSERT [dbo].[Categories] ([ID], [NAME], [DESCRIPTION]) VALUES (2, N'System design', N'he System Improvement Process was developed from scratch to solve large-scale difficult social problems, especially the sustainability problem.')
INSERT [dbo].[Categories] ([ID], [NAME], [DESCRIPTION]) VALUES (3, N'Quality  improvement', N'Quality improvement (QI) is a systematic, formal approach to the analysis of practice performance and efforts to improve performance.')
INSERT [dbo].[Categories] ([ID], [NAME], [DESCRIPTION]) VALUES (4, N'Risk reduction', N'Risk avoidance and risk reduction are two ways to manage risk. Risk avoidance deals with eliminating any exposure to risk that poses a potential loss, while risk reduction deals with reducing the likelihood and severity of a possible loss.')
GO
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (1, 5, 1, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (2, 7, 2, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (3, 1, 3, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (4, 10, 4, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (5, 9, 5, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (6, 7, 6, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (7, 10, 7, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (8, 5, 8, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (9, 6, 9, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (10, 4, 10, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (11, 7, 11, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (12, 8, 12, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (13, 9, 13, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (14, 10, 14, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (15, 3, 15, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (16, 5, 16, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (17, 2, 17, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (18, 2, 18, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (19, 6, 19, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (20, 7, 20, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (21, 9, 21, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (22, 10, 22, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (23, 9, 23, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (24, 6, 24, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (25, 2, 25, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (26, 6, 26, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (27, 7, 27, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (28, 4, 28, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (29, 2, 29, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (30, 6, 30, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (31, 9, 31, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (32, 10, 32, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (33, 3, 33, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (34, 5, 34, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (35, 5, 35, 3)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (36, 4, 36, 4)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (37, 8, 37, 5)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (38, 8, 38, 2)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (39, 9, 39, 1)
INSERT [dbo].[Credits] ([ID], [GRADE], [INNOVATION_ID], [SPONZOR_ID]) VALUES (40, 10, 40, 5)
GO
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (1, N'IT', 2)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (2, N'Residential sales', 5)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (3, N'Business sales', 4)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (4, N'Accounting', 6)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (5, N'Product development', 7)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (6, N'Security', 1)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (7, N'Legal', 1)
INSERT [dbo].[Departments] ([ID], [NAME], [AREA_ID]) VALUES (8, N'Recruitment', 3)
GO
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (7, 1)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (13, 1)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (14, 1)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (7, 2)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (9, 2)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (10, 2)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (11, 2)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (6, 3)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (7, 3)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (2, 4)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (4, 4)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (5, 4)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (8, 4)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (7, 5)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (8, 5)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (9, 6)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (11, 6)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (1, 7)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (2, 7)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (4, 7)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (8, 7)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (2, 8)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (3, 8)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (7, 9)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (2, 10)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (5, 10)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (7, 11)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (8, 11)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (10, 11)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (11, 11)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (4, 12)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (8, 12)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (10, 4)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (14, 7)
INSERT [dbo].[DevelopersProjects] ([EMPLOYEE_ID], [PROJECT_ID]) VALUES (6, 9)
GO
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (1, N'Lexi-Mai', N'Patterson', 5, N'GB57BARC20038417861534', N'1', 0, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (2, N'Alexandria', N'Pugh', 1, N'ES6020389835775692258659', N'1', 1, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (3, N'Isa', N'Owen', 1, N'LU710101542878446957', N'1', 0, 0, 20)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (4, N'Montel', N'Hull', 4, N'IS132517232184162478542172', N'2', 1, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (5, N'Ashley', N'Head', 7, N'EG2077232583858533241828981', N'1', 0, 1, 30)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (6, N'Merryn', N'Mcconnell', 8, N'CG3531584957316783941449922', N'1', 0, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (7, N'Bridget', N'Muir', 4, N'BR4814582188175712178965188V2', N'1', 1, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (8, N'Umayr', N'Ruiz', 2, N'BE33798587773846', N'2', 0, 0, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (9, N'Layan', N'Harris', 3, N'BH23HAXD35563413755977', N'2', 0, 1, 25)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (10, N'Ariadne', N'Diaz', 4, N'SE9472776624645962678769', N'1', 0, 0, 5)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (11, N'Kadeem', N'Patrick', 5, N'SK9772457257743967616643', N'2', 1, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (12, N'Kristin', N'Pham', 1, N'TR360006223484814918959985', N'1', 0, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (13, N'Matt', N'Webb', 2, N'UA309517965878233525716598491', N'2', 0, 1, 10)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (14, N'Nafeesa', N'Cunningham', 6, N'SN69I31791893376417723625345', N'1', 0, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (15, N'Avleen', N'Yoder', 4, N'MC0412739000506761844657P71', N'1', 0, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (16, N'John', N'Lord', 7, N'IT82G0300203280117763862862', N'2', 1, 1, 15)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (17, N'Humphrey', N'Croft', 3, N'EE831226426865349933', N'2', 1, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (18, N'Cassidy', N'Conroy', 5, N'AT053219591992354133', N'2', 0, 0, 20)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (19, N'Aedan', N'Houghton', 4, N'AZ20RFST68667246553572677869', N'2', 0, 1, 0)
INSERT [dbo].[Employees] ([EMPLOYEE_ID], [NAME], [SURNAME], [DEPARTMENT], [IBAN_NUMBER], [GENDER], [EXTERNAL], [UNION_STATUS], [DISABILITY_PERCENTAGE]) VALUES (20, N'Mark', N'Gold', 3, N'AO02567947815115618429686', N'2', 1, 1, 25)
GO
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (1, 9)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (2, 3)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (3, 41)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (4, 22)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (4, 7)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (1, 23)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (5, 4)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (6, 1)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (7, 34)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (8, 2)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (8, 8)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (8, 25)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (8, 44)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (9, 52)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (10, 31)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (11, 33)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (12, 27)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (12, 7)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (12, 17)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (12, 26)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (12, 46)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (13, 49)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (14, 11)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (15, 6)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (15, 9)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (16, 20)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (17, 32)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (18, 22)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (19, 3)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (19, 5)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (20, 8)
INSERT [dbo].[EmployeeSkills] ([EMPLOYEE_ID], [SKILL_ID]) VALUES (20, 19)
GO
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (1, N'Innovation 1', N'Description of innovation 1', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (2, N'Innovation 2', N'Description of innovation 2', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (3, N'Innovation 3', N'Description of innovation 3', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (4, N'Innovation 4', N'Description of innovation 4', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (5, N'Innovation 5', N'Description of innovation 5', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (6, N'Innovation 6', N'Description of innovation 6', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (7, N'Innovation 7', N'Description of innovation 7', 4)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (8, N'Innovation 8', N'Description of innovation 8', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (9, N'Innovation 9', N'Description of innovation 9', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (10, N'Innovation 10', N'Description of innovation 10', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (11, N'Innovation 11', N'Description of innovation 11', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (12, N'Innovation 12', N'Description of innovation 12', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (13, N'Innovation 13', N'Description of innovation 13', 4)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (14, N'Innovation 14', N'Description of innovation 14', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (15, N'Innovation 15', N'Description of innovation 15', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (16, N'Innovation 16', N'Description of innovation 16', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (17, N'Innovation 17', N'Description of innovation 17', 4)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (18, N'Innovation 18', N'Description of innovation 18', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (19, N'Innovation 19', N'Description of innovation 19', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (20, N'Innovation 20', N'Description of innovation 20', 4)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (21, N'Innovation 21', N'Description of innovation 21', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (22, N'Innovation 22', N'Description of innovation 22', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (23, N'Innovation 23', N'Description of innovation 23', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (24, N'Innovation 24', N'Description of innovation 24', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (25, N'Innovation 25', N'Description of innovation 25', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (26, N'Innovation 26', N'Description of innovation 26', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (27, N'Innovation 27', N'Description of innovation 27', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (28, N'Innovation 28', N'Description of innovation 28', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (29, N'Innovation 29', N'Description of innovation 29', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (30, N'Innovation 30', N'Description of innovation 30', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (31, N'Innovation 31', N'Description of innovation 31', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (32, N'Innovation 32', N'Description of innovation 32', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (33, N'Innovation 33', N'Description of innovation 33', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (34, N'Innovation 34', N'Description of innovation 34', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (35, N'Innovation 35', N'Description of innovation 35', 1)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (36, N'Innovation 36', N'Description of innovation 36', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (37, N'Innovation 37', N'Description of innovation 37', 2)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (38, N'Innovation 38', N'Description of innovation 38', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (39, N'Innovation 39', N'Description of innovation 39', 3)
INSERT [dbo].[Innovations] ([INNOVATION_ID], [TITLE], [DESCRIPTION], [CATEGORY_ID]) VALUES (40, N'Innovation 40', N'Description of innovation 40', 4)
GO
INSERT [dbo].[Methodologies] ([ID], [NAME], [DESCRIPTION]) VALUES (1, N'Waterfall', N'Waterfall is a linear, sequential design approach where progress flows downwards in one direction .')
INSERT [dbo].[Methodologies] ([ID], [NAME], [DESCRIPTION]) VALUES (2, N'Scrum', N'Scrum is comprised of five values: commitment, courage, focus, openness, and respect. It’s goal is to develop, deliver, and sustain complex products through collaboration, accountability, and iterative progress. What distinguishes Scrum from the other Agile project management methodologies is how it operates by using certain roles, events, and artifacts.')
INSERT [dbo].[Methodologies] ([ID], [NAME], [DESCRIPTION]) VALUES (3, N'Agile', N'Agile is best suited for projects that are iterative and incremental.')
INSERT [dbo].[Methodologies] ([ID], [NAME], [DESCRIPTION]) VALUES (4, N'Kanban', N'Kanban is another popular Agile framework that, similar to Scrum, focuses on early releases with collaborative and self-managing teams. A concept that was developed on the production line of Toyota factories in the 1940s, it is very visual method that aims to deliver high quality results by painting a picture of the workflow process so that bottlenecks can be identified early on in the development process.')
GO
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (1, N'Project 1', 2, 1, 50000.0000, 19)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (2, N'Project 2', 3, 2, 17000.0000, 2)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (3, N'Project 3', 5, 3, 2000000.0000, 7)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (4, N'Project 4', 1, 3, 40000.0000, 39)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (5, N'Project 5', 2, 1, 40000.0000, 1)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (6, N'Project 6', 5, 4, 560000.0000, 5)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (7, N'Project 7', 2, 3, 740000.0000, 18)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (8, N'Project 8', 4, 2, 80000.0000, 12)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (9, N'Project 9', 2, 3, 80500.0000, 10)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (10, N'Project 10', 3, 1, 1500000.0000, 9)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (11, N'Project 11', 5, 1, 100000.0000, 11)
INSERT [dbo].[Projects] ([ID], [TITLE], [SPONSOR_ID], [METHODOLOGY_ID], [BUDGET], [INNOVATION_ID]) VALUES (12, N'Project 12', 2, 2, 10000.0000, 27)
GO
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (1, N'COMPUTER LITERATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (2, N'PLAN, ORGANIZE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (3, N'OBSERVE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (4, N'MAINTAIN RECORDS')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (5, N'TEACH, TRAIN')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (6, N'INTERVIEW FOR INFORMATION')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (7, N'CUSTOMER SERVICE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (8, N'ADAPT TO CHANGE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (9, N'WORK WITH NUMBERS')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (10, N'CONCEPTUALIZE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (11, N'MEDIATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (12, N'CLASSIFY')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (13, N'MAKE ARRANGEMENTS')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (14, N'BUDGET')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (15, N'ENTERTAIN-PERFORM')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (16, N'READ FOR INFORMATION')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (17, N'INITIATE CHANGE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (18, N'DEAL WITH AMBIGUITY')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (19, N'DELEGATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (20, N'MONITOR')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (21, N'PERCEIVE INTUITIVELY')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (22, N'PROOFREAD, EDIT')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (23, N'MAKE DECISIONS')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (24, N'SELL')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (25, N'NEGOTIATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (26, N'DESIGN')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (27, N'MANAGE TIME')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (28, N'COUNSEL')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (29, N'DEAL WITH FEELINGS')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (30, N'EXPEDITE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (31, N'IMPROVISE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (32, N'MOTIVATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (33, N'USE MECHANICAL ABILITIES')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (34, N'IMPLEMENT')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (35, N'PORTRAY IMAGES')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (36, N'ACT AS LIASON')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (37, N'ANALYZE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (38, N'TEAM WORK')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (39, N'SUPERVISE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (40, N'TEST')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (41, N'VISUALIZE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (42, N'STRATEGIZE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (43, N'INNOVATE-INVENT')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (44, N'GENERATE IDEAS')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (45, N'WRITE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (46, N'EVALUATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (47, N'SYNTHESIZE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (48, N'ESTIMATE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (49, N'MENTOR')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (50, N'MULTI-TASK')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (51, N'RESEARCH ON-LINE')
INSERT [dbo].[Skills] ([ID], [NAME]) VALUES (52, N'LEADERSHIP')
GO
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (1, N'Solution 1', N'Description of solution 1', 1)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (2, N'Solution 2', N'Description of solution 2', 2)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (3, N'Solution 3', N'Description of solution 3', 4)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (4, N'Solution 4', N'Description of solution 4', 3)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (5, N'Solution 5', N'Description of solution 5', 5)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (6, N'Solution 6', N'Description of solution 6', 6)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (7, N'Solution 7', N'Description of solution 7', 7)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (8, N'Solution 8', N'Description of solution 8', 8)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (9, N'Solution 9', N'Description of solution 9', 10)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (10, N'Solution 10', N'Description of solution 10', 9)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (11, N'Solution 13', N'Description of solution 13', 11)
INSERT [dbo].[Solutions] ([ID], [TITLE], [DESCRIPTION], [PROJECT_ID]) VALUES (12, N'Solution 12', N'Description of solution 12', 12)
GO
ALTER TABLE [dbo].[AuthorsInnovations]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsInnovations_Employees] FOREIGN KEY([EMPLOYEE_ID])
REFERENCES [dbo].[Employees] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[AuthorsInnovations] CHECK CONSTRAINT [FK_AuthorsInnovations_Employees]
GO
ALTER TABLE [dbo].[AuthorsInnovations]  WITH CHECK ADD  CONSTRAINT [FK_AuthorsInnovations_Innovations] FOREIGN KEY([INNOVATION_ID])
REFERENCES [dbo].[Innovations] ([INNOVATION_ID])
GO
ALTER TABLE [dbo].[AuthorsInnovations] CHECK CONSTRAINT [FK_AuthorsInnovations_Innovations]
GO
ALTER TABLE [dbo].[Credits]  WITH CHECK ADD  CONSTRAINT [FK_Credits_Employees] FOREIGN KEY([SPONZOR_ID])
REFERENCES [dbo].[Employees] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[Credits] CHECK CONSTRAINT [FK_Credits_Employees]
GO
ALTER TABLE [dbo].[Credits]  WITH CHECK ADD  CONSTRAINT [FK_Credits_Innovations1] FOREIGN KEY([INNOVATION_ID])
REFERENCES [dbo].[Innovations] ([INNOVATION_ID])
GO
ALTER TABLE [dbo].[Credits] CHECK CONSTRAINT [FK_Credits_Innovations1]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Areas] FOREIGN KEY([AREA_ID])
REFERENCES [dbo].[Areas] ([ID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Areas]
GO
ALTER TABLE [dbo].[DevelopersProjects]  WITH CHECK ADD  CONSTRAINT [FK_DevelopersProjects_Employees] FOREIGN KEY([EMPLOYEE_ID])
REFERENCES [dbo].[Employees] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[DevelopersProjects] CHECK CONSTRAINT [FK_DevelopersProjects_Employees]
GO
ALTER TABLE [dbo].[DevelopersProjects]  WITH CHECK ADD  CONSTRAINT [FK_DevelopersProjects_Projects] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[DevelopersProjects] CHECK CONSTRAINT [FK_DevelopersProjects_Projects]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DEPARTMENT])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[EmployeeSkills]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkills_Employees] FOREIGN KEY([EMPLOYEE_ID])
REFERENCES [dbo].[Employees] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[EmployeeSkills] CHECK CONSTRAINT [FK_EmployeeSkills_Employees]
GO
ALTER TABLE [dbo].[EmployeeSkills]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkills_Skills] FOREIGN KEY([SKILL_ID])
REFERENCES [dbo].[Skills] ([ID])
GO
ALTER TABLE [dbo].[EmployeeSkills] CHECK CONSTRAINT [FK_EmployeeSkills_Skills]
GO
ALTER TABLE [dbo].[Innovations]  WITH CHECK ADD  CONSTRAINT [FK_Innovations_Categories] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Innovations] CHECK CONSTRAINT [FK_Innovations_Categories]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Employees] FOREIGN KEY([SPONSOR_ID])
REFERENCES [dbo].[Employees] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Employees]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Innovations1] FOREIGN KEY([INNOVATION_ID])
REFERENCES [dbo].[Innovations] ([INNOVATION_ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Innovations1]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Methodologies] FOREIGN KEY([METHODOLOGY_ID])
REFERENCES [dbo].[Methodologies] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Methodologies]
GO
ALTER TABLE [dbo].[Solutions]  WITH CHECK ADD  CONSTRAINT [FK_Solutions_Projects] FOREIGN KEY([PROJECT_ID])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Solutions] CHECK CONSTRAINT [FK_Solutions_Projects]
GO
USE [master]
GO
ALTER DATABASE [Innovations] SET  READ_WRITE 
GO
