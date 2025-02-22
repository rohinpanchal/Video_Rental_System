USE [master]
GO
/****** Object:  Database [MusicRent]    Script Date: 12/12/2019 12:23:52 PM ******/
CREATE DATABASE [MusicRent]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicRent', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicRent.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicRent_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MusicRent_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MusicRent] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicRent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicRent] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicRent] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicRent] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicRent] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicRent] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicRent] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicRent] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicRent] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicRent] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicRent] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicRent] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicRent] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicRent] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicRent] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicRent] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicRent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicRent] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicRent] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicRent] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicRent] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicRent] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicRent] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicRent] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicRent] SET  MULTI_USER 
GO
ALTER DATABASE [MusicRent] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicRent] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicRent] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicRent] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicRent] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicRent] SET QUERY_STORE = OFF
GO
USE [MusicRent]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/12/2019 12:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustRatting]    Script Date: 12/12/2019 12:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustRatting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustID] [varchar](50) NOT NULL,
	[Cnt] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieRatting]    Script Date: 12/12/2019 12:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieRatting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [varchar](50) NOT NULL,
	[Cnt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 12/12/2019 12:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Year] [nvarchar](10) NULL,
	[Rental_Cost] [int] NULL,
	[Copies] [nvarchar](50) NULL,
	[Plot] [ntext] NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentedMovies]    Script Date: 12/12/2019 12:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedMovies](
	[RMID] [int] IDENTITY(1,1) NOT NULL,
	[MovieIDFK] [int] NOT NULL,
	[CustIDFK] [int] NOT NULL,
	[DateRented] [varchar](50) NULL,
	[DateReturned] [varchar](50) NULL,
 CONSTRAINT [PK_RentedMovies] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMovies]    Script Date: 12/12/2019 12:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMovies](
	[MID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [varchar](50) NULL,
	[MovieCopy] [int] NULL,
 CONSTRAINT [PK_tbMovies] PRIMARY KEY CLUSTERED 
(
	[MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1523, N'Jong', N'chi', N'Auckland', N'2589632587')
INSERT [dbo].[Customer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1524, N'sam', N'jonh', N'Wellington', N'147852369')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustRatting] ON 

INSERT [dbo].[CustRatting] ([id], [CustID], [Cnt]) VALUES (61, N'1523', 1)
SET IDENTITY_INSERT [dbo].[CustRatting] OFF
SET IDENTITY_INSERT [dbo].[MovieRatting] ON 

INSERT [dbo].[MovieRatting] ([id], [MovieID], [Cnt]) VALUES (48, N'599', 1)
SET IDENTITY_INSERT [dbo].[MovieRatting] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (598, N'5', N'Race', N'2012', 2, N'6', N'Action', N'Action')
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Copies], [Plot], [Genre]) VALUES (599, N'5', N'Deadpool', N'2015', 5, N'7', N'Comedy', N'Comedy')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[RentedMovies] ON 

INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned]) VALUES (154, 599, 1523, N'12-12-2019', N'Date Returned')
SET IDENTITY_INSERT [dbo].[RentedMovies] OFF
SET IDENTITY_INSERT [dbo].[tbMovies] ON 

INSERT [dbo].[tbMovies] ([MID], [MovieID], [MovieCopy]) VALUES (58, N'598', 6)
INSERT [dbo].[tbMovies] ([MID], [MovieID], [MovieCopy]) VALUES (59, N'599', 6)
SET IDENTITY_INSERT [dbo].[tbMovies] OFF
USE [master]
GO
ALTER DATABASE [MusicRent] SET  READ_WRITE 
GO
