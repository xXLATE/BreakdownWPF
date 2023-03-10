USE [master]
GO
/****** Object:  Database [BreakdownDB]    Script Date: 01.03.2023 13:40:56 ******/
CREATE DATABASE [BreakdownDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BreakdownDB_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BreakdownDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BreakdownDB_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BreakdownDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BreakdownDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BreakdownDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BreakdownDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BreakdownDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BreakdownDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BreakdownDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BreakdownDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BreakdownDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BreakdownDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BreakdownDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BreakdownDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BreakdownDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BreakdownDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BreakdownDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BreakdownDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BreakdownDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BreakdownDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BreakdownDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BreakdownDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BreakdownDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BreakdownDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BreakdownDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BreakdownDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BreakdownDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BreakdownDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BreakdownDB] SET  MULTI_USER 
GO
ALTER DATABASE [BreakdownDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BreakdownDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BreakdownDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BreakdownDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BreakdownDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BreakdownDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BreakdownDB] SET QUERY_STORE = OFF
GO
USE [BreakdownDB]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[Products_ID] [int] NOT NULL,
	[Product1_ID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[Products_ID] ASC,
	[Product1_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
	[Birthday] [datetime] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhotoes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[Discount] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhotoes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 01.03.2023 13:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[Clients_ID] [int] NOT NULL,
	[Tags_ID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[Clients_ID] ASC,
	[Tags_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (1, N'Абрамов', N'Станислав', N'Филатович', N'2', N' 7(6545)478-87-79 ', N' Клиенты\m32.jpg', CAST(N'1989-05-18T00:00:00.000' AS DateTime), N' solomon@att.net', CAST(N'2016-12-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (2, N'Авдеев', N'Самуил', N'Улебович', N'2', N' 7(3168)043-63-31 ', N' Клиенты\m96.jpg', CAST(N'1996-07-04T00:00:00.000' AS DateTime), N' cliffordj@mac.com', CAST(N'2016-02-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (3, N'Агафонов', N' Юстиниан', N' Олегович', N'2', N' 7(303)810-28-78 ', N' Клиенты\m1.jpg', CAST(N'1997-02-02T00:00:00.000' AS DateTime), N' staffelb@sbcglobal.net', CAST(N'2016-06-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (4, N'Александров', N' Станислав', N' Эдуардович', N'2', N' 7(18)164-05-12 ', N' Клиенты\m2.jpg', CAST(N'1981-07-04T00:00:00.000' AS DateTime), N' bigmauler@aol.com', CAST(N'2018-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (5, N'Алексеева', N' Элина', N' Матвеевна', N'1', N' 7(8086)245-64-81 ', N' Клиенты\1.jpg', CAST(N'2002-05-07T00:00:00.000' AS DateTime), N' pthomsen@verizon.net', CAST(N'2018-03-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (6, N'Андреев', N' Станислав', N' Максович', N'2', N' 7(02)993-91-28 ', N' Клиенты\m3.jpg', CAST(N'1975-10-10T00:00:00.000' AS DateTime), N' budinger@mac.com', CAST(N'2017-12-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (7, N'Андреева', N'Патрисия', N'Валерьевна', N'1', N' 7(9648)953-81-26 ', N' Клиенты\37.jpg', CAST(N'1993-11-18T00:00:00.000' AS DateTime), N' jigsaw@aol.com', CAST(N'2016-07-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (8, N'Анисимов', N'Валентин', N'Пантелеймонович', N'2', N' 7(700)326-70-24 ', N' Клиенты\m99.jpg', CAST(N'2000-12-10T00:00:00.000' AS DateTime), N' aaribaud@hotmail.com', CAST(N'2018-01-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (9, N'Анисимова', N' Тамара', N' Витальевна', N'1', N' 7(66)128-04-10 ', N' Клиенты\2.jpg', CAST(N'1988-06-16T00:00:00.000' AS DateTime), N' schwaang@mac.com', CAST(N'2016-02-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (10, N'Артемьева', N' Лиза', N' Максимовна', N'1', N' 7(696)972-70-21 ', N' Клиенты\3.jpg', CAST(N'1996-05-17T00:00:00.000' AS DateTime), N' snunez@yahoo.ca', CAST(N'2018-10-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (11, N'Архипова', N'Прасковья', N'Валерьевна', N'1', N' 7(86)540-10-21 ', N' Клиенты\33.jpg', CAST(N'1979-01-09T00:00:00.000' AS DateTime), N' cgcra@live.com', CAST(N'2018-07-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (12, N'Афанасьева', N'Розалия', N'Макаровна', N'1', N' 7(0661)413-23-32 ', N' Клиенты\31.jpg', CAST(N'1977-05-01T00:00:00.000' AS DateTime), N' malattia@hotmail.com', CAST(N'2017-09-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (13, N'Баранов', N' Михаил', N' Романович', N'2', N' 7(750)985-94-13 ', N' Клиенты\m5.jpg', CAST(N'1997-07-12T00:00:00.000' AS DateTime), N' bigmauler@outlook.com', CAST(N'2018-10-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (14, N'Баранова', N' Эльмира', N' Дмитриевна', N'1', N' 7(9240)643-15-50 ', N' Клиенты\4.jpg', CAST(N'1977-01-15T00:00:00.000' AS DateTime), N' jgmyers@comcast.net', CAST(N'2016-07-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (15, N'Белозёрова', N' Диана', N' Антоновна', N'1', N' 7(9900)174-59-87 ', N' Клиенты\7.jpg', CAST(N'1989-02-27T00:00:00.000' AS DateTime), N' dialworld@aol.com', CAST(N'2017-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (16, N'Беляева', N'Сабрина', N'Федосеевна', N'1', N' 7(6580)534-32-58 ', N' Клиенты\47.jpg', CAST(N'1972-07-26T00:00:00.000' AS DateTime), N' agapow@gmail.com', CAST(N'2017-06-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (17, N'Бирюкова', N' Инара', N' Улебовна', N'1', N' 7(098)346-50-58 ', N' Клиенты\5.jpg', CAST(N'1978-07-21T00:00:00.000' AS DateTime), N' smpeters@hotmail.com', CAST(N'2017-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (18, N'Блинов', N' Евгений', N' Мэлсович', N'2', N' 7(0852)321-82-64 ', N' Клиенты\m7.jpg', CAST(N'1994-01-05T00:00:00.000' AS DateTime), N' moxfulder@outlook.com', CAST(N'2017-05-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (19, N'Блохин', N' Пантелеймон', N' Феликсович', N'2', N' 7(9524)556-48-98 ', N' Клиенты\m8.jpg', CAST(N'1978-03-06T00:00:00.000' AS DateTime), N' balchen@comcast.net', CAST(N'2018-02-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (20, N'Бобров', N'Агафон', N'Лаврентьевич', N'2', N' 7(2159)507-39-57 ', N' Клиенты\m35.jpg', CAST(N'1995-07-29T00:00:00.000' AS DateTime), N' petersen@comcast.net', CAST(N'2017-05-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (21, N'Бобылёв', N' Георгий', N' Витальевич', N'2', N' 7(88)685-13-51 ', N' Клиенты\m11.jpg', CAST(N'1983-12-19T00:00:00.000' AS DateTime), N' csilvers@mac.com', CAST(N'2018-04-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (22, N'Большаков', N'Вадим', N'Данилович', N'2', N' 7(386)641-13-37 ', N' Клиенты\m97.jpg', CAST(N'1970-05-15T00:00:00.000' AS DateTime), N' uncle@gmail.com', CAST(N'2018-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (23, N'Борисов', N' Аввакум', N' Артемович', N'2', N' 7(2296)930-08-88 ', N' Клиенты\m12.jpg', CAST(N'1974-04-25T00:00:00.000' AS DateTime), N' chlim@live.com', CAST(N'2017-03-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (24, N'Бурова', N'Светлана', N'Лукьевна', N'1', N' 7(358)173-82-21 ', N' Клиенты\39.jpg', CAST(N'1979-01-04T00:00:00.000' AS DateTime), N' wsnyder@aol.com', CAST(N'2016-10-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (25, N'Быков', N' Трофим', N' Константинович', N'2', N' 7(3414)460-12-05 ', N' Клиенты\m14.jpg', CAST(N'1994-12-20T00:00:00.000' AS DateTime), N' jguyer@aol.com', CAST(N'2016-04-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (26, N'Быкова', N' Тала', N' Георгьевна', N'1', N' 7(13)915-53-53 ', N' Клиенты\6.jpg', CAST(N'2000-02-22T00:00:00.000' AS DateTime), N' ganter@optonline.net', CAST(N'2016-08-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (27, N'Васильев', N' Оскар', N' Богданович', N'2', N' 7(585)801-94-29 ', N' Клиенты\m15.jpg', CAST(N'1971-01-30T00:00:00.000' AS DateTime), N' miturria@verizon.net', CAST(N'2017-05-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (28, N'Волков', N'Людвиг', N'Витальевич', N'2', N' 7(8459)592-05-58 ', N' Клиенты\m50.jpg', CAST(N'1977-12-27T00:00:00.000' AS DateTime), N' jrkorson@msn.com', CAST(N'2016-04-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (29, N'Воронова', N'Изабелла', N'Вячеславовна', N'1', N' 7(17)433-44-98 ', N' Клиенты\21.jpg', CAST(N'1999-09-24T00:00:00.000' AS DateTime), N' kildjean@sbcglobal.net', CAST(N'2017-12-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (30, N'Галкин', N' Эрик', N' Онисимович', N'2', N' 7(759)873-77-39 ', N' Клиенты\m16.jpg', CAST(N'1975-01-18T00:00:00.000' AS DateTime), N' snunez@verizon.net', CAST(N'2016-07-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (31, N'Голубев', N' Иосиф', N' Тимофеевич', N'2', N' 7(78)972-73-11 ', N' Клиенты\m18.jpg', CAST(N'1982-05-06T00:00:00.000' AS DateTime), N' smcnabb@att.net', CAST(N'2018-08-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (32, N'Горбачёв', N'Давид', N'Тимурович', N'2', N' 7(53)602-85-41 ', N' Клиенты\m36.jpg', CAST(N'1983-05-22T00:00:00.000' AS DateTime), N' hedwig@att.net', CAST(N'2018-12-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (33, N'Горбачёва', N' Никки', N' Еремеевна', N'1', N' 7(94)789-69-20 ', N' Клиенты\8.jpg', CAST(N'1987-04-21T00:00:00.000' AS DateTime), N' chinthaka@att.net', CAST(N'2018-08-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (34, N'Гордеев', N' Павел', N' Семенович', N'2', N' 7(5243)599-66-72 ', N' Клиенты\m19.jpg', CAST(N'1984-09-06T00:00:00.000' AS DateTime), N' dawnsong@verizon.net', CAST(N'2016-07-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (35, N'Горшкова', N' Марта', N' Иосифовна', N'1', N' 7(544)650-59-03 ', N' Клиенты\9.jpg', CAST(N'2001-02-13T00:00:00.000' AS DateTime), N' gbacon@mac.com', CAST(N'2016-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (36, N'Гусев', N' Яков', N' Авксентьевич', N'2', N' 7(0972)781-11-37 ', N' Клиенты\m20.jpg', CAST(N'1995-12-10T00:00:00.000' AS DateTime), N' jdhedden@icloud.com', CAST(N'2017-11-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (37, N'Гусева', N' Роза', N' Дмитриевна', N'1', N' 7(23)064-51-84 ', N' Клиенты\10.jpg', CAST(N'1999-02-13T00:00:00.000' AS DateTime), N' martyloo@live.com', CAST(N'2017-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (38, N'Гущина', N' Янита', N' Федоровна', N'1', N' 7(4544)716-68-96 ', N' Клиенты\11.jpg', CAST(N'1999-03-02T00:00:00.000' AS DateTime), N' lishoy@att.net', CAST(N'2018-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (39, N'Дементьев', N'Вадим', N'Ростиславович', N'2', N' 7(79)330-46-15 ', N' Клиенты\m39.jpg', CAST(N'1993-07-10T00:00:00.000' AS DateTime), N' jacks@aol.com', CAST(N'2018-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (40, N'Дементьева', N'Эдита', N'Онисимовна', N'1', N' 7(198)922-28-76 ', N' Клиенты\38.jpg', CAST(N'1975-09-17T00:00:00.000' AS DateTime), N' frosal@hotmail.com', CAST(N'2018-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (41, N'Дмитриева', N' Элина', N' Даниловна', N'1', N' 7(787)140-48-84 ', N' Клиенты\12.jpg', CAST(N'1988-12-10T00:00:00.000' AS DateTime), N' vmalik@live.com', CAST(N'2017-02-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (42, N'Дроздов', N' Вольдемар', N' Артемович', N'2', N' 7(307)456-99-05 ', N' Клиенты\m21.jpg', CAST(N'1976-02-07T00:00:00.000' AS DateTime), N' smpeters@me.com', CAST(N'2017-07-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (43, N'Евсеев', N' Макар', N' Васильевич', N'2', N' 7(2141)077-85-70 ', N' Клиенты\m22.jpg', CAST(N'1977-09-13T00:00:00.000' AS DateTime), N' parsimony@sbcglobal.net', CAST(N'2018-12-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (44, N'Егорова', N' Амалия', N' Дамировна', N'1', N' 7(7486)408-12-26 ', N' Клиенты\13.jpg', CAST(N'1999-09-28T00:00:00.000' AS DateTime), N' drezet@yahoo.com', CAST(N'2016-06-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (45, N'Ермакова', N'Алла', N'Мироновна', N'1', N' 7(06)437-13-73 ', N' Клиенты\48.jpg', CAST(N'1976-01-22T00:00:00.000' AS DateTime), N' whimsy@aol.com', CAST(N'2017-02-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (46, N'Ершов', N' Глеб', N' Федорович', N'2', N' 7(2608)298-40-82 ', N' Клиенты\m23.jpg', CAST(N'1970-06-14T00:00:00.000' AS DateTime), N' sjava@aol.com', CAST(N'2016-09-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (47, N'Ершова', N' Номи', N' Андреевна', N'1', N' 7(7757)315-90-99 ', N' Клиенты\14.jpg', CAST(N'2001-09-13T00:00:00.000' AS DateTime), N' miltchev@mac.com', CAST(N'2016-06-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (48, N'Ефимов', N' Альберт', N' Проклович', N'2', N' 7(416)375-97-19 ', N' Клиенты\m6.jpg', CAST(N'1997-10-29T00:00:00.000' AS DateTime), N' houle@live.com', CAST(N'2018-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (49, N'Ефимова', N' Магда', N' Платоновна', N'1', N' 7(9261)386-15-92 ', N' Клиенты\16.jpg', CAST(N'1995-08-16T00:00:00.000' AS DateTime), N' rbarreira@me.com', CAST(N'2017-08-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (50, N'Ефремов', N' Витольд', N' Авксентьевич', N'2', N' 7(93)922-14-03 ', N' Клиенты\m28.jpg', CAST(N'1975-12-02T00:00:00.000' AS DateTime), N' kwilliams@yahoo.ca', CAST(N'2018-04-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (51, N'Журавлёв', N' Леонтий', N' Яковлевич', N'2', N' 7(4403)308-56-96 ', N' Клиенты\m24.jpg', CAST(N'2000-03-02T00:00:00.000' AS DateTime), N' cmdrgravy@me.com', CAST(N'2018-01-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (52, N'Зуев', N'Матвей', N'Иванович', N'2', N' 7(5383)893-04-66 ', N' Клиенты\m38.jpg', CAST(N'1981-03-28T00:00:00.000' AS DateTime), N' brickbat@verizon.net', CAST(N'2018-12-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (53, N'Игнатов', N'Захар', N'Павлович', N'2', N' 7(578)574-73-36 ', N' Клиенты\m98.jpg', CAST(N'1998-10-07T00:00:00.000' AS DateTime), N' dieman@icloud.com', CAST(N'2017-11-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (54, N'Казаков', N'Дмитрий', N'Русланович', N'2', N' 7(51)682-19-40 ', N' Клиенты\m44.jpg', CAST(N'1978-12-15T00:00:00.000' AS DateTime), N' ozawa@verizon.net', CAST(N'2016-05-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (55, N'Калашников', N' Артур', N' Юрьевич', N'2', N' 7(147)947-47-21 ', N' Клиенты\m10.jpg', CAST(N'1972-12-13T00:00:00.000' AS DateTime), N' oevans@aol.com', CAST(N'2017-08-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (56, N'Калинин', N'Петр', N'Иванович', N'2', N' 7(90)316-07-17 ', N' Клиенты\m47.jpg', CAST(N'1993-09-08T00:00:00.000' AS DateTime), N' aschmitz@hotmail.com', CAST(N'2016-05-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (57, N'Киселёв', N' Устин', N' Яковлевич', N'2', N' 7(83)334-52-76 ', N' Клиенты\m25.jpg', CAST(N'1985-01-08T00:00:00.000' AS DateTime), N' dalamb@verizon.net', CAST(N'2018-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (58, N'Князев', N' Терентий', N' Валерьевич', N'2', N' 7(98)397-23-23 ', N' Клиенты\m26.jpg', CAST(N'1991-06-19T00:00:00.000' AS DateTime), N' rjones@aol.com', CAST(N'2018-06-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (59, N'Колесникова', N'Алина', N'Еремеевна', N'1', N' 7(74)977-39-71 ', N' Клиенты\40.jpg', CAST(N'2001-04-19T00:00:00.000' AS DateTime), N' gfxguy@outlook.com', CAST(N'2017-01-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (60, N'Колобов', N' Орест', N' Юлианович', N'2', N' 7(1680)508-58-26 ', N' Клиенты\m27.jpg', CAST(N'2001-07-14T00:00:00.000' AS DateTime), N' parkes@verizon.net', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (61, N'Колобова', N' Злата', N' Романовна', N'1', N' 7(50)884-07-35 ', N' Клиенты\18.jpg', CAST(N'1994-08-25T00:00:00.000' AS DateTime), N' sinkou@aol.com', CAST(N'2016-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (62, N'Комиссарова', N' Амалия', N' Робертовна', N'1', N' 7(22)647-46-32 ', N' Клиенты\17.jpg', CAST(N'1971-08-18T00:00:00.000' AS DateTime), N' jorgb@msn.com', CAST(N'2017-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (63, N'Копылов', N' Касьян', N' Робертович', N'2', N' 7(5774)679-82-06 ', N' Клиенты\m29.jpg', CAST(N'1983-08-04T00:00:00.000' AS DateTime), N' crobles@sbcglobal.net', CAST(N'2018-03-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (64, N'Корнилова', N'Анэля', N'Михайловна', N'1', N' 7(20)980-01-60 ', N' Клиенты\26.jpg', CAST(N'1973-04-02T00:00:00.000' AS DateTime), N' jonathan@aol.com', CAST(N'2016-05-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (65, N'Костина', N'Любава', N'Авксентьевна', N'1', N' 7(6419)959-21-87 ', N' Клиенты\41.jpg', CAST(N'1972-07-13T00:00:00.000' AS DateTime), N' gordonjcp@hotmail.com', CAST(N'2016-02-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (66, N'Крюков', N' Наум', N' Ильяович', N'2', N' 7(81)657-88-92 ', N' Клиенты\m30.jpg', CAST(N'1993-11-17T00:00:00.000' AS DateTime), N' floxy@hotmail.com', CAST(N'2017-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (67, N'Крюкова', N' Авигея', N' Святославовна', N'1', N' 7(499)318-88-53 ', N' Клиенты\19.jpg', CAST(N'2000-08-10T00:00:00.000' AS DateTime), N' simone@gmail.com', CAST(N'2018-01-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (68, N'Кудрявцев', N' Богдан', N' Христофорович', N'2', N' 7(20)131-84-09 ', N' Клиенты\m31.jpg', CAST(N'1988-02-27T00:00:00.000' AS DateTime), N' lukka@hotmail.com', CAST(N'2016-10-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (69, N'Кудряшов', N'Аверкий', N'Константинович', N'2', N' 7(88)732-96-30 ', N' Клиенты\m33.jpg', CAST(N'1991-07-26T00:00:00.000' AS DateTime), N' nanop@msn.com', CAST(N'2018-03-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (70, N'Кузьмин', N' Леонтий', N' Валерьянович', N'2', N' 7(1340)148-90-68 ', N' Клиенты\m17.jpg', CAST(N'2000-05-05T00:00:00.000' AS DateTime), N' msloan@hotmail.com', CAST(N'2017-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (71, N'Кузьмина', N'Дэнна', N'Витальевна', N'1', N' 7(9940)977-45-73 ', N' Клиенты\20.jpg', CAST(N'1993-08-24T00:00:00.000' AS DateTime), N' nichoj@mac.com', CAST(N'2016-03-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (72, N'Куликова', N'Эвелина', N'Вячеславовна', N'1', N' 7(0236)682-42-78 ', N' Клиенты\23.jpg', CAST(N'1997-11-14T00:00:00.000' AS DateTime), N' ilikered@hotmail.com', CAST(N'2018-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (73, N'Лазарев', N'Алексей', N'Богданович', N'2', N' 7(0055)737-37-48 ', N' Клиенты\m48.jpg', CAST(N'1977-03-10T00:00:00.000' AS DateTime), N' claesjac@me.com', CAST(N'2017-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (74, N'Лазарева', N'Эльвина', N'Робертовна', N'1', N' 7(5564)609-81-37 ', N' Клиенты\28.jpg', CAST(N'1996-02-16T00:00:00.000' AS DateTime), N' ahuillet@comcast.net', CAST(N'2018-04-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (75, N'Мамонтова', N'Марфа', N'Мироновна', N'1', N' 7(38)095-64-18 ', N' Клиенты\29.jpg', CAST(N'1984-10-19T00:00:00.000' AS DateTime), N' rfoley@verizon.net', CAST(N'2018-02-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (76, N'Медведев', N' Святослав', N' Юлианович', N'2', N' 7(3520)435-21-20 ', N' Клиенты\m13.jpg', CAST(N'1972-10-04T00:00:00.000' AS DateTime), N' hllam@comcast.net', CAST(N'2018-10-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (77, N'Мишина', N'Иветта', N'Андреевна', N'1', N' 7(3926)244-81-96 ', N' Клиенты\30.jpg', CAST(N'2002-10-05T00:00:00.000' AS DateTime), N' aukjan@yahoo.com', CAST(N'2016-01-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (78, N'Морозов', N'Наум', N'Валерьянович', N'2', N' 7(636)050-96-13 ', N' Клиенты\m49.jpg', CAST(N'1985-07-04T00:00:00.000' AS DateTime), N' salesgeek@mac.com', CAST(N'2016-05-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (79, N'Некрасов', N'Варлам', N'Михайлович', N'2', N' 7(019)258-06-35 ', N' Клиенты\m42.jpg', CAST(N'2000-11-12T00:00:00.000' AS DateTime), N' dogdude@verizon.net', CAST(N'2017-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (80, N'Новиков', N'Адриан', N'Аркадьевич', N'2', N' 7(70)572-33-62 ', N' Клиенты\m40.jpg', CAST(N'1974-01-15T00:00:00.000' AS DateTime), N' multiplx@verizon.net', CAST(N'2018-11-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (81, N'Овчинникова', N'Лаура', N'Еремеевна', N'1', N' 7(85)829-33-79 ', N' Клиенты\35.jpg', CAST(N'1992-04-03T00:00:00.000' AS DateTime), N' carcus@yahoo.ca', CAST(N'2018-11-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (82, N'Орлова', N'Влада', N'Мартыновна', N'1', N' 7(2506)433-38-35 ', N' Клиенты\22.jpg', CAST(N'1990-06-26T00:00:00.000' AS DateTime), N' rnelson@yahoo.ca', CAST(N'2016-03-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (83, N'Панфилов', N'Марк', N'Рудольфович', N'2', N' 7(764)282-55-22 ', N' Клиенты\m45.jpg', CAST(N'1991-04-13T00:00:00.000' AS DateTime), N' cremonini@optonline.net', CAST(N'2016-02-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (84, N'Попова', N'Харита', N'Якуновна', N'1', N' 7(335)386-81-06 ', N' Клиенты\36.jpg', CAST(N'1997-12-16T00:00:00.000' AS DateTime), N' firstpr@verizon.net', CAST(N'2016-07-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (85, N'Селиверстов', N'Глеб', N'Максимович', N'2', N' 7(20)554-28-68 ', N' Клиенты\m37.jpg', CAST(N'1999-06-20T00:00:00.000' AS DateTime), N' jigsaw@sbcglobal.net', CAST(N'2016-01-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (86, N'Сидорова', N'Татьяна', N'Михайловна', N'1', N' 7(51)732-91-79 ', N' Клиенты\42.jpg', CAST(N'1974-04-24T00:00:00.000' AS DateTime), N' tbeck@mac.com', CAST(N'2018-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (87, N'Силин', N'Гаянэ', N'Анатольевич', N'2', N' 7(4547)615-22-69 ', N' Клиенты\m46.jpg', CAST(N'1976-05-27T00:00:00.000' AS DateTime), N' multiplx@comcast.net', CAST(N'2017-05-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (88, N'Смирнов', N'Мартын', N'Арсеньевич', N'2', N' 7(6251)589-02-43 ', N' Клиенты\m34.jpg', CAST(N'1996-06-25T00:00:00.000' AS DateTime), N' haddawy@live.com', CAST(N'2017-02-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (89, N'Степанова', N' Амелия', N' Робертовна', N'1', N' 7(1217)441-28-42 ', N' Клиенты\15.jpg', CAST(N'1970-06-06T00:00:00.000' AS DateTime), N' rasca@hotmail.com', CAST(N'2017-09-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (90, N'Суворова', N'Божена', N'Анатольевна', N'1', N' 7(347)895-86-57 ', N' Клиенты\34.jpg', CAST(N'1981-03-09T00:00:00.000' AS DateTime), N' attwood@aol.com', CAST(N'2016-01-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (91, N'Сысоева', N'Дарина', N'Ярославовна', N'1', N' 7(0698)387-96-04 ', N' Клиенты\32.jpg', CAST(N'1982-02-03T00:00:00.000' AS DateTime), N' treit@verizon.net', CAST(N'2016-05-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (92, N'Трофимова', N'Альжбета', N'Якововна', N'1', N' 7(1084)658-92-95 ', N' Клиенты\25.jpg', CAST(N'1988-10-22T00:00:00.000' AS DateTime), N' gbacon@mac.com', CAST(N'2017-09-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (93, N'Турова', N'Георгина', N'Семёновна', N'1', N' 7(555)321-42-99 ', N' Клиенты\27.jpg', CAST(N'1974-05-28T00:00:00.000' AS DateTime), N' yruan@optonline.net', CAST(N'2018-02-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (94, N'Устинова', N'Юнона', N'Валентиновна', N'1', N' 7(33)367-13-07', N' Клиенты\44.jpg', CAST(N'1982-08-08T00:00:00.000' AS DateTime), N' kempsonc@live.com', CAST(N'2017-05-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (95, N'Федотов', N' Осип', N' Анатольевич', N'2', N' 7(590)702-33-06 ', N' Клиенты\m9.jpg', CAST(N'1971-04-13T00:00:00.000' AS DateTime), N' breegster@hotmail.com', CAST(N'2018-07-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (96, N'Федотова', N'Сандра', N'Владленовна', N'1', N' 7(126)195-25-86 ', N' Клиенты\24.jpg', CAST(N'1985-03-29T00:00:00.000' AS DateTime), N' penna@verizon.net', CAST(N'2016-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (97, N'Филатов', N'Аристарх', N'Дмитриевич', N'2', N' 7(696)235-29-24 ', N' Клиенты\m43.jpg', CAST(N'1989-05-29T00:00:00.000' AS DateTime), N' hampton@att.net', CAST(N'2017-01-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (98, N'Цветков', N' Демьян', N' Львович', N'2', N' 7(93)546-43-73 ', N' Клиенты\m4.jpg', CAST(N'1996-03-29T00:00:00.000' AS DateTime), N' hauma@icloud.com', CAST(N'2016-02-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (99, N'Шашкова', N'Гелла', N'Эдуардовна', N'1', N' 7(57)446-21-04 ', N' Клиенты\43.jpg', CAST(N'1979-02-24T00:00:00.000' AS DateTime), N' jadavis@mac.com', CAST(N'2016-11-16T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (100, N'Шестаков', N'Геннадий', N'Рубенович', N'2', N' 7(2066)037-11-60 ', N' Клиенты\m41.jpg', CAST(N'2001-07-01T00:00:00.000' AS DateTime), N' tokuhirom@live.com', CAST(N'2018-12-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate], [Photo]) VALUES (107, N'tes', N'te', N'test', N'2', N'123123', NULL, CAST(N'2003-08-01T00:00:00.000' AS DateTime), N'test', CAST(N'2023-03-01T13:20:54.477' AS DateTime), 0xFFD8FFE000104A46494600010101004800480000FFDB004300030202020202030202020303030304060404040404080606050609080A0A090809090A0C0F0C0A0B0E0B09090D110D0E0F101011100A0C12131210130F101010FFDB00430103030304030408040408100B090B1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010FFC00011080080008003012200021101031101FFC4001D000002020301010100000000000000000006070508010304020009FFC4003C1000020103020502020804050403000000010203040511000607122131411351226108141532718191A12352B1C1164262D1F024335372B3E1F1FFC4001B01000203010101000000000000000000000405020306010007FFC4003011000104010205030204070000000000000100020304111221051331415122617114F023248191323342A1C1D1F1FFDA000C03010002110311003F00A8F1C4195598AE3C635EAE8B1C94D146A7AA1EA35C14C9508CAAD237277C1F1AEC9B96600A9048E9D34886C8ACAE78E174427271AEBB7AE59B9C138E5207CF3AD70B18C729EDEC75236881AA2A9A455F823039B3DB1AA2D42658DCD60C9288AD372E46979D82F37AA7926DCB3469CD2130467F0D7836B44EB3CA3F05193A94AE9B2ECDE985C9192077C76D6862B2463A60FCC68CA747910B5921DC21ED5AE74AE7B06C5717D568429C425FFF0066EDFA6B927969D3E18E9A1FCD727F7D48B4299085F1CC40CF81AB4B17D0D3624B6BB7563EEBBCCAF5F0171514F12CB173003AE154900F71DC63CE9847583BA21B592AA03FA27EF4413E6A7FDF5DD6BA5A732A4F4F5D1B91DE3652AC3FB7EFA726E6FA24EF0882CBB6AF1057A4CACD04750869DA500918527A13D3B1C1D293706C2DE3B2AA4C1B936F57DBDD0E0B4B11E427E4C3E13FAEA8B350BD85AAE89E6270711D1155B9A0AD87D4A499240321F94F638F3EDAFA2CCD4B4C91800AC47A91E0B687AD77522825A0A48618272398344A10BFB838E9D745F454C70D12AE4448880AFF009BCEBE7F7785BEAE5FEFFF003F7CFF0065ADAD75B67D23C7DFDFBAE4B1C0A374A374217A93A1AE23C27ED4A5E638E4AA5603DF2468D6DB6D956F50BB8642DD3433C558238EE14BC8C032CE8A479C065EFA9F0D88B2CB09F651B8ECC0F1F2B7A818D7BE5D623191ADC13DF5BB58E08362F4E7552A7E21D0EB5554469DCB91D1F1823C1D6B7A9E5E50A304EBA5DBD78979CF51E0E826E41449DD7A6C18D4B2E7A77D4CD0CF4F6EA044A92524998B88C2E6471D8607B7CCF4D702B2D3431E115AA1C7346AC32117F9CFBFC86A2AF37CA3B052495D5723348DDCF7791BC0D1B0B0B4EB2AB7339831D9123DCB0ACC68E18D3BF34EE58FE83007EBA1EB871036E5139866B9D33C99FB9041CE73F967FAEB8B6E6C7DCDC4B22AAF1513D1D03B7C14B11C12BFEA3E74E5D85F474DB36156A95A413D4B1C8966F88A0F61EDAF3ECB59D7AA3EB70B7CD8D2303C9FF494F0EE77AF50D16DBB8CB19EA1C5298F23F363FD34C5DA9C69E27ECFA24A3DBBBC6ED454A802A52CE15D2303C2875381F2E9A6849C378C2F2C708217C81A81BFF0D6596999291522971F0B15E6C6A91748EC8D9381347476EB5D37D2DB89E908B7EE382D77AA70C188921304C3E6AEA700FCF1A646DEFA4B709F79D925DBDBF3EB16E92A236474AF41242E48FF00C83233F33CB9F6D57CDC1C3DB8C60AC501CF7CA8F3A01BAD9EFD6B256B2DB2CB18ECE8A72344B2D927394AA6A3341DB6FDD755E1EDF05F2BCD86A1A5A04A99052C9D4178831E5273F2C68FB869B8E96AAADEC752ABCD3159217F3CC3BA1FD33A4F9BBD3531227668C7BBA95C7E2352FB76F2D6CBB50DE22EBF5799253CA7A3A03D71F967425BAEDB119F2B95A630480AB0B352A53DEE90F283F1E0F4F7D2D38D12474D50B5A53B5402F8F1D574CE9C99EB296E4B2F3C32CAA508F0A467FBE955F481E6829E488647337303E7B8D67A0AEE64ED738784FA7903A1701EE86E6DFD4918FE053337CD8E351F53C44AB2088C4317EE74BCE591BEFCAC7F3D7B58D077EBAD669595CA6052CAAC79251827B675DD491235405790FA710324807F28FF0098FCF5125D96A54F2E146A5A9A58CF30000690A267DC673FD86828802F088712B6CD2B65EA24C077EA7E5EC07C80E9A074A49B776FDA7B7679A9ADE03B8F05DBB68B6EACDE8390A4900F4C75D777D1FF0069CB74BCD6DDEA63C2CB5240623C2F41A3647E861289822D723631D1581E1CED58A9E962022C00063A69A945689115420E51EE06B1B66D5434F0C718745E500124803F0D30696D946D10903A607B63AE93B9C495B08835AC0107BD9659CFA687980FC75E2AB6CC4B1E65C28FF568F6961A685DE5E50463DB40BBB6F15CF531C546B2E573CD126067D8E7DB55E71D54CBF1B610A5DACD6940DCD3A86F1D3CE846BB6E43584A1A718F0E0641D1E25821BA40CF77BAD2C21C9CA990BB03E0923B6A36A6C35B6DE596CB591D6537DD7446E619F707C1D70B8819087D9E770939C5BE0D505E7697D7A9A943CF46DEAE00EA571D755B686969ED352D431D5CD100D81130E6507E5E46BF4092984F4A69E781939D4A9571EFAA5FC6DDAD0EDADE757014F42394F3C4EABD3AF5D134EC39D9638A57C569B1A04A023AB0F14E396D56AB1D6512C71D19533561CE1C2F4F6E9D3507C64BD51EE6B0FDB56C5CD3B2F2AB1047305600919D2D6D34B5F53551416D8E6AD90B2931C6990727B77C0FC74D1E3453D45BF6D0A3AEA48A9668E150D14472A87E1E8352B1FCE679C84BE32794E1DB05233D51ACFAA35C864F6CEB219CF6527F2D37C24A9BC8F6D6C2494A88475E6773AD75173B48063966E6071D225C118F63A808D6067512062C7C9275D81224902AAA01F86B351539756A7C87EFF54E9F762030D60441431D35EA9E6A4829EAAA399181958802318EFD31A77F0F36AD3DB3665BC58E9D7D4A8A978179477E5233A5CDA76A6E19385B59B8F6CDB1AB2592A8D1B98DFE288900AFC38F8B239BB7B6AC07D1D6C95B5DC2CB7DC678B9EA28E6AA90230EBCE5B1E7F0D379AA588220E97243B705468D86CD290DC0C6CA7E4DB735AA811EEB7AA2A53E98CA392C57E600F3ADD68DED6BA154852ECB5A91300E42953F9783A89AEE17D45F9FEBBBCAF6F34A58B1A78232500208C75E99EBDFB8C0C635D366E195AE92A03D05018220CC72E724E7AB683106B6EC77F09F365730F4DBCE7FC26456EE04A3B63CF105FE28CAAE3B023A6955744BD57CD37249D25719C9FBC3BFE634C5BF5A2E105921AC8E1CC247DDF381A8FDBC68EBA58E13E9731F87925F3A9CB101200513187363D410256F097FC42E2A2AF7155D342D1A831E64660F8C164C61573DFB74D106DCD854D62A9596DD73AE9827DEFAC485C3FE3A6D47B1296AA2064E78D48E8A2438D62AB680A384A52CECA3C01D757CD55CF6E4E30A9AAD8F51C752977B8AA11E688BC6B1BAFC3907A1D54BFA565ADE7ACA49DA94B2B272F3AF4C9CF4CFEFAB837FB5C917343540306ECD8C60EAB47D22E96A67B642B82E63C823A7523B1D2D8418A60AFE20D06B39887F85DB46CB270F5A5B6154AF92366322F56E60A597AF7C02B8FD740DC49BF1DC3B7E69AAC933A0C375CF3018EB9F3A6BF0AEE366A7E1455D59F552A299645957031D5194118F91F3EDA4C6F9A07A0B7DC290BAB2C6ADC8EA72082032FEC71AB367CDEAEC52BBC1ADAF1868FE94AF35B6E8BEEA0D7937CA54E888BA172492727CEBE074E36594D45372090C600913986719D74B88CE1833279D669A99DD794B29FDB5B268D6218950E08C6469703BEC8BC794EFE147102A28363DCB6E6D13514B775FFAAF51A5052538C1033D8E3B7CC6AC27D1764AB9B8729056AB2CF0D5CCB2A1C649E6C8CE3DF39D554E0ADBA0A9B8CE79D44423F88B1C6356DFE8DFE95153DEA89B198EAD5D467BA94E87FAFE9AF416A4331AD23C968DC02738F85CA1A63B658D1FC4135FFC1B056CDF5DA98D1508ED8EDA8CDC53D92D54EF12C91C4B4E85E590F851E3521BC7758B45A1DA165F508C2E4F6D203893C4B8E9AC9F64D2C225AAA8FBD23F7C9EF8C76EDA3A4B393A2203E56B1CC64403E63D7C264EE0E2D6D9A9D98D71B5C893C6A98C2292463A6397BE7E5A57DBB7F4732D42DE36F9B52AB669E66A95679F3D8841D57F5D2E6CD79DDF788D2DD6D027F55F1FF6F2CA3F13A85B9F0FF751B93C955330691BE36925C8E5FC47B69749AE476A7B95F0DBD2D1C96123EFE55BCB06FDA51B769AABED789A655C1467C863EDF8EA46DBC4BB55DD8C224549D33CD1B1EBF97BEAA1D4D24BB76DCF5574BF4F4FE88E7011188F7EFDBFFDD436DCDEF73ADB8D0CD6C9E67927A80B1CCD952E3B751F8E353E638B70D2A97CCF85DA9EDC056D775564956731AA81DFBE921C69B0AD45824A89D0B18F058E7C1D3F6A286468E1A5A855664894BE46013A5FF13E821ABB15640401CF193923B11D7FB6A8D043C3CAB25944ED207855B7605D28E1A4B86D9F5A04122FA8B19F84BF51903F2CEA078CF6E829AC32985153A331E5F60A001F863433586E30EEC896CF2A8AA91F942E3A11EC71A99E2BFDBB1ED5905EA587D765208872401CBEE75099A5B33083DC24B24BAD85A7B02AB511F16B206BD726B2134E967537688B46BCDCE73AED96791900215B3F2D45A372E064F5EDA91461F08F975D03DD123638453B2E9675994D3DC6389CF740E413AB2FC06DC552378D55B249D0BD6522E31D3E38FC7E618FE9AAE9C28A8B6C7BC614BA46AD1BA155C8C8074CEBB6EB8368F13ADDB82D88238E89E3F55507DE8FA8738FFD4E803269BAD6BBC7554C4E2CB8D3EC9EDC7DB9D6DA36E415913128ED876FE5E9FD75562BB77EE09679AB2DBB59EF05A4FE2F2A3398D7CE00F27DFB75D5ACE2CDFF006FDEB60B4F055C322552A4880B023AF7D26B839BC6C96DBD4F490C481E37258E41073DFF002D3310E0E7B2D11B21CE0E7EE995C20B56D0BD596D972BE515D639EA62533532C26334E41EAA7B1ED83F968EF705BAC76EB7A43B3F6B46240CFCD535C3989539EC339CF6EE7C685377713E1DAB43F5CB551A7ACE39F9553A007B13F3D2BAA78D77DBBD512DEA87C618842A09F96A46281AD2304FCA62CB99209271E3381FB046974D8555B9B967DEF5B04D4D4C8BFC08D1539F95719207BE3AFEDA546FEBADA2D5B9ED925A2960823B732BC422180029042E3DBA1D496E4E2A4D4D6B68A991FD49061838F1E727FE77D578DDBBAAB67B9354554BEB0562A101F1A8D785B9D860041710B9A8690AE8D271D2DF738E2F4111E6787D56CBE0A81D31FB6979C4CE3053D5DB6AE3A49846C54AE437BFFF007AAF3B5F75CC8F0B2A9965279020CE42F8071A8BDC97F6B95CEA29C821A6720461B2B92356F2DBD0A17EADC19B299DA7572576E85BD18731C532C60E09F8CF73FA0D1371C672F6593319F8E373D7C74D4E6D7DA5158F6153553C04CAD2C7512E075F98F9F4D06F17AF90DCED92AD3BF30319F3939C692C879B64168D829C913A18FD5DC655731AC8D648C1232359D3F59E4D3A77F5558BA818ED91ADB91CBCC1C82BAE50C432A8D4888E9D902BAF5C75234BD127AA20D97E83D40AA6A82B3467E118D30AEB251565AE9EB24A8596B9E465907B20181A5F6CA4A06BA252C898E718073DF45178821B6DF7ECF4CE046AC093EFA5965D99B4F7C67F443333F58D5177DDEF73A1B353D827AC98A404844C91853D463DC75D466D2DC6D435692D2D418CB1018F7F271F993EFF002D7ADE96A9AEF571250AAB4F15373803C819D04C35868154F29599188958F5E7F1F969FD494588838A3E6FC37E02B6F6292A2FDF53FB424CA9C679CE4120E08FDBDB52B5371DBB4B3CB48F471ACD86459397A743DF3A4CECADF3050D24134956A05302DC8D263AF6F3F23FA9D706E4E285234C668E6F526EFCAAD9E41F3C1EF8F1A8B98E07011D0DB0C67BAEDE2D57DAE34929691231CF1B7310C3E23E1BF7CE90F5D50D349CEE3087196C8C9603AFEFFD753DBAF7B25DAA3EB4AF920396C1C8624607E9A10856A2AE6E4883CB9EAAA7F61AB98340DD0534BCE7EC88AD3592478A58A56196E70CAB86CE3A751D867A68FB87BC26B9DD6F0979BA478803AB2A9C12F93D07BF7D48F093856F70A337EDCF094407E08FAF6E9D49FD7567363EC88D2816EF3C4C21C72D1C646091FCFF00EDF2D2CB76B96086754D2953E661D27443F5DB758D253DA214E611A82E7C6755D78DF61DB163A87A7A6BAB2DCA423D5A3870C801F2FF00C87FE634D8E3AF1B29B68B4FB3F66CA93DE88E4AAAB5395A4CFF00957DDFFA7E3AAB754B3CB34B5756F24D3C84BBBC8C58B39EA493EFAB78570B95DF8D2EC3C795CE2FC4E2C7222193E7C21D9B6F4323992298A2E7EE6338D699B6ECEAD88A646FC7A688E381D9B2C0F281D8EB242824320E9DCE3FA6B446A33BACD6BCA92570FCA477CEBB5A551827A103AE75150C8460F29183AE99A469D3F87927DB1ACD6117DD11ECF7126E3A1450CF993AF2FB68C379D453D36F210C72E734E9DCF9F6D04EC392A28EEC93472089C74CB7B688EFF124F7E8679A4123365B9879E874BAC8FCC6A3D3495431DF9B62EC82A22A5DCB4C66A84559A8E45604F4EC74BBB9CD67A879211551AC85F2581F6F1A97DF6C0C94320247341CDF877D2CA9A80D5D4B54542B2C418B007A171FEDA6BC2E22F8C69EA8BB6ED32B8FC230FB06BC50A544350EF0312F13AF551D70DFDBF5D419A6AA99CD1C51BB31F89BDF1EDAB3DF456DAD4BBCF685EADD511C42A282AE39A15650C515D4FBF8F80698CBC2AB359AECF709F6BC4262D8E755E653F3C78D173CDF4EE2D7056C35B9EC0E69EAA98EDFE1DEE5DD55EB150DA65501864BC6428F969EDB0F8176FDBF526E7B8DA3A8914662423A2AFCFC69D4F6DA9103C3436658C1C107931D47419D1058F67430AFDAD7E9033800A47FE44E9DCFBE34A6C5E2EF4B536AF41B1FA9CB97686C5377F46AAE102436C870523C63D41EE7E5F2F3A0CFA46FD202876551C9B2365542BDE5D3D3966439143191FF00C87C0F1DFDB507C6DFA4ED25AA37DABC33A91515A88D0CD5A873043EFCA3B3B8C77EC3E7AAACEF34D512D5D7BB4B3BB195E494976773D4939EFEFA63C2F853E4226B036EC105C4B8AB580C301F92B43BD449233CE6492799C9CB1CF53DD89EE4EB0F13B3FA4AEDCA3BFCCFBEB7A46EE7D70F9C9C63CEB6C6A91F3487218F5183D75A9D18185990ECEEB5A44B182ACE463B6BD7A11B03F096C8C93CDD06BA0F2B01E9A96623AE7C6BC3C6A5F908C0504A93D31A9695DD4BFFD9)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (1, 81, CAST(N'2019-06-10T16:40:00.000' AS DateTime), 13, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (2, 9, CAST(N'2019-02-16T09:40:00.000' AS DateTime), 7, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (3, 33, CAST(N'2019-06-21T14:50:00.000' AS DateTime), 30, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (4, 53, CAST(N'2019-10-14T12:00:00.000' AS DateTime), 28, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (5, 55, CAST(N'2019-04-22T11:30:00.000' AS DateTime), 17, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (6, 49, CAST(N'2019-06-22T13:00:00.000' AS DateTime), 5, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (7, 82, CAST(N'2019-04-21T12:40:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (8, 16, CAST(N'2019-10-05T18:30:00.000' AS DateTime), 32, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (9, 28, CAST(N'2019-12-05T18:10:00.000' AS DateTime), 39, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (10, 84, CAST(N'2019-09-17T11:30:00.000' AS DateTime), 39, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (11, 76, CAST(N'2019-07-07T09:30:00.000' AS DateTime), 9, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (12, 84, CAST(N'2019-05-28T11:10:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (13, 70, CAST(N'2019-05-01T10:20:00.000' AS DateTime), 16, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (14, 70, CAST(N'2019-04-15T13:30:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (15, 80, CAST(N'2019-10-16T18:20:00.000' AS DateTime), 25, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (16, 35, CAST(N'2019-07-09T18:50:00.000' AS DateTime), 28, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (17, 17, CAST(N'2019-03-23T16:40:00.000' AS DateTime), 32, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (18, 69, CAST(N'2019-05-23T11:40:00.000' AS DateTime), 37, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (19, 90, CAST(N'2019-07-30T12:10:00.000' AS DateTime), 27, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (20, 71, CAST(N'2019-08-24T11:20:00.000' AS DateTime), 23, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (21, 63, CAST(N'2019-12-23T15:30:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (22, 76, CAST(N'2019-08-02T18:50:00.000' AS DateTime), 34, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (23, 11, CAST(N'2019-02-15T17:30:00.000' AS DateTime), 40, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (24, 33, CAST(N'2019-12-28T17:10:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (25, 60, CAST(N'2019-04-14T15:00:00.000' AS DateTime), 8, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (26, 82, CAST(N'2019-12-18T10:30:00.000' AS DateTime), 15, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (27, 46, CAST(N'2019-07-30T10:10:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (28, 97, CAST(N'2019-06-15T09:30:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (29, 22, CAST(N'2019-07-28T12:50:00.000' AS DateTime), 7, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (30, 11, CAST(N'2019-07-12T19:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (31, 19, CAST(N'2019-07-02T15:30:00.000' AS DateTime), 37, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (32, 37, CAST(N'2019-09-09T17:40:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (33, 30, CAST(N'2019-01-29T16:10:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (34, 80, CAST(N'2019-01-19T11:50:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (35, 6, CAST(N'2019-07-05T13:40:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (36, 22, CAST(N'2019-10-10T13:40:00.000' AS DateTime), 12, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (37, 18, CAST(N'2019-12-07T17:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (38, 97, CAST(N'2019-06-05T10:50:00.000' AS DateTime), 36, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (39, 1, CAST(N'2019-04-05T10:10:00.000' AS DateTime), 13, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (40, 57, CAST(N'2019-06-24T14:10:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (41, 60, CAST(N'2019-09-05T19:30:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (42, 69, CAST(N'2019-11-27T09:00:00.000' AS DateTime), 10, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (43, 9, CAST(N'2019-02-21T08:20:00.000' AS DateTime), 35, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (44, 33, CAST(N'2019-11-26T10:30:00.000' AS DateTime), 41, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (45, 71, CAST(N'2019-04-26T10:20:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (46, 79, CAST(N'2019-11-23T14:30:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (47, 9, CAST(N'2019-08-25T08:50:00.000' AS DateTime), 38, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (48, 55, CAST(N'2019-05-09T10:00:00.000' AS DateTime), 24, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (49, 60, CAST(N'2019-08-08T17:20:00.000' AS DateTime), 18, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (50, 73, CAST(N'2019-12-30T08:10:00.000' AS DateTime), 17, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (51, 63, CAST(N'2019-09-05T14:10:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (52, 53, CAST(N'2019-12-24T09:30:00.000' AS DateTime), 12, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (53, 73, CAST(N'2019-04-06T11:50:00.000' AS DateTime), 33, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (54, 77, CAST(N'2019-08-12T11:50:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (55, 17, CAST(N'2019-08-12T15:40:00.000' AS DateTime), 16, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (56, 30, CAST(N'2019-07-29T10:30:00.000' AS DateTime), 12, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (57, 78, CAST(N'2019-04-14T14:20:00.000' AS DateTime), 29, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (58, 37, CAST(N'2019-03-19T09:40:00.000' AS DateTime), 26, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (59, 53, CAST(N'2019-12-15T19:50:00.000' AS DateTime), 27, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (60, 33, CAST(N'2019-11-30T18:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (61, 55, CAST(N'2019-11-14T15:00:00.000' AS DateTime), 21, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (62, 46, CAST(N'2019-06-14T18:30:00.000' AS DateTime), 31, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (63, 76, CAST(N'2019-03-22T15:20:00.000' AS DateTime), 42, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (64, 42, CAST(N'2019-10-09T18:30:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (65, 69, CAST(N'2019-03-16T10:20:00.000' AS DateTime), 7, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (66, 6, CAST(N'2019-12-16T19:40:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (67, 11, CAST(N'2019-08-15T18:30:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (68, 77, CAST(N'2019-09-20T08:20:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (69, 9, CAST(N'2019-04-15T11:50:00.000' AS DateTime), 32, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (70, 66, CAST(N'2019-08-12T08:50:00.000' AS DateTime), 17, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (71, 66, CAST(N'2019-03-04T11:30:00.000' AS DateTime), 11, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (72, 9, CAST(N'2019-02-24T13:50:00.000' AS DateTime), 35, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (73, 49, CAST(N'2019-12-06T09:40:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (74, 82, CAST(N'2019-08-05T10:10:00.000' AS DateTime), 19, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (75, 66, CAST(N'2019-05-19T16:50:00.000' AS DateTime), 43, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (76, 35, CAST(N'2019-12-30T14:30:00.000' AS DateTime), 31, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (77, 57, CAST(N'2019-06-28T10:10:00.000' AS DateTime), 17, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (78, 78, CAST(N'2019-11-05T12:10:00.000' AS DateTime), 18, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (79, 11, CAST(N'2019-09-19T16:10:00.000' AS DateTime), 33, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (80, 76, CAST(N'2019-02-26T17:40:00.000' AS DateTime), 8, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (81, 35, CAST(N'2019-09-13T10:10:00.000' AS DateTime), 30, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (82, 80, CAST(N'2019-10-14T19:40:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (83, 6, CAST(N'2019-04-11T16:20:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (84, 7, CAST(N'2019-03-06T12:10:00.000' AS DateTime), 30, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (85, 42, CAST(N'2019-08-21T17:20:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (86, 28, CAST(N'2019-06-29T17:20:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (87, 88, CAST(N'2019-02-04T19:50:00.000' AS DateTime), 41, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (88, 35, CAST(N'2019-07-09T16:50:00.000' AS DateTime), 14, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (89, 46, CAST(N'2019-06-16T12:00:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (90, 1, CAST(N'2019-11-27T13:30:00.000' AS DateTime), 31, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (91, 79, CAST(N'2019-05-27T08:00:00.000' AS DateTime), 16, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (92, 1, CAST(N'2019-12-15T14:30:00.000' AS DateTime), 22, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (93, 80, CAST(N'2019-10-17T19:00:00.000' AS DateTime), 21, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (94, 69, CAST(N'2019-11-15T15:40:00.000' AS DateTime), 25, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (95, 22, CAST(N'2019-08-24T17:00:00.000' AS DateTime), 9, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (96, 6, CAST(N'2019-05-27T14:20:00.000' AS DateTime), 36, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (97, 30, CAST(N'2019-08-19T17:50:00.000' AS DateTime), 8, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (98, 49, CAST(N'2019-08-08T19:00:00.000' AS DateTime), 20, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (99, 18, CAST(N'2019-02-24T13:00:00.000' AS DateTime), 37, NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (100, 60, CAST(N'2019-12-19T15:00:00.000' AS DateTime), 40, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (101, 94, CAST(N'2023-03-01T11:42:08.123' AS DateTime), 10, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [StartTime], [ServiceID], [Comment]) VALUES (102, 107, CAST(N'2023-03-01T13:21:30.887' AS DateTime), 40, NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'F')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'M')
GO
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (1, N'Антибактериальная обработка кондиционера', 503, CAST(3413.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (2, N'Диагностика выхлопной системы автомобиля', 2430, CAST(516.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (3, N'Диагностика инжектора', 353, CAST(3027.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (4, N'Диагностика подвески', 2260, CAST(2796.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (5, N'Диагностика рулевого редуктора', 386, CAST(731.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (6, N'Диагностика трансмиссии', 3239, CAST(4654.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (7, N'Замена жидкости ГУР', 270, CAST(4379.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (8, N'Замена заднего сальника АКПП', 379, CAST(1776.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (9, N'Замена кулисы АКПП', 1420, CAST(4194.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (10, N'Замена лямбда зонда', 3145, CAST(699.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (11, N'Замена масла АКПП', 1818, CAST(4184.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (12, N'Замена масла заднего редуктора (моста)', 631, CAST(2669.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (13, N'Замена маховика', 2695, CAST(1895.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (14, N'Замена охлаждающей жидкости', 1963, CAST(4571.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (15, N'Замена подшипника задней ступицы', 243, CAST(1903.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (16, N'Замена подшипника компрессора кондиционера', 1687, CAST(4405.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (17, N'Замена подшипника передней ступицы', 2011, CAST(4137.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (18, N'Замена ремня кондиционера', 1085, CAST(3096.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (19, N'Замена ремня привода ГУР', 379, CAST(2405.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (20, N'Замена рулевой тяги', 2166, CAST(2807.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (21, N'Замена сальника привода', 108, CAST(3366.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (22, N'Замена свечей', 1739, CAST(3630.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (23, N'Замена тормозной жидкости', 2863, CAST(2237.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (24, N'Замена тормозных колодок', 564, CAST(2183.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (25, N'Замена троса сцепления', 1242, CAST(2628.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (26, N'Замена трубки кондиционера', 2122, CAST(2943.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (27, N'Замена фильтров', 942, CAST(4350.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (28, N'Кузовной ремонт', 2935, CAST(4168.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (29, N'Покраска', 3226, CAST(4109.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (30, N'Развал-схождение', 3514, CAST(3429.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (31, N'Ремонт автоэлектрики', 3558, CAST(1824.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (32, N'Ремонт бензонасоса', 668, CAST(2706.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (33, N'Ремонт глушителя', 1335, CAST(1576.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (34, N'Ремонт двигателя', 1645, CAST(3278.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (35, N'Ремонт и замена катализатора', 1757, CAST(1748.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (36, N'Ремонт карданного вала', 1177, CAST(1107.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (37, N'Ремонт компрессора кондиционера', 306, CAST(950.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (38, N'Ремонт кронштейна глушителя', 2337, CAST(2242.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (39, N'Ремонт стартера', 2037, CAST(2550.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (40, N'Ремонт сцепления', 1470, CAST(2653.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (41, N'Снятие/установка форсунок', 1000, CAST(1404.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (42, N'Установка сигнализации', 1933, CAST(2087.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (43, N'Чистка форсунок ультразвуком', 405, CAST(3586.0000 AS Decimal(19, 4)), NULL, NULL, NULL)
GO
/****** Object:  Index [IX_FK_AttachedProduct_Product1]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AttachedProduct_Product1] ON [dbo].[AttachedProduct]
(
	[Product1_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Client_Gender]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Client_Gender] ON [dbo].[Client]
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClientService_Client]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClientService_Client] ON [dbo].[ClientService]
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClientService_Service]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClientService_Service] ON [dbo].[ClientService]
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DocumentByService_ClientService]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DocumentByService_ClientService] ON [dbo].[DocumentByService]
(
	[ClientServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Product_Manufacturer]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Product_Manufacturer] ON [dbo].[Product]
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductPhoto_Product]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductPhoto_Product] ON [dbo].[ProductPhoto]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductSale_ClientService]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductSale_ClientService] ON [dbo].[ProductSale]
(
	[ClientServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductSale_Product]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductSale_Product] ON [dbo].[ProductSale]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ServicePhoto_Service]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ServicePhoto_Service] ON [dbo].[ServicePhoto]
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TagOfClient_Tag]    Script Date: 01.03.2023 13:40:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TagOfClient_Tag] ON [dbo].[TagOfClient]
(
	[Tags_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([Products_ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([Product1_ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([Clients_ID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([Tags_ID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [BreakdownDB] SET  READ_WRITE 
GO
