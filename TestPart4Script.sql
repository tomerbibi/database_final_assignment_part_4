USE [master]
GO
/****** Object:  Database [Test_part_4]    Script Date: 12/01/2021 16:24:30 ******/
CREATE DATABASE [Test_part_4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test_part_4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Test_part_4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_part_4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Test_part_4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Test_part_4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test_part_4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test_part_4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test_part_4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test_part_4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test_part_4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test_part_4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test_part_4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test_part_4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test_part_4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test_part_4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test_part_4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test_part_4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test_part_4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test_part_4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test_part_4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test_part_4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test_part_4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test_part_4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test_part_4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test_part_4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test_part_4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test_part_4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test_part_4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test_part_4] SET RECOVERY FULL 
GO
ALTER DATABASE [Test_part_4] SET  MULTI_USER 
GO
ALTER DATABASE [Test_part_4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test_part_4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test_part_4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test_part_4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test_part_4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test_part_4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Test_part_4', N'ON'
GO
ALTER DATABASE [Test_part_4] SET QUERY_STORE = OFF
GO
USE [Test_part_4]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 12/01/2021 16:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [text] NOT NULL,
	[District_ID] [bigint] NOT NULL,
	[mayor] [text] NOT NULL,
	[population] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 12/01/2021 16:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [text] NOT NULL,
	[Population] [int] NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([ID], [Name], [District_ID], [mayor], [population]) VALUES (1, N'modiin', 1, N'maor', 987)
INSERT [dbo].[Cities] ([ID], [Name], [District_ID], [mayor], [population]) VALUES (2, N'modiin', 1, N'maor', 987)
INSERT [dbo].[Cities] ([ID], [Name], [District_ID], [mayor], [population]) VALUES (3, N'tel aviv', 1, N'bob', 1890)
INSERT [dbo].[Cities] ([ID], [Name], [District_ID], [mayor], [population]) VALUES (4, N'Ramle', 1, N'josh', 9385)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([ID], [Name], [Population]) VALUES (1, N'darom', NULL)
INSERT [dbo].[Districts] ([ID], [Name], [Population]) VALUES (2, N'darom', NULL)
INSERT [dbo].[Districts] ([ID], [Name], [Population]) VALUES (3, N'mizrah', NULL)
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_PersonOrder] FOREIGN KEY([District_ID])
REFERENCES [dbo].[Districts] ([ID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_PersonOrder]
GO
USE [master]
GO
ALTER DATABASE [Test_part_4] SET  READ_WRITE 
GO
