USE [master]
GO
/****** Object:  Database [TrafficPolice]    Script Date: 25.12.2022 18:06:03 ******/
CREATE DATABASE [TrafficPolice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrafficPolice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TrafficPolice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrafficPolice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TrafficPolice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TrafficPolice] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrafficPolice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrafficPolice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrafficPolice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrafficPolice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrafficPolice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrafficPolice] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrafficPolice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrafficPolice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrafficPolice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrafficPolice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrafficPolice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrafficPolice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrafficPolice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrafficPolice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrafficPolice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrafficPolice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrafficPolice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrafficPolice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrafficPolice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrafficPolice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrafficPolice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrafficPolice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrafficPolice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrafficPolice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrafficPolice] SET  MULTI_USER 
GO
ALTER DATABASE [TrafficPolice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrafficPolice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrafficPolice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrafficPolice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrafficPolice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrafficPolice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TrafficPolice] SET QUERY_STORE = OFF
GO
USE [TrafficPolice]
GO
/****** Object:  Table [dbo].[CarofAccident]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarofAccident](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AccidentId] [int] NOT NULL,
	[VehicleVIN] [varchar](17) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatrgoryOfLicense]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatrgoryOfLicense](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseId] [int] NOT NULL,
	[LicenseCategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[PassportNumber] [int] NULL,
	[PassportSerial] [int] NOT NULL,
	[Postcode] [int] NOT NULL,
	[RegistrationAddress] [nvarchar](200) NOT NULL,
	[ResidentialAddress] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Photo] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverOfAccident]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverOfAccident](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleAccidentId] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EngineType]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EngineType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameRU] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EngineType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[License]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[License](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseDate] [date] NOT NULL,
	[ExpireDate] [date] NOT NULL,
	[LicenseSeries] [nvarchar](5) NOT NULL,
	[LicenseNumber] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
	[LicenseStateId] [int] NOT NULL,
 CONSTRAINT [PK_License] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseCategory]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](3) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_LicenseCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseState]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
	[ColorIndicator] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LicenseState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhotoOfVehicleAccident]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoOfVehicleAccident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Photo] [varchar](100) NOT NULL,
	[VehicleAccidentId] [int] NOT NULL,
 CONSTRAINT [PK_PhotoOfVehicleAccident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfDrive]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfDrive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameRU] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfDrive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VIN] [varchar](17) NOT NULL,
	[VehicleManufacturer] [nvarchar](25) NOT NULL,
	[VehicleModel] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[VehicleColorId] [int] NOT NULL,
	[EngineTypeId] [int] NOT NULL,
	[TypeOfDriverId] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleAccident]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleAccident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[RowOfRoad] [nvarchar](100) NOT NULL,
	[TrafficLane] [nvarchar](100) NOT NULL,
	[VictimsCount] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_VehicleAccident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleColor]    Script Date: 25.12.2022 18:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleColor](
	[Id] [int] NOT NULL,
	[HexCode] [nvarchar](50) NOT NULL,
	[IsMetalic] [bit] NULL,
	[NameRU] [nvarchar](100) NOT NULL,
	[DescriptionRU] [nvarchar](100) NOT NULL,
	[NameEN] [nvarchar](100) NOT NULL,
	[DescriptionEN] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_VehicleColor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarofAccident] ON 

INSERT [dbo].[CarofAccident] ([id], [AccidentId], [VehicleVIN]) VALUES (1, 1, N'19UUA66218A797800')
INSERT [dbo].[CarofAccident] ([id], [AccidentId], [VehicleVIN]) VALUES (2, 1, N'1C4RJEAG6FC571030')
SET IDENTITY_INSERT [dbo].[CarofAccident] OFF
GO
SET IDENTITY_INSERT [dbo].[CatrgoryOfLicense] ON 

INSERT [dbo].[CatrgoryOfLicense] ([id], [LicenseId], [LicenseCategoryId]) VALUES (1, 1, 1)
INSERT [dbo].[CatrgoryOfLicense] ([id], [LicenseId], [LicenseCategoryId]) VALUES (2, 1, 2)
INSERT [dbo].[CatrgoryOfLicense] ([id], [LicenseId], [LicenseCategoryId]) VALUES (3, 1, 3)
INSERT [dbo].[CatrgoryOfLicense] ([id], [LicenseId], [LicenseCategoryId]) VALUES (4, 201, 4)
SET IDENTITY_INSERT [dbo].[CatrgoryOfLicense] OFF
GO
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (1, N'Alonso', N'Hopkins', N'Caleb', 160716, 2303, 760832, N'452 Cobblestone St.', N'56565', N'Global Gillette', N'Reporter', N'160716', N'skippy@icloud.com', N'Resources/001-happy-18.png', N'55')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (2, N'Kaydence', N'Sellers', N'Susannah', 160745, 5563, 807042, N'Hyattsville, MD 20782', N'', N'Coca-Cola', N'Elementary School Teacher', N'8677084447', N'isotopian@sbcglobal.net', N'Resources/002-cool-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (3, N'Finnegan', N'Bray', N'Brighton', 717453, 3719, 83282, N'9648 Philmont Lane', N'', N'Harley-Davidson Motor Company', N'Childcare worker', N'2214287850', N'isaacson@att.net', N'Resources/003-happy-17.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (4, N'Gideon', N'Arias', N'Varian', 721066, 5810, 768289, N'Hanover Park, IL 60133', N'', N'Corona', N'Loan Officer', N'7862747872', N'mugwump@mac.com', N'Resources/004-surprised-9.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (5, N'Case', N'Schultz', N'Aiden', 937197, 2208, 780691, N'8438 North Fairground Court', N'', N'Johnnie Walker', N'Drafter', N'3657526445', N'mcmillan@optonline.net', N'Resources/005-shocked-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (6, N'Pierre', N'Alvarado', N'Harriet', 275223, 7184, 845839, N'Woodstock, GA 30188', N'', N'SAP', N'Cost Estimator', N'4466396043', N'dinther@hotmail.com', N'Resources/006-shocked-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (7, N'Esteban', N'Bell', N'Cameron', 574791, 9563, 94009, N'148 Catherine Dr.', N'', N'Smirnoff', N'Clinical Laboratory Technician', N'5554448316', N'pizza@yahoo.com', N'Resources/007-nervous-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (8, N'Spencer', N'Anderson', N'Meaghan', 379623, 9008, 674783, N'Lithonia, GA 30038', N'', N'Toyota Motor Corporation', N'Electrician', N'3926824442', N'murty@outlook.com', N'Resources/008-nervous-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (9, N'Seth', N'Sweeney', N'Jax', 530169, 3810, 845247, N'708 6th Drive', N'', N'Caterpillar Inc.', N'Referee', N'8364290386', N'aegreene@me.com', N'Resources/009-angry-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (10, N'Lincoln', N'Mason', N'Emeline', 689700, 5387, 252988, N'Egg Harbor Township, NJ 08234', N'', N'Avon', N'Judge', N'2839453092', N'jnolan@aol.com', N'Resources/010-drool.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (11, N'Lindsay', N'Curtis', N'Syllable', 481271, 1152, 777867, N'8992 Union Rd.', N'', N'Budweiser Stag Brewing Company', N'Security Guard', N'6213593669', N'msherr@optonline.net', N'Resources/011-tired-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (12, N'Noah', N'Daugherty', N'Thomas', 764363, 2924, 504859, N'Villa Park, IL 60181', N'', N'IBM', N'Budget analyst', N'4405610314', N'ranasta@icloud.com', N'Resources/012-tongue-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (13, N'Darien', N'Sellers', N'Nadeen', 869140, 5110, 779085, N'12 Windsor St.', N'', N'Chase', N'Painter', N'3319182434', N'punkis@hotmail.com', N'Resources/013-tongue-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (14, N'Jaylene', N'Schneider', N'Xavier', 84332, 6948, 144573, N'Waynesboro, PA 17268', N'', N'NTT Data', N'Occupational Therapist', N'9446270176', N'pereinar@yahoo.com', N'Resources/014-tongue-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (15, N'Leonard', N'Schmitt', N'Vincent', 366325, 7045, 864380, N'549 Lake View Dr.', N'', N'Intel Corporation', N'Physical Therapist', N'6214057195', N'tskirvin@mac.com', N'Resources/015-smile-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (16, N'Maya', N'Richardson', N'Heath', 947091, 7100, 265294, N'Garland, TX 75043', N'', N'Sony', N'Photographer', N'8376391067', N'kewley@sbcglobal.net', N'Resources/016-sleeping-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (17, N'Thalia', N'Delacruz', N'Caprice', 340517, 9169, 137788, N'314 N. Gulf Lane', N'', N'Tesco Corporation', N'Cashier', N'7696107084', N'ehood@icloud.com', N'Resources/017-nervous.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (18, N'Maci', N'Baird', N'Dustin', 188032, 3097, 340075, N'Hollywood, FL 33020', N'', N'Microsoft', N'Educator', N'3086867622', N'ilial@aol.com', N'Resources/018-surprised-8.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (19, N'Ace', N'Stephenson', N'Amity', 170860, 7796, 531408, N'3 Cooper Street', N'', N'McDonald''s', N'Professional athlete', N'3198723287', N'elmer@comcast.net', N'Resources/019-tongue-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (20, N'Robert', N'Castro', N'Isaiah', 550223, 5001, 912556, N'Coventry, RI 02816', N'', N'VISA', N'Janitor', N'3416205356', N'scarolan@live.com', N'Resources/020-happy-16.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (21, N'Efrain', N'Stark', N'Jared', 741281, 4204, 838795, N'53 E. Marvon St.', N'', N'Zara', N'Massage Therapist', N'2665617456', N'bwcarty@yahoo.com', N'Resources/021-wink-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (22, N'Katelynn', N'Montgomery', N'Drake', 731500, 1209, 520544, N'Jamaica Plain, MA 02130', N'', N'Morgan Stanley', N'Psychologist', N'4086730059', N'facet@outlook.com', N'Resources/022-laughing-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (23, N'Sammy', N'Freeman', N'Lane', 749551, 1085, 902946, N'15 Indian Summer St.', N'', N'Mitsubishi', N'IT Manager', N'9068255704', N'metzzo@att.net', N'Resources/023-laughing-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (24, N'Jamal', N'Stokes', N'Rayleen', 277444, 7125, 684826, N'Canton, GA 30114', N'', N'Audi', N'Anthropologist', N'8667324338', N'slaff@aol.com', N'Resources/024-sweat-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (25, N'Lilliana', N'Bell', N'Quintin', 465200, 4858, 299125, N'1 Rockville Ave.', N'', N'eBay', N'Executive Assistant', N'7448769856', N'caidaperl@mac.com', N'Resources/025-happy-15.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (26, N'Jaidyn', N'Ali', N'Kaitlin', 131955, 9255, 623940, N'Piedmont, SC 29673', N'', N'Ralph Lauren Corporation', N'Artist', N'8722303310', N'jigsaw@verizon.net', N'Resources/026-happy-14.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (27, N'Solomon', N'Nixon', N'Jolee', 425455, 3965, 243802, N'154 Galvin Ave.', N'', N'Wal-Mart', N'Mechanical Engineer', N'5724672895', N'hoyer@optonline.net', N'Resources/027-laughing.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (28, N'Isaias', N'Mcdowell', N'Kalan', 409875, 4368, 697427, N'Savannah, GA 31404', N'', N'Panasonic Corporation', N'Firefighter', N'4517686075', N'danneng@msn.com', N'Resources/028-happy-13.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (29, N'Neveah', N'Dean', N'Evony', 299023, 9283, 503601, N'56 Annadale Dr.', N'', N'Nike, Inc.', N'Carpenter', N'5558026671', N'burniske@outlook.com', N'Resources/029-happy-12.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (30, N'Koen', N'Waters', N'Abraham', 664366, 4065, 732787, N'Lititz, PA 17543', N'', N'Nissan Motor Co., Ltd.', N'Actuary', N'8334605788', N'jipsen@sbcglobal.net', N'Resources/030-crying-8.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (31, N'Cale', N'Odom', N'Ann', 252066, 4877, 650754, N'7285 Locust Drive', N'', N'MTV', N'Compliance Officer', N'2348958976', N'agapow@hotmail.com', N'Resources/031-crying-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (32, N'Layton', N'Ruiz', N'Aryn', 317830, 8656, 924502, N'Jackson Heights, NY 11372', N'', N'Cartier SA', N'Computer Systems Administrator', N'6824698567', N'mobileip@icloud.com', N'Resources/032-bored.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (33, N'Monserrat', N'Patrick', N'Coralie', 513755, 1583, 670778, N'935 West Ave.', N'', N'Nescafé', N'HR Specialist', N'6825557940', N'mglee@yahoo.com', N'Resources/033-cool-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (34, N'Kamden', N'Hardin', N'Ray', 517256, 2179, 939472, N'Columbus, GA 31904', N'', N'Allianz', N'Recreation & Fitness Worker', N'5759857625', N'animats@yahoo.ca', N'Resources/034-angry-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (35, N'Janiya', N'Neal', N'Irene', 495362, 5244, 172365, N'720 Summerhouse Street', N'', N'Ferrari S.p.A.', N'Financial Advisor', N'3135078540', N'drewf@me.com', N'Resources/035-sad-14.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (36, N'Cornelius', N'Winters', N'James', 586486, 9584, 424571, N'Maryville, TN 37803', N'', N'Kleenex', N'Auto Mechanic', N'6087830267', N'slanglois@msn.com', N'Resources/036-angry-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (37, N'Kaden', N'Love', N'Neil', 453434, 1850, 478037, N'139 N. Grand St.', N'', N'Tiffany & Co.', N'Web Developer', N'6886567203', N'notaprguy@verizon.net', N'Resources/037-happy-11.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (38, N'Finley', N'Mills', N'Ace', 976952, 4286, 843098, N'Irwin, PA 15642', N'', N'3M', N'Civil Engineer', N'5304027915', N'yruan@sbcglobal.net', N'Resources/038-angry-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (39, N'Markus', N'Henry', N'Edward', 784535, 2767, 900432, N'400 Amerige St.', N'', N'Shell Oil Company', N'Chemist', N'2626352834', N'bmorrow@me.com', N'Resources/039-cyclops-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (40, N'Romeo', N'Singleton', N'Preston', 990002, 7677, 425361, N'Evans, GA 30809', N'', N'Adobe Systems', N'Recreational Therapist', N'4879573536', N'adillon@verizon.net', N'Resources/040-surprised-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (41, N'Ethen', N'Glenn', N'Kate', 37367, 6342, 815003, N'225 Iroquois St.', N'', N'IKEA', N'Microbiologist', N'9182854740', N'kimvette@me.com', N'Resources/041-thinking-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (42, N'Abbey', N'Gordon', N'Berlynn', 475995, 8909, 60302, N'Vienna, VA 22180', N'', N'Nokia', N'Event Planner', N'4127068937', N'emcleod@outlook.com', N'Resources/042-book.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (43, N'Presley', N'Vasquez', N'Sheridan', 720543, 9144, 529399, N'44 Ocean Ave.', N'', N'Sprite', N'Coach', N'4543538089', N'stomv@aol.com', N'Resources/043-baby-boy.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (44, N'Alexis', N'Levine', N'Juan', 143882, 6021, 191499, N'Long Beach, NY 11561', N'', N'Xerox', N'Radiologic Technologist', N'6237167237', N'msusa@comcast.net', N'Resources/044-dead-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (45, N'Steve', N'Miles', N'Lydon', 499410, 4607, 292234, N'192 West Foster St.', N'', N'Samsung Group', N'Market Research Analyst', N'5946158545', N'dougj@yahoo.com', N'Resources/045-star.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (46, N'Kayley', N'Cuevas', N'Tyson', 263545, 4676, 194258, N'Long Branch, NJ 07740', N'', N'Google', N'Housekeeper', N'6478852301', N'jlbaumga@gmail.com', N'Resources/046-dubious.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (47, N'Annabelle', N'Hebert', N'Annora', 27113, 6571, 415905, N'43 SE. Cross Court', N'', N'Louis Vuitton', N'Computer Programmer', N'8226933953', N'temmink@mac.com', N'Resources/047-phone-call.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (48, N'Carolina', N'Casey', N'Timothy', 511412, 2307, 598986, N'Centereach, NY 11720', N'', N'Apple Inc.', N'Secretary', N'8872368493', N'nighthawk@msn.com', N'Resources/048-moon.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (49, N'Beckham', N'Roach', N'Elias', 956293, 4756, 906312, N'946 Yukon Lane', N'', N'Verizon Communications', N'Bus Driver', N'5315970196', N'qmacro@outlook.com', N'Resources/049-robot.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (50, N'Seamus', N'Pugh', N'Jackson', 133588, 4693, 989757, N'Winter Springs, FL 32708', N'', N'Credit Suisse', N'Systems Analyst', N'5067741574', N'stewwy@att.net', N'Resources/050-flower.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (51, N'Imani', N'Calderon', N'Sullivan', 90859, 7598, 46335, N'330 Poplar Lane', N'', N'Wells Fargo', N'Chef', N'6398138035', N'blixem@msn.com', N'Resources/051-happy-10.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (52, N'Marisol', N'Roach', N'Dezi', 240325, 2416, 245515, N'Titusville, FL 32780', N'', N'Yahoo!', N'Registered Nurse', N'8834555204', N'mccurley@optonline.net', N'Resources/052-happy-9.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (53, N'Kane', N'Jacobson', N'Emerson', 957754, 3896, 368276, N'626 Leatherwood St.', N'', N'Porsche', N'Surveyor', N'8339144764', N'jacks@mac.com', N'Resources/053-tired-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (54, N'Anya', N'Higgins', N'Erin', 581276, 6573, 372963, N'Lynn, MA 01902', N'', N'Moët et Chandon', N'Urban Planner', N'8109453933', N'nwiger@att.net', N'Resources/054-ugly-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (55, N'Branson', N'Richard', N'Linnea', 886655, 2225, 446339, N'9971 N. Rockville Avenue', N'', N'Hyundai', N'Middle School Teacher', N'9956109002', N'muadip@me.com', N'Resources/055-tongue-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (56, N'Kyle', N'Mathis', N'Raine', 340666, 8966, 490162, N'Duluth, GA 30096', N'', N'Honda Motor Company, Ltd', N'Speech-Language Pathologist', N'3945813937', N'gavinls@yahoo.com', N'Resources/056-vampire.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (57, N'Jamiya', N'Cross', N'Trevor', 958143, 1754, 246531, N'9542 Sutor Drive', N'', N'Beko', N'Personal Care Aide', N'7323752363', N'nicktrig@me.com', N'Resources/057-music-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (58, N'Selah', N'Keller', N'Merle', 406702, 4434, 268770, N'Phoenixville, PA 19460', N'', N'Deere & Company', N'Database administrator', N'5874442070', N'lbecchi@me.com', N'Resources/058-popcorn.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (59, N'Larry', N'Watson', N'Blayne', 211563, 4859, 898596, N'299 E. George St.', N'', N'Volkswagen Group', N'Art Director', N'8454381802', N'willg@att.net', N'Resources/059-nurse.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (60, N'Braeden ', N'Shea', N'Abe', 104186, 5348, 316595, N'Westport, CT 06880', N'', N'Pampers', N'Landscaper & Groundskeeper', N'3204783865', N'rnelson@yahoo.com', N'Resources/060-sad-13.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (61, N'Allisson ', N'Woodard', N'Joan', 132859, 9216, 635754, N'7671 Tunnel Street', N'', N'BlackBerry', N'Court Reporter', N'4868288733', N'roesch@aol.com', N'Resources/061-graduated-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (62, N'Amy ', N'Garner', N'Tanner', 199319, 6127, 509105, N'Fair Lawn, NJ 07410', N'', N'Jack Daniel''s', N'Bookkeeping clerk', N'4972158724', N'pthomsen@verizon.net', N'Resources/062-happy-8.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (63, N'Saniyah ', N'Choi', N'Debree', 719495, 1102, 815229, N'41 Harvard Drive', N'', N'Facebook, Inc.', N'Landscape Architect', N'3998873591', N'itstatus@yahoo.ca', N'Resources/063-hungry.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (64, N'Reagan ', N'Simmons', N'Sharon', 814747, 2020, 470174, N'Windsor, CT 06095', N'', N'United Parcel Service', N'College Professor', N'2052784756', N'marcs@verizon.net', N'Resources/064-police.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (65, N'Coby ', N'Robertson', N'Juliet', 683928, 4083, 133197, N'7219 Prospect Drive', N'', N'Adidas', N'Respiratory Therapist', N'2608147458', N'tellis@yahoo.ca', N'Resources/065-crying-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (66, N'Dakota ', N'Haney', N'Marguerite', 718764, 1270, 946776, N'Rolla, MO 65401', N'', N'Siemens AG', N'Mason', N'3028443480', N'scotfl@att.net', N'Resources/066-happy-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (67, N'Malia ', N'Rivas', N'Louis', 532007, 3871, 875661, N'697 Cypress Lane', N'', N'Citigroup', N'Veterinarian', N'4493807477', N'jramio@optonline.net', N'Resources/067-sun.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (68, N'Lily ', N'Green', N'Lynn', 633690, 9827, 976908, N'Arlington Heights, IL 60004', N'', N'Amazon.com', N'Architect', N'2802148022', N'mastinfo@gmail.com', N'Resources/068-father-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (69, N'Reilly ', N'Nielsen', N'Marcella', 821275, 9350, 836368, N'7762 North County St.', N'', N'AT&T', N'Accountant', N'9677636475', N'ateniese@outlook.com', N'Resources/069-happy-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (70, N'Ryleigh ', N'Brooks', N'Leonie', 769203, 2681, 532086, N'Holly Springs, NC 27540', N'', N'Starbucks', N'School Counselor', N'6258105235', N'ismail@hotmail.com', N'Resources/070-late.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (71, N'Brendan ', N'Ewing', N'Adele', 160995, 4152, 626951, N'7773 Ridge Dr.', N'', N'Prada', N'Computer Support Specialist', N'79754835566', N'oechslin@optonline.net', N'Resources/071-heart.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (72, N'Cheyenne ', N'Kirk', N'Julian', 595389, 4306, 40675, N'New Haven, CT 06511', N'', N'Gap Inc.', N'Historian', N'77188502518', N'jugalator@att.net', N'Resources/072-sick-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (73, N'Jacoby ', N'Rojas', N'Rose', 402446, 9367, 7428, N'551 Spruce St.', N'', N'Kia Motors', N'Computer Hardware Engineer', N'75506452520', N'subir@verizon.net', N'Resources/073-sad-12.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (74, N'Keshawn ', N'Cummings', N'Paul', 115339, 4536, 249425, N'Mount Holly, NJ 08060', N'', N'Cisco Systems, Inc.', N'Designer', N'75512704620', N'bryam@verizon.net', N'Resources/074-in-love-10.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (75, N'Mohammed ', N'Crawford', N'Amelia', 213639, 8478, 327248, N'116 Woodside St.', N'', N'Home Depot', N'Hairdresser', N'74894443438', N'jpflip@optonline.net', N'Resources/075-shocked-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (76, N'Nancy ', N'Bryan', N'Devon', 347268, 1871, 990658, N'Bridgewater, NJ 08807', N'', N'Vodafone', N'Lawyer', N'74018621637', N'mgemmons@comcast.net', N'Resources/076-happy-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (77, N'Maxwell ', N'Lynn', N'Ellory', 431190, 1567, 707963, N'9817 Manor St.', N'', N'Hewlett-Packard', N'Real Estate Agent', N'75076254900', N'csilvers@icloud.com', N'Resources/077-shocked-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (78, N'Zack ', N'Khan', N'Gabriel', 372202, 9952, 670847, N'West Des Moines, IA 50265', N'', N'Hermès', N'Customer Service Representative', N'74585660054', N'karasik@msn.com', N'Resources/078-cool-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (79, N'Selina ', N'Walls', N'Ashten', 514525, 8168, 434380, N'9 Prince Street', N'', N'Oracle Corporation', N'Fitness Trainer', N'79793466593', N'wetter@yahoo.ca', N'Resources/079-crying-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (80, N'Jerry ', N'Garner', N'Everett', 393741, 8239, 255295, N'Brookline, MA 02446', N'', N'Canon', N'Social Worker', N'73205479952', N'thassine@me.com', N'Resources/080-zombie.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (81, N'Kaila ', N'Carroll', N'Grey', 822374, 2909, 535063, N'549 Marvon St.', N'', N'KFC', N'Economist', N'74298091931', N'sassen@msn.com', N'Resources/081-pain.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (82, N'Sean ', N'Conway', N'Garrison', 598823, 5367, 325417, N'Dundalk, MD 21222', N'', N'General Electric', N'Writer', N'74642859954', N'jandrese@yahoo.ca', N'Resources/082-cyclops.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (83, N'Makaila ', N'Cantu', N'Fernando', 472573, 5298, 825989, N'1 Theatre Drive', N'', N'BMW', N'Logistician', N'77484614491', N'tmccarth@live.com', N'Resources/083-sweat.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (84, N'Jacquelyn ', N'Mccall', N'Sherleen', 373737, 3605, 964951, N'Lumberton, NC 28358', N'', N'The Walt Disney Company', N'Environmental scientist', N'75789351637', N'gtewari@icloud.com', N'Resources/084-thief.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (85, N'Milton ', N'Swanson', N'Chase', 691253, 8146, 765391, N'673 Hamilton Road', N'', N'American Express', N'Patrol Officer', N'79276524631', N'hampton@yahoo.com', N'Resources/085-sad-11.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (86, N'Rodolfo ', N'Lynn', N'Zion', 623470, 7932, 852333, N'Farmingdale, NY 11735', N'', N'Burberry', N'Plumber', N'75956156057', N'jesse@me.com', N'Resources/086-kiss-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (87, N'Paula ', N'Walls', N'Breean', 774559, 7817, 929343, N'9662 Bay Ave.', N'', N'Pizza Hut', N'Dancer', N'77512403137', N'jugalator@me.com', N'Resources/087-father-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (88, N'Adison ', N'Olson', N'Henry', 114286, 4402, 550100, N'Hamburg, NY 14075', N'', N'H&M', N'Pharmacist', N'76269742035', N'bhima@sbcglobal.net', N'Resources/088-father.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (89, N'Jacob ', N'Haynes', N'Marcellus', 857949, 2794, 735633, N'8604 Fairfield Ave.', N'', N'Heineken Brewery', N'Truck Driver', N'72019791451', N'gommix@comcast.net', N'Resources/089-angel-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (90, N'Corinne ', N'Roberts', N'Suzan', 823005, 7429, 329850, N'Wisconsin Rapids, WI 54494', N'', N'PepsiCo', N'Medical Secretary', N'74932193942', N'symbolic@verizon.net', N'Resources/090-happy-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (91, N'Aimee ', N'Ewing', N'Lane', 285690, 6306, 230064, N'56 Vale St.', N'', N'Bank of America', N'Diagnostic Medical Sonographer', N'74074855030', N'bruck@outlook.com', N'Resources/091-sad-10.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (92, N'Alejandro ', N'Cordova', N'Hollyn', 315564, 9370, 249749, N'Mount Juliet, TN 37122', N'', N'Nintendo', N'High School Teacher', N'79194782497', N'jeteve@optonline.net', N'Resources/092-outrage-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (93, N'Byron ', N'Haynes', N'Bram', 42988, 1685, 97229, N'9523 Linda Lane', N'', N'Johnson & Johnson', N'Marriage & Family Therapist', N'74828029580', N'jsnover@comcast.net', N'Resources/093-ugly-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (94, N'Genevieve ', N'Keith', N'David', 865823, 5467, 316039, N'Tullahoma, TN 37388', N'', N'HSBC', N'Editor', N'74559446449', N'hakim@comcast.net', N'Resources/094-ugly-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (95, N'Dane ', N'Obrien', N'Shane', 712362, 9596, 813449, N'3 Ashley Ave.', N'', N'Kellogg Company', N'Substance Abuse Counselor', N'77103882563', N'dexter@sbcglobal.net', N'Resources/095-scared.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (96, N'Nayeli ', N'Church', N'Kent', 410913, 9527, 790714, N'Ann Arbor, MI 48103', N'', N'MasterCard', N'Public Relations Specialist', N'77594523846', N'jlbaumga@hotmail.com', N'Resources/096-tongue-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (97, N'Ashtyn ', N'Jimenez', N'Rhett', 404116, 6760, 515537, N'9851 East Prince Street', N'', N'Gucci', N'Computer Systems Analyst', N'76878011332', N'djupedal@hotmail.com', N'Resources/097-sad-9.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (98, N'Kimberly ', N'Wilkerson', N'Carelyn', 965470, 9484, 262017, N'Dothan, AL 36301', N'', N'Mercedes-Benz', N'Preschool Teacher', N'76913363494', N'daveewart@verizon.net', N'Resources/098-nerd-9.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (99, N'Tripp ', N'Curtis', N'Apollo', 682782, 6426, 201742, N'8329 North Greenview St.', N'', N'L''Oréal', N'Dentist', N'74932743888', N'msherr@sbcglobal.net', N'Resources/099-greed-2.png', N'')
GO
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (100, N'Eleanor ', N'Zavala', N'George', 656706, 3709, 905558, N'Hartford, CT 06106', N'', N'Global Gillette', N'Teacher Assistant', N'79834704528', N'crusader@sbcglobal.net', N'Resources/100-whistle.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (101, N'Harper ', N'Thomas', N'Jae', 205524, 4948, 243277, N'215 Purple Finch Lane', N'', N'Coca-Cola', N'Musician', N'74369518996', N'mdielmann@sbcglobal.net', N'Resources/101-nerd-8.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (102, N'Maximo ', N'Stephenson', N'Dex', 605243, 8134, 119462, N'Annapolis, MD 21401', N'', N'Harley-Davidson Motor Company', N'Paralegal', N'72108897840', N'ovprit@me.com', N'Resources/102-muted-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (103, N'Kiara ', N'James', N'Jeremy', 997003, 7133, 791278, N'63 53rd Ave.', N'', N'Corona', N'Software Developer', N'73904997403', N'calin@att.net', N'Resources/103-in-love-9.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (104, N'Isabella ', N'Fuller', N'Naomi', 304017, 4021, 306011, N'Hagerstown, MD 21740', N'', N'Johnnie Walker', N'Zoologist', N'78057218540', N'thowell@yahoo.ca', N'Resources/104-in-love-8.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (105, N'Cynthia ', N'Garrison', N'Matilda', 398883, 3516, 21763, N'2 Greenrose Rd.', N'', N'SAP', N'Medical Assistant', N'75782205882', N'mpiotr@yahoo.com', N'Resources/105-kiss-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (106, N'Donte ', N'Flowers', N'Brock', 684076, 8533, 494549, N'Maspeth, NY 11378', N'', N'Smirnoff', N'Desktop publisher', N'74156318358', N'bester@gmail.com', N'Resources/106-in-love-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (107, N'Asia ', N'Rivera', N'Carmden', 439727, 1618, 262275, N'298 N. Hudson Court', N'', N'Toyota Motor Corporation', N'Actor', N'79009030657', N'imightb@gmail.com', N'Resources/107-ugly.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (108, N'Trace ', N'Hahn', N'Clelia', 991998, 2835, 464652, N'Howell, NJ 07731', N'', N'Caterpillar Inc.', N'Sports Coach', N'78794426528', N'jschauma@icloud.com', N'Resources/108-nerd-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (109, N'Mohammed ', N'Farley', N'Levi', 504230, 7748, 200443, N'3 Peg Shop St.', N'', N'Avon', N'Dental Hygienist', N'76493744690', N'syrinx@gmail.com', N'Resources/109-nerd-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (110, N'Nicholas ', N'Velez', N'Dawn', 175687, 4853, 971839, N'Bayonne, NJ 07002', N'', N'Budweiser Stag Brewing Company', N'School Psychologist', N'74878715975', N'konit@aol.com', N'Resources/110-crying-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (111, N'Jamir ', N'Curtis', N'Tavian', 947212, 3983, 30097, N'648 Hill Field St.', N'', N'IBM', N'Librarian', N'75035726773', N'wonderkid@hotmail.com', N'Resources/111-muted-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (112, N'Cyrus ', N'Rose', N'Jacklyn', 360206, 7435, 655574, N'South Richmond Hill, NY 11419', N'', N'Chase', N'Telemarketer', N'77097566389', N'pjacklam@verizon.net', N'Resources/112-nerd-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (113, N'Dakota ', N'Torres', N'Cash', 179023, 4559, 592365, N'477 Oakland Street', N'', N'NTT Data', N'Interpreter & Translator', N'79316527478', N'tokuhirom@live.com', N'Resources/113-kiss-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (114, N'Matias ', N'Valencia', N'Reagan', 137023, 2102, 279901, N'Lynnwood, WA 98037', N'', N'Intel Corporation', N'Food Scientist', N'75244497554', N'adillon@comcast.net', N'Resources/114-greed-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (115, N'Rocco ', N'Harding', N'Gwendolen', 304278, 2018, 690136, N'4 Division Lane', N'', N'Sony', N'Marketing Manager', N'73478078932', N'bcevc@yahoo.ca', N'Resources/115-pirate-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (116, N'Maya ', N'Clark', N'Evelyn', 441301, 4625, 224776, N'Champlin, MN 55316', N'', N'Tesco Corporation', N'Insurance Agent', N'76756948839', N'crobles@me.com', N'Resources/116-music.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (117, N'Bryan', N'Hays', N'Wade', 370682, 8451, 475381, N'8021 Shadow Brook Dr.', N'', N'Microsoft', N'Farmer', N'77799668126', N'tjensen@verizon.net', N'Resources/117-confused-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (118, N'Jessie', N'Nelson', N'Jack', 527026, 7035, 89070, N'Lancaster, NY 14086', N'', N'McDonald''s', N'Human Resources Assistant', N'77913574942', N'gozer@icloud.com', N'Resources/118-nerd-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (119, N'Joy', N'Franklin', N'Warren', 798890, 2846, 15158, N'7073 Hall Avenue', N'', N'VISA', N'Paramedic', N'72926627836', N'brbarret@yahoo.ca', N'Resources/119-greed.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (120, N'Carlie', N'Lang', N'Rebecca', 90494, 9368, 983441, N'West Babylon, NY 11704', N'', N'Zara', N'Automotive mechanic', N'79523744396', N'mcnihil@me.com', N'Resources/120-nerd-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (121, N'Issac', N'Hurley', N'Blanche', 721186, 7906, 930722, N'985B Winding Way Dr.', N'', N'Morgan Stanley', N'Receptionist', N'77588499991', N'damian@yahoo.com', N'Resources/121-crying-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (122, N'Ariel', N'Sims', N'Bailey', 479522, 9254, 866890, N'South Windsor, CT 06074', N'', N'Mitsubishi', N'Construction Manager', N'75346872128', N'neonatus@aol.com', N'Resources/122-cheering.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (123, N'Braedon', N'Delgado', N'Oliver', 384983, 3627, 821333, N'570 Old Bayberry Street', N'', N'Audi', N'Physician', N'76425484829', N'tellis@icloud.com', N'Resources/123-surprised-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (124, N'Christian', N'Suarez', N'Lee', 222522, 5989, 74910, N'Billerica, MA 01821', N'', N'eBay', N'Mathematician', N'79805315346', N'frode@live.com', N'Resources/124-muted-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (125, N'Lilah', N'Marks', N'Anthony', 358162, 3584, 882011, N'9122 South Addison St.', N'', N'Ralph Lauren Corporation', N'Electrical Engineer', N'76283261104', N'sjava@aol.com', N'Resources/125-sick-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (126, N'Jeffrey', N'Rowland', N'Gillian', 46042, 4406, 450845, N'East Lansing, MI 48823', N'', N'Wal-Mart', N'Physicist', N'76693357511', N'harryh@live.com', N'Resources/126-graduated.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (127, N'Hannah', N'Jordan', N'Verena', 931653, 5511, 233625, N'14 West Fifth St.', N'', N'Panasonic Corporation', N'Police Officer', N'73993448840', N'elflord@me.com', N'Resources/127-angry-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (128, N'Peyton', N'Hinton', N'Benjamin', 284910, 8020, 672826, N'Skokie, IL 60076', N'', N'Nike, Inc.', N'Maintenance & Repair Worker', N'76436765328', N'ramollin@mac.com', N'Resources/128-in-love-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (129, N'Clayton', N'Forbes', N'Zachary', 236405, 8660, 422773, N'7267 W. Roehampton St.', N'', N'Nissan Motor Co., Ltd.', N'Statistician', N'75359837587', N'kronvold@mac.com', N'Resources/129-cool-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (130, N'Salvatore', N'Cabrera', N'Krystan', 277801, 7218, 348484, N'Harrisonburg, VA 22801', N'', N'MTV', N'Epidemiologist', N'73109258844', N'louise@aol.com', N'Resources/130-confused-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (131, N'Andre', N'Taylor', N'Felix', 710684, 4813, 233687, N'82 Oak Meadow Dr.', N'', N'Cartier SA', N'Reporter', N'74578476033', N'nanop@verizon.net', N'Resources/131-sad-8.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (132, N'Kadin', N'Mcclain', N'Riley', 683064, 8704, 28020, N'Cambridge, MA 02138', N'', N'Nescafé', N'Elementary School Teacher', N'73307307648', N'gtewari@sbcglobal.net', N'Resources/132-nerd-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (133, N'Jaida', N'Nichols', N'Lucinda', 341967, 9908, 683123, N'864 Highland Drive', N'', N'Allianz', N'Childcare worker', N'76198834911', N'ylchang@mac.com', N'Resources/133-birthday-boy.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (134, N'Reid', N'Church', N'Candice', 159699, 6752, 228468, N'Alliance, OH 44601', N'', N'Ferrari S.p.A.', N'Loan Officer', N'74827447133', N'gommix@yahoo.com', N'Resources/134-surprised-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (135, N'Karley', N'Harrington', N'Kathryn', 911426, 8059, 882058, N'9465 St Paul Avenue', N'', N'Kleenex', N'Drafter', N'73695374704', N'uncle@sbcglobal.net', N'Resources/135-selfie.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (136, N'Beau', N'Rivers', N'Lillian', 55461, 8452, 577380, N'Massillon, OH 44646', N'', N'Tiffany & Co.', N'Cost Estimator', N'75402398104', N'smcnabb@live.com', N'Resources/136-tongue-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (137, N'Riley', N'Bentley', N'Hugh', 331700, 4452, 279775, N'7651 South La Sierra Dr.', N'', N'3M', N'Clinical Laboratory Technician', N'78637142111', N'shrapnull@aol.com', N'Resources/137-smart-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (138, N'Ellis', N'Choi', N'Julina', 765331, 3520, 185983, N'Centreville, VA 20120', N'', N'Shell Oil Company', N'Electrician', N'78396944168', N'djpig@sbcglobal.net', N'Resources/138-smart.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (139, N'Jaylyn', N'Leon', N'Ellison', 761047, 8629, 629180, N'3 Alton Lane', N'', N'Adobe Systems', N'Referee', N'79838686473', N'oechslin@hotmail.com', N'Resources/139-surprised-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (140, N'Drew', N'Mayer', N'Carlen', 911641, 2381, 336638, N'Glen Allen, VA 23059', N'', N'IKEA', N'Judge', N'73255747514', N'xnormal@verizon.net', N'Resources/140-3d-glasses.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (141, N'Ashleigh', N'Walters', N'Claude', 590673, 3634, 418814, N'9441 W. Pineknoll Drive', N'', N'Nokia', N'Security Guard', N'79216830258', N'atmarks@icloud.com', N'Resources/141-in-love-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (142, N'Scott', N'Dickerson', N'Arden', 725569, 5913, 579121, N'Florence, SC 29501', N'', N'Sprite', N'Budget analyst', N'75034467180', N'makarow@comcast.net', N'Resources/142-sleeping.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (143, N'Kolton', N'Knight', N'Miriam', 344201, 7702, 254837, N'7070 Shady Street', N'', N'Xerox', N'Painter', N'74672435219', N'raides@yahoo.com', N'Resources/143-pirate.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (144, N'Izabelle', N'Boyle', N'Naveen', 625946, 2262, 196936, N'Lewiston, ME 04240', N'', N'Samsung Group', N'Occupational Therapist', N'76337007724', N'hwestiii@mac.com', N'Resources/144-santa-claus.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (145, N'Haylie', N'Singleton', N'Sue', 243340, 1646, 134470, N'146 East Bank Street', N'', N'Google', N'Physical Therapist', N'76328747209', N'scitext@gmail.com', N'Resources/145-wink.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (146, N'Sariah', N'Lin', N'Olive', 460491, 2153, 905724, N'Billings, MT 59101', N'', N'Louis Vuitton', N'Photographer', N'73685991877', N'gward@yahoo.ca', N'Resources/146-in-love-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (147, N'Chace', N'Spears', N'Elodie', 716773, 3126, 124048, N'8723 Cedar Swamp Drive', N'', N'Apple Inc.', N'Cashier', N'73248861499', N'bockelboy@outlook.com', N'Resources/147-tired.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (148, N'Liam', N'Frazier', N'Korin', 972758, 8828, 885712, N'Norman, OK 73072', N'', N'Verizon Communications', N'Educator', N'73743564166', N'tubesteak@comcast.net', N'Resources/148-bang.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (149, N'Joseph', N'Stokes', N'William', 880420, 8114, 561214, N'8419 E. Harvey Drive', N'', N'Credit Suisse', N'Professional athlete', N'78689822419', N'krueger@mac.com', N'Resources/149-baby.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (150, N'Lorelei', N'Hurley', N'Coralie', 811955, 8085, 969805, N'Groton, CT 06340', N'', N'Wells Fargo', N'Janitor', N'77817855837', N'skaufman@optonline.net', N'Resources/150-tongue.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (151, N'Miguel', N'Leon', N'Haiden', 208906, 1318, 140377, N'179 Manchester St.', N'', N'Yahoo!', N'Massage Therapist', N'4893616374', N'tezbo@live.com', N'Resources/151-sick-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (152, N'Melina', N'Hamilton', N'Isaac', 642377, 3115, 74940, N'Chelmsford, MA 01824', N'', N'Porsche', N'Psychologist', N'8728567001', N'crowl@icloud.com', N'Resources/152-outrage.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (153, N'Serena', N'Duke', N'Arthur', 553212, 5150, 190255, N'70 Cambridge Ave.', N'', N'Moët et Chandon', N'IT Manager', N'8128144854', N'plover@hotmail.com', N'Resources/153-injury.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (154, N'Kristen', N'Dillon', N'Kylie', 626192, 4169, 521443, N'Durham, NC 27703', N'', N'Hyundai', N'Anthropologist', N'8035104214', N'calin@aol.com', N'Resources/154-dead.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (155, N'Saniyah', N'Hawkins', N'Josiah', 33192, 7466, 845900, N'566 S. Cherry Street', N'', N'Honda Motor Company, Ltd', N'Executive Assistant', N'8693699524', N'timtroyr@live.com', N'Resources/155-rich-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (156, N'Thalia', N'Leach', N'Nicolas', 768816, 2646, 584534, N'Forney, TX 75126', N'', N'Beko', N'Artist', N'4645853155', N'keutzer@yahoo.com', N'Resources/156-sick.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (157, N'Irene', N'Caldwell', N'Noah', 336554, 5732, 660042, N'83 NE. Hill Dr.', N'', N'Deere & Company', N'Mechanical Engineer', N'7039587186', N'thurston@outlook.com', N'Resources/157-angel.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (158, N'Nikhil', N'Bowen', N'Glenn', 555116, 5254, 207488, N'Norwood, MA 02062', N'', N'Volkswagen Group', N'Firefighter', N'5156150912', N'mbalazin@att.net', N'Resources/158-nerd-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (159, N'Jolie', N'Charles', N'Matteo', 403999, 3285, 586366, N'556 Summerhouse Street', N'', N'Pampers', N'Carpenter', N'8549415210', N'dkasak@gmail.com', N'Resources/159-crying-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (160, N'Xavier', N'Baxter', N'Joseph', 588622, 1373, 962553, N'Nottingham, MD 21236', N'', N'BlackBerry', N'Actuary', N'3805734186', N'esbeck@comcast.net', N'Resources/160-crying-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (161, N'Lukas', N'Dean', N'Ellice', 691040, 1890, 594473, N'9750 Hawthorne Ave.', N'', N'Jack Daniel''s', N'Compliance Officer', N'2973690265', N'novanet@aol.com', N'Resources/161-muted-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (162, N'Athena', N'King', N'Lilibeth', 217825, 3307, 236159, N'Muskogee, OK 74403', N'', N'Facebook, Inc.', N'Computer Systems Administrator', N'6712935634', N'mhouston@me.com', N'Resources/162-surprised-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (163, N'Adan', N'Noble', N'Bree', 297169, 3286, 238674, N'97 Elmwood Street', N'', N'United Parcel Service', N'HR Specialist', N'3052146934', N'bahwi@yahoo.com', N'Resources/163-crying.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (164, N'Kiley', N'Pham', N'Madeleine', 289619, 2401, 924581, N'Seymour, IN 47274', N'', N'Adidas', N'Recreation & Fitness Worker', N'8129199643', N'chrisj@outlook.com', N'Resources/164-sad-7.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (165, N'Steven', N'Johnston', N'Kai', 252786, 8507, 812525, N'308 Studebaker Drive', N'', N'Siemens AG', N'Financial Advisor', N'7547693349', N'louise@gmail.com', N'Resources/165-cool-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (166, N'Ayana', N'Hart', N'Dash', 187671, 9342, 123262, N'Algonquin, IL 60102', N'', N'Citigroup', N'Auto Mechanic', N'2063232722', N'qrczak@me.com', N'Resources/166-happy-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (167, N'Aileen', N'Copeland', N'Seth', 401389, 1067, 840534, N'15 Marsh St.', N'', N'Amazon.com', N'Web Developer', N'2734957160', N'arachne@hotmail.com', N'Resources/167-thinking-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (168, N'Emery', N'Pitts', N'Eli', 445653, 2273, 327317, N'Garden City, NY 11530', N'', N'AT&T', N'Civil Engineer', N'4639323808', N'mfburgo@icloud.com', N'Resources/168-muted.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (169, N'Vicente', N'Chavez', N'Bernice', 754163, 6403, 917835, N'8614 Charles Street', N'', N'Starbucks', N'Chemist', N'5517890645', N'karasik@att.net', N'Resources/169-confused.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (170, N'Cherish', N'Monroe', N'Vanessa', 930948, 3912, 254859, N'Wake Forest, NC 27587', N'', N'Prada', N'Recreational Therapist', N'5747597866', N'hauma@icloud.com', N'Resources/170-happy-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (171, N'Karley', N'Petersen', N'Rory', 604291, 4008, 450994, N'57 Gulf Avenue', N'', N'Gap Inc.', N'Microbiologist', N'8528025653', N'scitext@me.com', N'Resources/171-thinking.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (172, N'Alondra', N'Le', N'Clark', 930219, 3059, 301844, N'South Lyon, MI 48178', N'', N'Kia Motors', N'Event Planner', N'3424530606', N'matthijs@live.com', N'Resources/172-nerd.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (173, N'Dorian', N'Bird', N'Judd', 664172, 5208, 833457, N'694 Linden St.', N'', N'Cisco Systems, Inc.', N'Coach', N'4345744540', N'bryam@icloud.com', N'Resources/173-in-love-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (174, N'Karley', N'Goodwin', N'Noel', 777372, 6338, 522008, N'Missoula, MT 59801', N'', N'Home Depot', N'Radiologic Technologist', N'4257832253', N'tellis@att.net', N'Resources/174-hypnotized.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (175, N'Killian', N'Davidson', N'Janetta', 73589, 8029, 357874, N'8440 Lyme St.', N'', N'Vodafone', N'Market Research Analyst', N'8894494391', N'makarow@verizon.net', N'Resources/175-cool.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (176, N'Ava', N'Melton', N'Annabel', 509266, 1788, 809566, N'Zeeland, MI 49464', N'', N'Hewlett-Packard', N'Housekeeper', N'8253018250', N'citadel@msn.com', N'Resources/176-shocked.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (177, N'Adam', N'Horton', N'Blake', 502335, 2735, 933854, N'7632 Oakwood Rd.', N'', N'Hermès', N'Computer Programmer', N'3973342086', N'jaxweb@me.com', N'Resources/177-easter.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (178, N'Jaydin', N'Singh', N'Jordon', 934686, 7540, 651032, N'Pembroke Pines, FL 33028', N'', N'Oracle Corporation', N'Secretary', N'2415703040', N'mcsporran@aol.com', N'Resources/178-surprised-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (179, N'Lexie', N'Mckinney', N'Charles', 515191, 9803, 938289, N'881 Temple St.', N'', N'Canon', N'Bus Driver', N'7134628265', N'tubesteak@mac.com', N'Resources/179-surprised-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (180, N'Niko', N'Calderon', N'Troy', 353462, 7220, 163048, N'South El Monte, CA 91733', N'', N'KFC', N'Systems Analyst', N'8548222331', N'kludge@verizon.net', N'Resources/180-surprised.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (181, N'Terrence', N'Acevedo', N'Viola', 262338, 9575, 906781, N'9591 Honey Creek St.', N'', N'General Electric', N'Chef', N'4397136117', N'lahvak@hotmail.com', N'Resources/181-furious.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (182, N'Madisyn', N'May', N'Byron', 986773, 7751, 13897, N'Webster, NY 14580', N'', N'BMW', N'Registered Nurse', N'2309068815', N'raides@sbcglobal.net', N'Resources/182-sad-6.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (183, N'Jadon', N'Ponce', N'Doran', 763831, 9853, 457951, N'7018 Pilgrim Street', N'', N'The Walt Disney Company', N'Surveyor', N'5988952899', N'gfxguy@aol.com', N'Resources/183-sad-5.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (184, N'Jaylen', N'Thornton', N'Tobias', 392150, 2868, 998746, N'Bismarck, ND 58501', N'', N'American Express', N'Urban Planner', N'4296781872', N'krueger@msn.com', N'Resources/184-sad-4.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (185, N'Brendan', N'Kelly', N'Damien', 883500, 7019, 537973, N'697 Westminster St.', N'', N'Burberry', N'Middle School Teacher', N'2767501655', N'shang@yahoo.ca', N'Resources/185-sad-3.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (186, N'Helena', N'Houston', N'Murphy', 516117, 1529, 374799, N'Harleysville, PA 19438', N'', N'Pizza Hut', N'Speech-Language Pathologist', N'8059532020', N'kalpol@comcast.net', N'Resources/186-angry-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (187, N'Madalyn', N'Moon', N'Carleen', 42100, 7513, 519988, N'959 Birchpond St.', N'', N'H&M', N'Personal Care Aide', N'6116702147', N'kildjean@msn.com', N'Resources/187-rich.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (188, N'Marcelo', N'Johns', N'Louisa', 664723, 5292, 936784, N'Euless, TX 76039', N'', N'Heineken Brewery', N'Database administrator', N'2424877082', N'treeves@comcast.net', N'Resources/188-sad-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (189, N'Jay', N'Campos', N'Georgina', 216584, 1446, 901170, N'67 Pumpkin Hill Lane', N'', N'PepsiCo', N'Database administrator', N'9396417992', N'timtroyr@icloud.com', N'Resources/189-happy-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (190, N'Khalil', N'Sullivan', N'Rylie', 693874, 6353, 525378, N'Yorktown Heights, NY 10598', N'', N'Bank of America', N'Landscaper & Groundskeeper', N'6694822353', N'world@att.net', N'Resources/190-sad-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (191, N'Nikhil', N'Merritt', N'Claudia', 615943, 8638, 809450, N'5 NE. Newcastle Drive', N'', N'Nintendo', N'Court Reporter', N'8018140510', N'kspiteri@icloud.com', N'Resources/191-sad.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (192, N'Blaine', N'Melendez', N'Vivian', 298274, 5428, 921280, N'Ithaca, NY 14850', N'', N'Johnson & Johnson', N'Bookkeeping clerk', N'3623384199', N'rtanter@att.net', N'Resources/192-smile.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (193, N'Clayton', N'Munoz', N'Caylen', 885055, 8862, 225076, N'94 Longbranch St.', N'', N'HSBC', N'Landscape Architect', N'8976550021', N'twoflower@mac.com', N'Resources/193-in-love-2.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (194, N'Khalil', N'Montgomery', N'Eloise', 326715, 2574, 276634, N'Mount Prospect, IL 60056', N'', N'Kellogg Company', N'College Professor', N'7108593522', N'howler@msn.com', N'Resources/194-happy.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (195, N'Bruce', N'Medina', N'Elein', 990305, 7843, 242952, N'566 Gulf St.', N'', N'MasterCard', N'Respiratory Therapist', N'6129342623', N'yfreund@sbcglobal.net', N'Resources/195-kiss-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (196, N'Lesly', N'Landry', N'Gregory', 765287, 5688, 140550, N'Wantagh, NY 11793', N'', N'Gucci', N'Mason', N'8963969500', N'nogin@msn.com', N'Resources/196-in-love-1.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (197, N'Alyson', N'Hartman', N'Lee', 461000, 7217, 925983, N'518 Clinton Ave.', N'', N'Mercedes-Benz', N'Veterinarian', N'5338911018', N'onestab@live.com', N'Resources/197-in-love.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (198, N'Ellen', N'Contreras', N'Fawn', 96165, 1559, 783035, N'Encino, CA 91316', N'', N'L''Oréal', N'Architect', N'3092793798', N'lcheng@mac.com', N'Resources/198-kiss.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (199, N'Sofia', N'Barr', N'Kingston', 736537, 3480, 897782, N'370 Ashley Lane', N'', N'KFC', N'Accountant', N'4836649876', N'bdthomas@yahoo.com', N'Resources/199-angry.png', N'')
GO
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (200, N'Joyce', N'Wilkerson', N'Payten', 241468, 6440, 838036, N'Wausau, WI 54401', N'', N'General Electric', N'School Counselor', N'241468', N'hoangle@optonline.net', N'Resources/200-sleepy.png', N'')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (201, N'333', N'333', N'33', 333, 1, 333, N'333', N'33', N'333', N'33', N'333', N'333', N'C:\Users\PC\Desktop\Practic screen\Водители.png', N'ghgh')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (202, N'1212', N'1212', N'1212', 1212, 1212, 1212, N'1212', N'1212', N'1212', N'12121212', N'1212', N'1212@ff', N'C:\Users\PC\Desktop\Practic screen\Автомобили.png', N'ff')
INSERT [dbo].[Driver] ([Id], [Name], [Surname], [Patronymic], [PassportNumber], [PassportSerial], [Postcode], [RegistrationAddress], [ResidentialAddress], [CompanyName], [JobTitle], [PhoneNumber], [Email], [Photo], [Description]) VALUES (203, N'45', N'45', N'45', 45, 45, 45, N'45', N'45', N'45', N'45', N'45', N'45@FF', N'C:\Users\PC\Desktop\Practic screen\Водители.png', N'56')
SET IDENTITY_INSERT [dbo].[Driver] OFF
GO
SET IDENTITY_INSERT [dbo].[DriverOfAccident] ON 

INSERT [dbo].[DriverOfAccident] ([id], [VehicleAccidentId], [DriverID]) VALUES (1, 1, 1)
INSERT [dbo].[DriverOfAccident] ([id], [VehicleAccidentId], [DriverID]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [dbo].[DriverOfAccident] OFF
GO
SET IDENTITY_INSERT [dbo].[EngineType] ON 

INSERT [dbo].[EngineType] ([Id], [NameRU], [NameEN]) VALUES (1, N'Бензиновый', N'Petrol')
INSERT [dbo].[EngineType] ([Id], [NameRU], [NameEN]) VALUES (2, N'Дизельный', N'Diesel')
INSERT [dbo].[EngineType] ([Id], [NameRU], [NameEN]) VALUES (3, N'Газовый', N'Gas')
SET IDENTITY_INSERT [dbo].[EngineType] OFF
GO
SET IDENTITY_INSERT [dbo].[License] ON 

INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (1, CAST(N'2019-01-13' AS Date), CAST(N'2027-07-03' AS Date), N'56 40', 613073, 1, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (2, CAST(N'2018-08-02' AS Date), CAST(N'2023-09-21' AS Date), N'74 65', 904246, 2, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (3, CAST(N'2018-12-31' AS Date), CAST(N'2025-01-25' AS Date), N'67 50', 769897, 3, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (4, CAST(N'2019-02-26' AS Date), CAST(N'2021-10-30' AS Date), N'44 67', 967541, 4, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (5, CAST(N'2019-03-12' AS Date), CAST(N'2025-06-03' AS Date), N'93 60', 117922, 5, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (6, CAST(N'2018-05-29' AS Date), CAST(N'2021-07-15' AS Date), N'96 40', 750187, 6, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (7, CAST(N'2018-09-20' AS Date), CAST(N'2019-07-10' AS Date), N'11 48', 615982, 7, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (8, CAST(N'2018-06-21' AS Date), CAST(N'2022-11-18' AS Date), N'61 61', 864298, 8, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (9, CAST(N'2019-05-14' AS Date), CAST(N'2020-11-18' AS Date), N'95 66', 936083, 9, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (10, CAST(N'2019-02-28' AS Date), CAST(N'2019-10-15' AS Date), N'17 54', 167771, 10, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (11, CAST(N'2018-06-23' AS Date), CAST(N'2022-06-14' AS Date), N'89 65', 820437, 11, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (12, CAST(N'2019-02-01' AS Date), CAST(N'2027-05-06' AS Date), N'13 45', 505754, 12, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (13, CAST(N'2019-04-11' AS Date), CAST(N'2020-01-08' AS Date), N'68 45', 157412, 13, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (14, CAST(N'2018-10-20' AS Date), CAST(N'2021-08-28' AS Date), N'37 63', 724944, 14, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (15, CAST(N'2018-11-04' AS Date), CAST(N'2020-08-18' AS Date), N'57 53', 428231, 15, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (16, CAST(N'2018-08-23' AS Date), CAST(N'2024-01-30' AS Date), N'21 59', 855910, 16, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (17, CAST(N'2019-02-08' AS Date), CAST(N'2024-08-16' AS Date), N'57 71', 562291, 17, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (18, CAST(N'2018-12-31' AS Date), CAST(N'2023-10-03' AS Date), N'95 50', 828023, 18, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (19, CAST(N'2018-08-05' AS Date), CAST(N'2028-01-24' AS Date), N'22 69', 366545, 19, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (20, CAST(N'2018-12-09' AS Date), CAST(N'2020-04-19' AS Date), N'34 49', 882286, 20, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (21, CAST(N'2018-11-22' AS Date), CAST(N'2020-06-14' AS Date), N'34 53', 766347, 21, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (22, CAST(N'2018-12-11' AS Date), CAST(N'2027-08-22' AS Date), N'22 52', 107095, 22, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (23, CAST(N'2019-02-11' AS Date), CAST(N'2028-05-02' AS Date), N'22 59', 191387, 23, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (24, CAST(N'2019-02-12' AS Date), CAST(N'2028-02-26' AS Date), N'55 67', 914299, 24, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (25, CAST(N'2018-06-28' AS Date), CAST(N'2025-06-14' AS Date), N'37 55', 538095, 25, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (26, CAST(N'2018-05-23' AS Date), CAST(N'2027-02-17' AS Date), N'23 65', 140143, 26, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (27, CAST(N'2018-10-09' AS Date), CAST(N'2019-11-02' AS Date), N'76 44', 231262, 27, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (28, CAST(N'2018-06-06' AS Date), CAST(N'2020-06-20' AS Date), N'71 80', 465917, 28, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (29, CAST(N'2019-02-13' AS Date), CAST(N'2021-03-19' AS Date), N'88 54', 797589, 29, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (30, CAST(N'2018-06-25' AS Date), CAST(N'2022-11-05' AS Date), N'92 43', 289084, 30, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (31, CAST(N'2019-02-15' AS Date), CAST(N'2025-06-24' AS Date), N'24 57', 286769, 31, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (32, CAST(N'2018-08-15' AS Date), CAST(N'2024-08-25' AS Date), N'90 62', 811272, 32, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (33, CAST(N'2019-01-05' AS Date), CAST(N'2021-06-11' AS Date), N'81 60', 668818, 33, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (34, CAST(N'2018-09-25' AS Date), CAST(N'2027-10-07' AS Date), N'49 54', 493125, 34, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (35, CAST(N'2018-09-19' AS Date), CAST(N'2028-04-08' AS Date), N'28 58', 111698, 35, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (36, CAST(N'2018-11-14' AS Date), CAST(N'2026-09-10' AS Date), N'62 68', 279896, 36, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (37, CAST(N'2018-12-16' AS Date), CAST(N'2022-07-25' AS Date), N'31 69', 987280, 37, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (38, CAST(N'2018-08-30' AS Date), CAST(N'2019-06-04' AS Date), N'62 57', 783363, 38, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (39, CAST(N'2018-06-24' AS Date), CAST(N'2028-01-27' AS Date), N'71 46', 913695, 39, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (40, CAST(N'2019-02-17' AS Date), CAST(N'2026-05-15' AS Date), N'90 66', 607418, 40, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (41, CAST(N'2018-09-01' AS Date), CAST(N'2023-01-25' AS Date), N'37 48', 951841, 41, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (42, CAST(N'2018-10-13' AS Date), CAST(N'2022-09-26' AS Date), N'95 70', 754064, 42, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (43, CAST(N'2018-10-25' AS Date), CAST(N'2023-09-16' AS Date), N'81 74', 301902, 43, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (44, CAST(N'2018-09-24' AS Date), CAST(N'2023-05-23' AS Date), N'98 73', 370750, 44, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (45, CAST(N'2018-10-07' AS Date), CAST(N'2021-01-08' AS Date), N'92 63', 836793, 45, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (46, CAST(N'2019-01-30' AS Date), CAST(N'2024-01-08' AS Date), N'85 67', 433962, 46, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (47, CAST(N'2019-02-11' AS Date), CAST(N'2019-07-20' AS Date), N'68 53', 739807, 47, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (48, CAST(N'2019-01-26' AS Date), CAST(N'2021-08-13' AS Date), N'84 59', 127815, 48, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (49, CAST(N'2018-06-17' AS Date), CAST(N'2020-04-19' AS Date), N'65 58', 972443, 49, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (50, CAST(N'2019-03-21' AS Date), CAST(N'2028-03-11' AS Date), N'11 79', 215392, 50, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (51, CAST(N'2018-11-29' AS Date), CAST(N'2024-03-22' AS Date), N'47 50', 682392, 51, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (52, CAST(N'2019-03-14' AS Date), CAST(N'2024-10-02' AS Date), N'57 80', 704668, 52, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (53, CAST(N'2018-09-26' AS Date), CAST(N'2021-10-09' AS Date), N'83 51', 612336, 53, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (54, CAST(N'2019-02-25' AS Date), CAST(N'2020-04-15' AS Date), N'88 48', 700693, 54, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (55, CAST(N'2018-10-17' AS Date), CAST(N'2022-07-04' AS Date), N'45 56', 360521, 55, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (56, CAST(N'2018-10-13' AS Date), CAST(N'2025-11-13' AS Date), N'35 50', 716066, 56, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (57, CAST(N'2019-01-04' AS Date), CAST(N'2025-08-18' AS Date), N'44 43', 378433, 57, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (58, CAST(N'2018-12-31' AS Date), CAST(N'2025-04-19' AS Date), N'70 44', 504351, 58, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (59, CAST(N'2019-03-16' AS Date), CAST(N'2025-08-16' AS Date), N'44 65', 130693, 59, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (60, CAST(N'2018-12-24' AS Date), CAST(N'2021-07-11' AS Date), N'87 44', 923347, 60, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (61, CAST(N'2018-08-12' AS Date), CAST(N'2020-07-30' AS Date), N'83 78', 995967, 61, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (62, CAST(N'2019-01-07' AS Date), CAST(N'2026-04-27' AS Date), N'99 73', 996427, 62, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (63, CAST(N'2019-01-06' AS Date), CAST(N'2022-06-15' AS Date), N'71 53', 413313, 63, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (64, CAST(N'2019-05-18' AS Date), CAST(N'2026-10-19' AS Date), N'43 43', 983635, 64, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (65, CAST(N'2019-03-01' AS Date), CAST(N'2020-04-19' AS Date), N'25 61', 922773, 65, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (66, CAST(N'2018-10-29' AS Date), CAST(N'2022-02-26' AS Date), N'58 78', 165905, 66, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (67, CAST(N'2019-04-22' AS Date), CAST(N'2022-12-14' AS Date), N'72 42', 458530, 67, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (68, CAST(N'2018-06-02' AS Date), CAST(N'2026-10-26' AS Date), N'54 58', 150506, 68, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (69, CAST(N'2019-01-31' AS Date), CAST(N'2025-10-22' AS Date), N'69 76', 403371, 69, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (70, CAST(N'2019-03-26' AS Date), CAST(N'2027-05-16' AS Date), N'45 65', 502480, 70, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (71, CAST(N'2018-10-01' AS Date), CAST(N'2025-04-03' AS Date), N'56 47', 346550, 71, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (72, CAST(N'2018-07-14' AS Date), CAST(N'2027-02-10' AS Date), N'59 40', 123897, 72, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (73, CAST(N'2018-11-03' AS Date), CAST(N'2023-09-19' AS Date), N'75 67', 880032, 73, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (74, CAST(N'2018-08-20' AS Date), CAST(N'2021-11-07' AS Date), N'53 69', 329732, 74, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (75, CAST(N'2019-01-30' AS Date), CAST(N'2024-01-19' AS Date), N'42 65', 754604, 75, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (76, CAST(N'2018-10-13' AS Date), CAST(N'2025-09-25' AS Date), N'45 71', 347925, 76, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (77, CAST(N'2019-02-11' AS Date), CAST(N'2022-11-06' AS Date), N'18 49', 397861, 77, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (78, CAST(N'2018-08-14' AS Date), CAST(N'2021-01-30' AS Date), N'97 55', 409226, 78, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (79, CAST(N'2018-07-10' AS Date), CAST(N'2021-02-22' AS Date), N'17 61', 996073, 79, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (80, CAST(N'2018-10-17' AS Date), CAST(N'2023-07-20' AS Date), N'88 60', 686627, 80, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (81, CAST(N'2018-10-31' AS Date), CAST(N'2028-01-19' AS Date), N'33 68', 892304, 81, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (82, CAST(N'2019-05-07' AS Date), CAST(N'2024-11-04' AS Date), N'96 45', 996326, 82, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (83, CAST(N'2019-02-28' AS Date), CAST(N'2024-03-02' AS Date), N'53 72', 524117, 83, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (84, CAST(N'2019-01-16' AS Date), CAST(N'2021-01-23' AS Date), N'30 76', 820189, 84, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (85, CAST(N'2019-04-05' AS Date), CAST(N'2020-09-10' AS Date), N'31 53', 732792, 85, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (86, CAST(N'2018-05-31' AS Date), CAST(N'2024-07-30' AS Date), N'27 54', 500373, 86, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (87, CAST(N'2018-09-18' AS Date), CAST(N'2022-04-24' AS Date), N'97 52', 660653, 87, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (88, CAST(N'2018-10-31' AS Date), CAST(N'2020-01-21' AS Date), N'16 45', 771049, 88, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (89, CAST(N'2018-08-04' AS Date), CAST(N'2027-01-17' AS Date), N'64 45', 186021, 89, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (90, CAST(N'2018-11-07' AS Date), CAST(N'2021-04-17' AS Date), N'50 45', 725156, 90, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (91, CAST(N'2019-04-14' AS Date), CAST(N'2022-07-18' AS Date), N'29 65', 213322, 91, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (92, CAST(N'2019-02-23' AS Date), CAST(N'2020-01-27' AS Date), N'31 41', 340685, 92, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (93, CAST(N'2019-02-06' AS Date), CAST(N'2019-10-17' AS Date), N'60 71', 733903, 93, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (94, CAST(N'2018-05-27' AS Date), CAST(N'2023-09-29' AS Date), N'54 49', 298803, 94, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (95, CAST(N'2018-08-05' AS Date), CAST(N'2022-11-16' AS Date), N'71 58', 321618, 95, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (96, CAST(N'2018-11-06' AS Date), CAST(N'2024-12-24' AS Date), N'85 53', 424706, 96, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (97, CAST(N'2019-02-06' AS Date), CAST(N'2019-06-19' AS Date), N'29 63', 456353, 97, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (98, CAST(N'2019-01-21' AS Date), CAST(N'2025-10-16' AS Date), N'57 59', 552536, 98, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (99, CAST(N'2018-08-17' AS Date), CAST(N'2021-03-17' AS Date), N'55 65', 355405, 99, 2)
GO
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (100, CAST(N'2019-02-15' AS Date), CAST(N'2022-05-09' AS Date), N'51 57', 441335, 100, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (101, CAST(N'2019-01-13' AS Date), CAST(N'2025-08-29' AS Date), N'59 49', 144483, 101, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (102, CAST(N'2018-08-02' AS Date), CAST(N'2019-07-06' AS Date), N'76 63', 351410, 102, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (103, CAST(N'2018-12-31' AS Date), CAST(N'2019-05-25' AS Date), N'70 45', 177463, 103, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (104, CAST(N'2019-02-26' AS Date), CAST(N'2026-12-12' AS Date), N'51 69', 640455, 104, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (105, CAST(N'2019-03-12' AS Date), CAST(N'2022-01-03' AS Date), N'87 58', 537518, 105, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (106, CAST(N'2018-05-29' AS Date), CAST(N'2019-06-20' AS Date), N'14 48', 206175, 106, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (107, CAST(N'2018-09-20' AS Date), CAST(N'2022-12-06' AS Date), N'98 62', 646552, 107, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (108, CAST(N'2018-06-21' AS Date), CAST(N'2023-08-21' AS Date), N'92 52', 511894, 108, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (109, CAST(N'2019-05-14' AS Date), CAST(N'2022-07-23' AS Date), N'69 65', 215700, 109, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (110, CAST(N'2019-02-28' AS Date), CAST(N'2027-04-07' AS Date), N'53 44', 602449, 110, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (111, CAST(N'2018-06-23' AS Date), CAST(N'2027-11-16' AS Date), N'56 62', 189864, 111, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (112, CAST(N'2019-02-01' AS Date), CAST(N'2024-02-11' AS Date), N'44 55', 179449, 112, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (113, CAST(N'2019-04-11' AS Date), CAST(N'2021-08-06' AS Date), N'14 46', 984592, 113, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (114, CAST(N'2018-10-20' AS Date), CAST(N'2023-04-03' AS Date), N'38 75', 480183, 114, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (115, CAST(N'2018-11-04' AS Date), CAST(N'2028-01-13' AS Date), N'45 48', 143560, 115, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (116, CAST(N'2018-08-23' AS Date), CAST(N'2025-03-08' AS Date), N'87 75', 143198, 116, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (117, CAST(N'2019-02-08' AS Date), CAST(N'2021-07-10' AS Date), N'44 56', 698959, 117, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (118, CAST(N'2018-12-31' AS Date), CAST(N'2021-06-23' AS Date), N'57 74', 218810, 118, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (119, CAST(N'2018-08-05' AS Date), CAST(N'2026-07-05' AS Date), N'73 72', 870584, 119, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (120, CAST(N'2018-12-09' AS Date), CAST(N'2023-05-20' AS Date), N'24 62', 735138, 120, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (121, CAST(N'2018-11-22' AS Date), CAST(N'2022-03-05' AS Date), N'60 70', 112930, 121, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (122, CAST(N'2018-12-11' AS Date), CAST(N'2022-01-13' AS Date), N'45 76', 922777, 122, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (123, CAST(N'2019-02-11' AS Date), CAST(N'2025-09-03' AS Date), N'45 62', 434160, 123, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (124, CAST(N'2019-02-12' AS Date), CAST(N'2021-08-12' AS Date), N'80 67', 198658, 124, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (125, CAST(N'2018-06-28' AS Date), CAST(N'2026-11-07' AS Date), N'36 51', 955678, 125, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (126, CAST(N'2018-05-23' AS Date), CAST(N'2019-01-26' AS Date), N'56 73', 570962, 126, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (127, CAST(N'2018-10-09' AS Date), CAST(N'2025-08-08' AS Date), N'80 43', 244787, 127, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (128, CAST(N'2018-06-06' AS Date), CAST(N'2028-02-08' AS Date), N'61 43', 360486, 128, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (129, CAST(N'2019-02-13' AS Date), CAST(N'2028-05-11' AS Date), N'77 64', 593417, 129, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (130, CAST(N'2018-06-25' AS Date), CAST(N'2020-11-10' AS Date), N'78 69', 300408, 130, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (131, CAST(N'2019-02-15' AS Date), CAST(N'2027-07-14' AS Date), N'92 61', 564412, 131, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (132, CAST(N'2018-08-15' AS Date), CAST(N'2019-04-06' AS Date), N'86 50', 649001, 132, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (133, CAST(N'2019-01-05' AS Date), CAST(N'2021-10-31' AS Date), N'80 51', 417594, 133, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (134, CAST(N'2018-09-25' AS Date), CAST(N'2023-08-09' AS Date), N'81 65', 173583, 134, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (135, CAST(N'2018-09-19' AS Date), CAST(N'2027-05-20' AS Date), N'61 63', 107404, 135, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (136, CAST(N'2018-11-14' AS Date), CAST(N'2026-02-12' AS Date), N'64 55', 604567, 136, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (137, CAST(N'2018-12-16' AS Date), CAST(N'2026-12-19' AS Date), N'41 77', 152038, 137, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (138, CAST(N'2018-08-30' AS Date), CAST(N'2023-12-18' AS Date), N'47 75', 631972, 138, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (139, CAST(N'2018-06-24' AS Date), CAST(N'2019-03-28' AS Date), N'58 56', 389246, 139, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (140, CAST(N'2019-02-17' AS Date), CAST(N'2023-06-24' AS Date), N'56 65', 672465, 140, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (141, CAST(N'2018-09-01' AS Date), CAST(N'2019-06-02' AS Date), N'13 52', 375141, 141, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (142, CAST(N'2018-10-13' AS Date), CAST(N'2023-09-02' AS Date), N'95 80', 672343, 142, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (143, CAST(N'2018-10-25' AS Date), CAST(N'2028-04-14' AS Date), N'94 60', 114388, 143, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (144, CAST(N'2018-09-24' AS Date), CAST(N'2022-06-26' AS Date), N'79 46', 834138, 144, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (145, CAST(N'2018-10-07' AS Date), CAST(N'2023-03-25' AS Date), N'41 60', 943122, 145, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (146, CAST(N'2019-01-30' AS Date), CAST(N'2024-12-12' AS Date), N'93 58', 978442, 146, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (147, CAST(N'2019-02-11' AS Date), CAST(N'2028-02-26' AS Date), N'75 77', 669648, 147, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (148, CAST(N'2019-01-26' AS Date), CAST(N'2025-10-29' AS Date), N'89 63', 563046, 148, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (149, CAST(N'2018-06-17' AS Date), CAST(N'2025-12-10' AS Date), N'85 59', 935502, 149, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (150, CAST(N'2019-03-21' AS Date), CAST(N'2020-10-17' AS Date), N'56 47', 618832, 150, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (151, CAST(N'2018-11-29' AS Date), CAST(N'2022-01-20' AS Date), N'18 44', 286148, 151, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (152, CAST(N'2019-03-14' AS Date), CAST(N'2024-06-13' AS Date), N'15 42', 848910, 152, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (153, CAST(N'2018-09-26' AS Date), CAST(N'2019-12-14' AS Date), N'86 48', 153332, 153, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (154, CAST(N'2019-02-25' AS Date), CAST(N'2027-12-23' AS Date), N'21 64', 281543, 154, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (155, CAST(N'2018-10-17' AS Date), CAST(N'2019-06-24' AS Date), N'44 65', 689019, 155, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (156, CAST(N'2018-10-13' AS Date), CAST(N'2022-12-01' AS Date), N'63 73', 339944, 156, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (157, CAST(N'2019-01-04' AS Date), CAST(N'2020-10-22' AS Date), N'80 43', 838745, 157, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (158, CAST(N'2018-12-31' AS Date), CAST(N'2026-08-09' AS Date), N'41 74', 833772, 158, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (159, CAST(N'2019-03-16' AS Date), CAST(N'2023-05-07' AS Date), N'70 53', 197719, 159, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (160, CAST(N'2018-12-24' AS Date), CAST(N'2025-01-15' AS Date), N'53 47', 642355, 160, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (161, CAST(N'2018-08-12' AS Date), CAST(N'2022-02-10' AS Date), N'39 45', 599900, 161, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (162, CAST(N'2019-01-07' AS Date), CAST(N'2023-09-12' AS Date), N'99 70', 313651, 162, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (163, CAST(N'2019-01-06' AS Date), CAST(N'2026-01-09' AS Date), N'53 78', 482016, 163, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (164, CAST(N'2019-05-18' AS Date), CAST(N'2025-05-30' AS Date), N'82 47', 608653, 164, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (165, CAST(N'2019-03-01' AS Date), CAST(N'2019-08-09' AS Date), N'32 76', 726052, 165, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (166, CAST(N'2018-10-29' AS Date), CAST(N'2026-04-18' AS Date), N'10 56', 710506, 166, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (167, CAST(N'2019-04-22' AS Date), CAST(N'2027-05-07' AS Date), N'44 47', 857224, 167, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (168, CAST(N'2018-06-02' AS Date), CAST(N'2022-01-03' AS Date), N'15 44', 216181, 168, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (169, CAST(N'2019-01-31' AS Date), CAST(N'2028-01-25' AS Date), N'90 60', 267003, 169, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (170, CAST(N'2019-03-26' AS Date), CAST(N'2026-03-24' AS Date), N'25 57', 211673, 170, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (171, CAST(N'2018-10-01' AS Date), CAST(N'2027-06-21' AS Date), N'72 63', 140335, 171, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (172, CAST(N'2018-07-14' AS Date), CAST(N'2025-12-25' AS Date), N'81 46', 112671, 172, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (173, CAST(N'2018-11-03' AS Date), CAST(N'2025-01-09' AS Date), N'53 72', 121874, 173, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (174, CAST(N'2018-08-20' AS Date), CAST(N'2023-04-03' AS Date), N'38 55', 988267, 174, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (175, CAST(N'2019-01-30' AS Date), CAST(N'2027-05-27' AS Date), N'93 66', 407687, 175, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (176, CAST(N'2018-10-13' AS Date), CAST(N'2026-07-07' AS Date), N'71 50', 321250, 176, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (177, CAST(N'2019-02-11' AS Date), CAST(N'2020-09-03' AS Date), N'55 48', 283081, 177, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (178, CAST(N'2018-08-14' AS Date), CAST(N'2020-12-15' AS Date), N'18 41', 954617, 178, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (179, CAST(N'2018-07-10' AS Date), CAST(N'2021-05-04' AS Date), N'72 60', 808111, 179, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (180, CAST(N'2018-10-17' AS Date), CAST(N'2021-01-08' AS Date), N'88 53', 584291, 180, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (181, CAST(N'2018-10-31' AS Date), CAST(N'2026-09-02' AS Date), N'51 42', 920836, 181, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (182, CAST(N'2019-05-07' AS Date), CAST(N'2025-10-16' AS Date), N'52 74', 843119, 182, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (183, CAST(N'2019-02-28' AS Date), CAST(N'2027-10-12' AS Date), N'87 69', 608724, 183, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (184, CAST(N'2019-01-16' AS Date), CAST(N'2024-02-23' AS Date), N'22 78', 602987, 184, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (185, CAST(N'2019-04-05' AS Date), CAST(N'2019-06-14' AS Date), N'29 60', 390525, 185, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (186, CAST(N'2018-05-31' AS Date), CAST(N'2025-07-24' AS Date), N'79 56', 112224, 186, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (187, CAST(N'2018-09-18' AS Date), CAST(N'2020-08-26' AS Date), N'11 56', 742127, 187, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (188, CAST(N'2018-10-31' AS Date), CAST(N'2021-08-29' AS Date), N'52 42', 884090, 188, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (189, CAST(N'2018-08-04' AS Date), CAST(N'2023-08-15' AS Date), N'89 58', 989847, 189, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (190, CAST(N'2018-11-07' AS Date), CAST(N'2022-09-23' AS Date), N'40 46', 106016, 190, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (191, CAST(N'2019-04-14' AS Date), CAST(N'2024-03-06' AS Date), N'87 66', 120201, 191, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (192, CAST(N'2019-02-23' AS Date), CAST(N'2021-01-25' AS Date), N'90 65', 677102, 192, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (193, CAST(N'2019-02-06' AS Date), CAST(N'2019-05-26' AS Date), N'70 72', 962735, 193, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (194, CAST(N'2018-05-27' AS Date), CAST(N'2025-06-03' AS Date), N'85 80', 622744, 194, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (195, CAST(N'2018-08-05' AS Date), CAST(N'2020-04-10' AS Date), N'82 46', 115947, 195, 4)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (196, CAST(N'2018-11-06' AS Date), CAST(N'2021-12-10' AS Date), N'19 74', 705660, 196, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (197, CAST(N'2019-02-06' AS Date), CAST(N'2026-12-26' AS Date), N'39 46', 518387, 197, 1)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (198, CAST(N'2019-01-21' AS Date), CAST(N'2022-12-18' AS Date), N'63 60', 909624, 198, 2)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (199, CAST(N'2018-08-17' AS Date), CAST(N'2028-01-28' AS Date), N'33 65', 198629, 199, 4)
GO
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (200, CAST(N'2019-02-15' AS Date), CAST(N'2025-09-02' AS Date), N'75 68', 533909, 200, 3)
INSERT [dbo].[License] ([Id], [LicenseDate], [ExpireDate], [LicenseSeries], [LicenseNumber], [DriverId], [LicenseStateId]) VALUES (201, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-30' AS Date), N'55 00', 453789, 3, 1)
SET IDENTITY_INSERT [dbo].[License] OFF
GO
SET IDENTITY_INSERT [dbo].[LicenseCategory] ON 

INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (1, N'M', N'L1 (excluding bicycles), L6')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (2, N'A', N'L3')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (3, N'A1', N'L3 на <= 125 см3 и макс. мощностью <= 11 киловатт (но не L1)')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (4, N'B', N'M1/N1, whose maximum weight does not exceed 3.5 tons; M1/N1+O1; M1/N1')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (5, N'BE', N'M1, whose permissible maximum weight does not exceed 3.5 tons, with a trailer heavier than it (above 3.5 tons together)')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (6, N'B1', N'L2, L4, L5, L7')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (7, N'С', N'M1/N2/N3, whose maximum weight exceeds 3.5 tons (but not M2 / M3)')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (8, N'С1', N'M1/N2, the permitted maximum weight of which is 3.5-7.5 tons (but not M2 / M3), is possible with O1')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (9, N'С1E', N'M1/N2, the maximum weight of which is 3.5-7.5 tons (but not M2 / M3), with a trailer> 750kg (up to 12 tons together)')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (10, N'СE', N'M1/N2/N3, whose permissible maximum mass exceeds 3.5 tons (but not M2 / M3) coupled to a trailer> 750kg')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (11, N'D', N'M2/M3, possible with O1')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (12, N'D1', N'M2/M3 no more than with 16 passenger seats, it is possible with O1')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (13, N'D1E', N'M2/M3 no more than with 16 passenger seats and with an O1 not intended for passengers (up to 12 tons together)')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (14, N'DE', N'M2/M3 with trailer> 750 kg; articulated buses, duobus.')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (15, N'Tm', N'M2/M3, being trams')
INSERT [dbo].[LicenseCategory] ([Id], [Name], [Description]) VALUES (16, N'Tb', N'M2/M3, rolleybuses')
SET IDENTITY_INSERT [dbo].[LicenseCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[LicenseState] ON 

INSERT [dbo].[LicenseState] ([Id], [State], [ColorIndicator]) VALUES (1, N'Активен', N'Green')
INSERT [dbo].[LicenseState] ([Id], [State], [ColorIndicator]) VALUES (2, N'Утратил силу', N'Grey')
INSERT [dbo].[LicenseState] ([Id], [State], [ColorIndicator]) VALUES (3, N'Приостановлен', N'Red')
INSERT [dbo].[LicenseState] ([Id], [State], [ColorIndicator]) VALUES (4, N'Изъят', N'Red')
SET IDENTITY_INSERT [dbo].[LicenseState] OFF
GO
SET IDENTITY_INSERT [dbo].[PhotoOfVehicleAccident] ON 

INSERT [dbo].[PhotoOfVehicleAccident] ([Id], [Name], [Photo], [VehicleAccidentId]) VALUES (1, N'1', N'C:\Users\PC\Desktop\Practic screen\Тип привода.png', 1)
INSERT [dbo].[PhotoOfVehicleAccident] ([Id], [Name], [Photo], [VehicleAccidentId]) VALUES (2, N'2', N'C:\Users\PC\Desktop\Practic screen\Категории прав.png', 2)
SET IDENTITY_INSERT [dbo].[PhotoOfVehicleAccident] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfDrive] ON 

INSERT [dbo].[TypeOfDrive] ([Id], [NameRU], [NameEN]) VALUES (1, N'Передний привод', N'front-wheel drive')
INSERT [dbo].[TypeOfDrive] ([Id], [NameRU], [NameEN]) VALUES (2, N'Полный привод', N'full drive')
INSERT [dbo].[TypeOfDrive] ([Id], [NameRU], [NameEN]) VALUES (3, N'Задний привод', N'rear drive')
SET IDENTITY_INSERT [dbo].[TypeOfDrive] OFF
GO
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'19UUA66218A797800', N'Kia', N'Magentis / Optima', 2003, 1603, 133, 1, 3, 84)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1C4RJEAG6CC011603', N'Kia', N'Cerato / Spectra', 2009, 1692, 107, 1, 1, 76)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1C4RJEAG6FC571030', N'Cadillac', N'Series 61', 2015, 1677, 377, 2, 1, 35)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1D7RE3BK7AS869215', N'Cadillac', N'Fleetwood Brougham', 1992, 1434, 425, 2, 1, 46)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FAHP3E28CL132877', N'Kia', N'Opirus / Amanti', 2003, 1651, 204, 2, 1, 91)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FMJK1J51AE558998', N'Cadillac', N'6200', 2000, 1426, 408, 3, 3, 42)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FMJU1F5XAE067185', N'BMW', N'X7', 2004, 1557, 236, 3, 1, 22)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FMJU1J56AE113733', N'Cadillac', N'CTS', 1997, 1445, 340, 1, 1, 30)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTEW1CM3DF334371', N'Kia', N'Sephia', 2005, 1540, 963, 3, 1, 74)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTEW1E86AF818093', N'Cadillac', N'Series 62', 1995, 1437, 301, 1, 1, 179)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTEX1CM1BF296018', N'Kia', N'Clarus', 1992, 1638, 128, 2, 1, 82)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTEX1CM5BK565807', N'Cadillac', N'Series 75', 2009, 1518, 448, 2, 1, 52)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTMF1E84AK129978', N'BMW', N'3-Series', 2006, 1637, 129, 1, 1, 6)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTSF3A50AE770400', N'Cadillac', N'Series 75', 2006, 1505, 447, 3, 1, 51)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTSW2A50AE633032', N'BMW', N'5-Series, M5', 1993, 1493, 233, 1, 1, 20)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTSX2A58AE041570', N'Kia', N'Sephia', 1996, 1651, 371, 2, 1, 200)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTWF3D57AE486873', N'BMW', N'X6', 2014, 1656, 415, 3, 1, 163)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTWW3B53AE587413', N'BMW', N'X5', 2007, 1674, 406, 3, 3, 161)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1FTWW3B5XAE601405', N'Cadillac', N'Series 61', 2000, 1459, 370, 1, 1, 32)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G4HD57238U904159', N'Cadillac', N'Series 62', 1993, 1583, 385, 2, 1, 37)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6AB5SA9D0113584', N'Kia', N'Forte', 1991, 1665, 110, 3, 1, 77)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6AH5S31F0348385', N'Cadillac', N'Series 75', 1998, 1781, 449, 3, 1, 53)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6AP5SX1E0768734', N'Kia', N'Rio', 2001, 1713, 302, 3, 1, 193)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DA1E30E0416888', N'Kia', N'Soul', 2010, 1506, 310, 2, 1, 195)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DD8E31E0169171', N'BMW', N'New Class 1602, 1802, 2002', 2016, 1633, 233, 1, 3, 136)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DE5E5XC0016413', N'Cadillac', N'Series 75', 1997, 1601, 446, 1, 1, 50)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DH5E5XC0462438', N'Kia', N'Sportage', 2017, 1705, 302, 1, 1, 107)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DJ1E37D0628461', N'Kia', N'Joice', 1990, 1768, 245, 2, 1, 100)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DJ5E34C0750992', N'Cadillac', N'CTS', 2005, 1455, 295, 2, 1, 28)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DK8ED9B0319764', N'Kia', N'Mohave / Borrego', 1995, 1720, 370, 1, 1, 113)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DM577280903075', N'BMW', N'4-Series, M4', 2010, 1711, 202, 2, 1, 12)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DN57U260742856', N'Kia', N'Potentia', 1995, 1608, 201, 2, 1, 88)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6DP567750890960', N'Kia', N'Cee''d', 2009, 1449, 798, 2, 1, 73)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1G6KF57952U735337', N'Kia', N'Quoris / K9 / K900', 1994, 1421, 223, 1, 2, 95)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1GD422CGXEF170253', N'Kia', N'Picanto', 1990, 1579, 370, 1, 1, 186)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1GYFC43539R480716', N'BMW', N'3-Series, M3', 2001, 1748, 203, 3, 1, 13)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1GYS3FEJ8CR664092', N'BMW', N'3-Series GT', 1996, 1701, 302, 1, 1, 146)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1GYS3HKJ9FR278172', N'Volkswagen', N'Voyage', 2011, 1420, 129, 2, 1, 122)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1GYS4FEJ9CR310756', N'Cadillac', N'Series 75', 2019, 1535, 464, 2, 1, 57)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1HGCP2E46AA778977', N'Cadillac', N'Series 62', 2019, 1417, 387, 3, 1, 38)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1HGCR2E55EA286661', N'Cadillac', N'Series 61', 1992, 1523, 280, 3, 1, 176)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1J4RG4GK7AC818854', N'Cadillac', N'Eldorado', 2000, 1636, 640, 1, 1, 67)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1LNHL9DK8EG585379', N'Kia', N'Retona', 2003, 1757, 286, 3, 1, 104)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1LNHL9EK9FG365197', N'BMW', N'5-Series, M5', 2015, 1456, 371, 3, 1, 153)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1N4AB7APXDN538514', N'Cadillac', N'Series 75', 1999, 1404, 456, 3, 1, 54)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1N6AA0CJ3FN926889', N'BMW', N'4-Series, M4', 1995, 1761, 204, 3, 1, 14)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1N6BF0KM6FN922689', N'Kia', N'Forte / K3', 1993, 1725, 116, 1, 2, 78)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'1ZVBP8JZ2D5191071', N'Kia', N'Cadenza / K7', 1996, 1459, 215, 3, 1, 93)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2B3CK2CV1AH775495', N'Cadillac', N'Series 61', 2002, 1526, 277, 2, 1, 175)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2C3CCAKT5CH834724', N'BMW', N'5-Series, M5', 2019, 1633, 235, 2, 1, 21)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2C3CDXL97FH493561', N'Cadillac', N'BLS', 2000, 1454, 215, 1, 3, 166)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2C4RDGCG2FR292116', N'BMW', N'2-Series', 1994, 1750, 120, 2, 1, 3)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2FMPK3K98FB482688', N'Cadillac', N'CTS', 2007, 1678, 236, 2, 1, 172)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2G4WD582261511218', N'BMW', N'X7', 1994, 1731, 416, 3, 1, 164)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2G4WE587581834383', N'Volkswagen', N'SP2', 2004, 1577, 217, 2, 1, 133)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2G4WS55J341869989', N'Kia', N'Stinger', 2006, 1546, 180, 1, 1, 87)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2HNYB1H68DH924015', N'Cadillac', N'Series 65', 1992, 1773, 295, 3, 1, 178)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2HNYD18214H913977', N'Cadillac', N'Catera', 1992, 1586, 286, 3, 1, 27)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2HNYD2H46CH088623', N'BMW', N'1-Series', 1991, 1799, 127, 2, 1, 4)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2T1BURHE4FC565514', N'Kia', N'Sorento', 2011, 1571, 311, 1, 1, 110)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2T1BURHE5EC940812', N'Cadillac', N'Series 75', 2018, 1679, 481, 3, 1, 59)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2T1BURHE6EC080516', N'BMW', N'3-Series GT', 2009, 1574, 210, 3, 2, 15)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'2T3BFREV2EW071669', N'Volkswagen', N'Gol', 1992, 1779, 118, 1, 1, 118)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3C63D2GL5CG863137', N'Kia', N'Quoris / K9 / K900', 2011, 1576, 217, 3, 1, 94)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3C6LD4AT3CG450587', N'Cadillac', N'Series 75', 2012, 1744, 458, 1, 1, 55)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3C6TD4HTXCG839880', N'Cadillac', N'Series 62', 2017, 1488, 302, 3, 1, 180)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3D73M3CL4BG992821', N'Cadillac', N'ELR', 1998, 1750, 280, 1, 2, 26)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3D73M4CL0AG485600', N'Cadillac', N'ATS', 2013, 1500, 277, 3, 1, 25)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3D7TT2CT1BG470774', N'Cadillac', N'Fleetwood', 2015, 1460, 428, 1, 1, 48)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3GYFNCEY2BS887540', N'Cadillac', N'Series 75', 1994, 1468, 460, 3, 1, 56)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3GYFNGEY9BS444647', N'Cadillac', N'Eldorado', 2010, 1419, 671, 2, 1, 69)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3LNDL2L33CR462059', N'Kia', N'Magentis / Optima', 2000, 1609, 129, 2, 1, 83)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3LNHL2GC0AR226381', N'BMW', N'New Six CS', 1992, 1611, 385, 3, 1, 157)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3N1AB6AP7BL573385', N'Volkswagen', N'Santana', 1998, 1515, 204, 2, 1, 130)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3N1CN7AP5FL866147', N'BMW', N'3-Series, M3', 2006, 1706, 236, 2, 1, 138)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3VW217AU7FM147306', N'Cadillac', N'CTS', 2004, 1795, 311, 3, 1, 29)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3VW4A7AT6DM813925', N'Kia', N'Bongo', 2017, 1744, 371, 1, 2, 114)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3VWF17AT3FM605285', N'Kia', N'Carnival / Sedona', 1991, 1539, 280, 1, 3, 103)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3VWKX7AJ2DM808838', N'Kia', N'Carens / Rondo', 1995, 1475, 236, 3, 1, 99)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'3VWML7AJXEM569531', N'Kia', N'Cee''d', 1993, 1472, 793, 1, 1, 71)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'4A31K2DF7BE138498', N'Kia', N'Bongo', 2016, 1745, 110, 3, 1, 116)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'4T1BD1FK6FU133645', N'Kia', N'Sportage', 2018, 1668, 310, 2, 1, 109)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'4T1BF1FK2EU831999', N'Kia', N'Magentis / Optima / K5', 2015, 1468, 170, 1, 1, 86)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'4USBU53567L936239', N'BMW', N'X6', 1991, 1596, 408, 1, 1, 162)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5FNRL5H2XCB183642', N'BMW', N'3-Series, M3', 2009, 1409, 180, 1, 1, 10)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5FNYF3H48FB049614', N'BMW', N'5-Series', 2004, 1569, 217, 2, 1, 17)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5FRYD4H97GB588815', N'Kia', N'Carnival / Sedona', 1998, 1737, 276, 2, 1, 101)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5N1AA0NC5EN749211', N'Cadillac', N'Brougham', 1995, 1459, 427, 1, 1, 47)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5NMSG3AB7AH234028', N'BMW', N'5-Series', 2007, 1447, 310, 3, 1, 148)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5TDBK3EH2BS734111', N'Cadillac', N'Catera', 2019, 1567, 228, 2, 1, 169)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5TDBM5G19BS020076', N'Volkswagen', N'Pointer', 2009, 1594, 203, 2, 1, 129)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5TDBW5G12FS063304', N'Kia', N'Sorento', 2004, 1783, 340, 3, 1, 111)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5TFBY5F18AX095253', N'Cadillac', N'Cimarron', 1994, 1539, 245, 1, 1, 23)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5UXFG43539L241999', N'BMW', N'4-Series, M4', 2012, 1597, 301, 1, 1, 145)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5UXFG83558L839159', N'Cadillac', N'Series 62', 2016, 1777, 406, 1, 1, 41)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5XYKT3A62FG416932', N'Kia', N'Elan', 2000, 1518, 228, 2, 1, 96)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'5XYZT3LB7FG893235', N'Volkswagen', N'Quantum', 2013, 1662, 210, 3, 1, 131)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JH4CU2F68BC631071', N'Cadillac', N'Series 61', 1994, 1770, 286, 2, 1, 177)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JH4KA96631C195497', N'Volkswagen', N'Gol', 1990, 1528, 127, 3, 2, 120)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JH4KC1F78EC530392', N'Volkswagen', N'SpaceFox / Suran / SportVan / Fox Plus', 2004, 1718, 215, 3, 1, 132)
GO
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JHMZF1C46CS958531', N'Kia', N'Pride', 1992, 1572, 373, 2, 1, 188)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JM1NC2LF0E0131767', N'BMW', N'5-Series, M5', 1998, 1585, 228, 3, 2, 19)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JM1NC2LF9D0043475', N'Kia', N'Picanto', 1999, 1483, 345, 2, 1, 185)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JM3TB2MA6A0887683', N'Cadillac', N'ELR', 2014, 1675, 223, 3, 1, 168)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1AZ4EH7AM509399', N'Volkswagen', N'Fusca', 2008, 1775, 116, 2, 1, 117)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1BV7APXFM374795', N'BMW', N'3-Series, M3', 1994, 1756, 277, 2, 1, 141)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1BV7APXFM590680', N'Kia', N'Picanto', 2003, 1762, 371, 2, 1, 187)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1CV6AP0CM243398', N'Cadillac', N'Series 60', 1999, 1433, 345, 2, 1, 31)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1CV6APXCM884333', N'BMW', N'1-Series', 2018, 1523, 118, 3, 1, 2)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1CV6FEXCM381103', N'Kia', N'Niro', 2003, 1698, 301, 3, 1, 106)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN1CY0APXAM160384', N'BMW', N'5-Series, M5', 2007, 1722, 340, 2, 1, 150)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN8AF5MR7ET518545', N'Cadillac', N'Fleetwood 75', 2013, 1614, 498, 3, 1, 61)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN8AZ2KR3DT115699', N'Kia', N'Stonic', 2019, 1725, 295, 2, 1, 105)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JN8CS1MU3EM315101', N'Cadillac', N'Series 60 (Sixty Special)', 1999, 1724, 417, 1, 1, 45)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JTEBU4BF9DK234908', N'BMW', N'3-Series, M3', 2018, 1729, 201, 3, 1, 11)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JTHFF2C27F2931205', N'BMW', N'3-Series, M3', 2008, 1574, 145, 3, 1, 8)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'JTMHY7AJ9B4091499', N'Cadillac', N'Allanté', 2012, 1694, 311, 3, 1, 183)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'KL4CJFSB9FB654370', N'BMW', N'3-Series, M3', 1993, 1664, 276, 2, 1, 140)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'KMHTC6AD4EU662541', N'BMW', N'3-Series, M3', 2000, 1610, 295, 3, 1, 144)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'KNADH4A36B6877082', N'Cadillac', N'Eldorado', 2006, 1753, 670, 1, 1, 68)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'KNAFU5A29D5373281', N'BMW', N'New Class 1602, 1802, 2002', 2016, 1791, 128, 1, 1, 5)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'KNAFU6A20B5806571', N'Volkswagen', N'Fox', 2007, 1526, 170, 1, 1, 125)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'NM0KS9BNXBT830533', N'Cadillac', N'Series 61', 1991, 1401, 373, 3, 1, 34)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SAJWA0FS8FP468222', N'Cadillac', N'XLR', 2007, 1614, 340, 1, 1, 184)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SAJWA2GTXEM305896', N'Volkswagen', N'Brasilia', 1995, 1771, 180, 3, 1, 126)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SAJWA4EB7EL432469', N'BMW', N'6-Series GT', 2004, 1438, 383, 1, 1, 156)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SALAB2V67FA465605', N'BMW', N'5-Series, M5', 2008, 1723, 311, 1, 1, 149)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SALAG2D47AA801263', N'BMW', N'X5', 1993, 1527, 399, 3, 1, 159)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SALFR2BG8FH292196', N'Kia', N'Avella', 2017, 1769, 311, 2, 1, 196)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SCBDU3ZA7CC107541', N'Kia', N'Carnival / Sedona', 2005, 1680, 277, 3, 1, 102)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'SCFBF03B27G582917', N'Cadillac', N'6200', 2012, 1629, 415, 2, 1, 43)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'TRUDD38J481844056', N'Kia', N'Cee''d', 2015, 1567, 340, 1, 1, 197)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'TRURD38J381614210', N'Kia', N'Sportage', 1993, 1767, 307, 2, 3, 108)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WA1AV94L37D000070', N'Kia', N'Rio', 2016, 1702, 385, 2, 1, 191)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WA1CV74LX9D994734', N'Kia', N'Cee''d', 2019, 1784, 370, 2, 1, 199)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WA1LMAFE9DD722859', N'Kia', N'Enterprise', 2004, 1505, 203, 3, 2, 90)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WA1WMAFE2DD971257', N'Kia', N'Rio', 1999, 1487, 383, 3, 1, 190)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WA1YL64B34N831763', N'Kia', N'Forte / K3', 1995, 1710, 118, 1, 1, 79)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUAC48H96K683520', N'Cadillac', N'Eldorado', 2011, 1649, 509, 1, 3, 62)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUAFAFH7EN465064', N'BMW', N'3-Series, M3', 2000, 1534, 280, 2, 1, 142)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUAFAFL0FN838290', N'BMW', N'5-Series, M5', 2017, 1725, 370, 2, 1, 152)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUBFCFL8CN296660', N'Cadillac', N'Series 75', 1996, 1573, 480, 2, 1, 58)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUBGAFB1AN276966', N'Cadillac', N'Series 62', 1992, 1423, 399, 1, 1, 39)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUCFAFH0AN942677', N'Cadillac', N'Series 60 (Sixty Special)', 2002, 1438, 416, 1, 1, 44)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUD2AFD1EN207208', N'Volkswagen', N'Parati', 2013, 1763, 133, 2, 3, 123)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUDF48H97A496239', N'Cadillac', N'Series 62', 2002, 1652, 403, 2, 1, 40)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUDF48H98K345526', N'Volkswagen', N'Saveiro', 2008, 1469, 223, 1, 1, 134)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUDH78E47A363910', N'Kia', N'Sephia', 1999, 1736, 101, 2, 2, 75)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUEH48H68K095273', N'Cadillac', N'Eldorado', 2004, 1736, 626, 2, 1, 65)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUEH74F76N744161', N'Cadillac', N'Eldorado', 1995, 1490, 628, 2, 1, 66)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUFGAFC6DN013144', N'Kia', N'Carens', 2006, 1508, 235, 2, 1, 98)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUGFAFC5DN926548', N'Volkswagen', N'Logus', 1992, 1663, 202, 1, 1, 128)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUGGAFR1DA366441', N'Kia', N'Pride', 2005, 1753, 377, 2, 1, 189)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUHF98P96A724812', N'Kia', N'Concord', 1991, 1512, 127, 3, 1, 81)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUHGAFC8FN632100', N'Cadillac', N'Eldorado', 2017, 1711, 601, 3, 1, 63)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUKD78P89A662503', N'Cadillac', N'ATS', 1994, 1450, 217, 3, 1, 167)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUKFAFL5EA281418', N'Cadillac', N'Series 60', 2005, 1442, 245, 1, 1, 173)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUKG98E56A006286', N'BMW', N'5-Series GT', 2009, 1481, 377, 2, 1, 155)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAULFAFR3DA033269', N'Kia', N'Sorento', 2009, 1659, 345, 1, 1, 112)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAULL44E35N431957', N'Volkswagen', N'Parati', 1992, 1460, 145, 3, 1, 124)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAULL44E95N690503', N'Volkswagen', N'Apollo', 2017, 1601, 201, 1, 1, 127)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAULT58EX5A470410', N'Cadillac', N'Fleetwood Limousine', 2016, 1604, 487, 1, 1, 60)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUUL78E45A200167', N'Cadillac', N'Escalade', 1998, 1532, 310, 1, 1, 182)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUVC68E33A401568', N'BMW', N'4-Series, M4', 2006, 1716, 286, 2, 1, 143)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUVC68E55A439175', N'Cadillac', N'BLS', 2005, 1471, 276, 1, 1, 24)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUVFAFH7BN873285', N'BMW', N'X4', 2006, 1581, 387, 1, 1, 158)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUVT68E94A410180', N'Cadillac', N'Series 61', 2009, 1663, 276, 2, 1, 174)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WAUWFBFL6AA160138', N'Cadillac', N'Eldorado', 2017, 1406, 602, 2, 1, 64)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBA3G7C54EF309612', N'Volkswagen', N'Saveiro', 2008, 1453, 228, 1, 1, 135)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBA3T7C57FP608583', N'BMW', N'New Class 1500, 1600, 1800, 2000', 2002, 1495, 215, 1, 1, 16)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBA3V5C5XFP343527', N'Cadillac', N'Fleetwood', 1997, 1583, 445, 3, 1, 49)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBABV13466J082217', N'Cadillac', N'CTS', 1993, 1499, 233, 1, 1, 170)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBABW33455P972485', N'BMW', N'3-Series, M3', 1996, 1753, 170, 2, 1, 9)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAEK13597C722490', N'Volkswagen', N'Voyage / Fox', 1991, 1496, 128, 3, 1, 121)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAGN83515D855874', N'Cadillac', N'Cimarron', 2005, 1763, 417, 3, 1, 165)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAKE5C5XCJ498380', N'BMW', N'3-Series, M3', 2016, 1483, 133, 1, 2, 7)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAKG7C54DJ746310', N'BMW', N'1-Series', 2009, 1794, 116, 3, 1, 1)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAKN9C51FD688174', N'BMW', N'New Class 1500, 1600, 1800, 2000', 2008, 1691, 307, 3, 1, 147)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBANV1C59AC580740', N'Kia', N'Venga', 2012, 1682, 233, 1, 1, 97)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAPM7C57AE459062', N'Cadillac', N'CTS', 2007, 1696, 235, 1, 1, 171)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBASN2C55AC523024', N'Cadillac', N'Series 61', 2000, 1504, 371, 1, 1, 33)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAUP7C52BV069773', N'Kia', N'Cadenza / K7', 1995, 1675, 210, 3, 1, 92)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAUP7C58DV367411', N'BMW', N'5-Series, M5', 2007, 1622, 345, 2, 1, 151)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAUP9C58AV223509', N'Kia', N'Shuma', 2011, 1562, 120, 3, 1, 80)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBAWV13557P451979', N'Kia', N'Soul', 1993, 1560, 307, 2, 1, 194)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBS3R9C51FF196091', N'Cadillac', N'Series 65', 2001, 1596, 383, 3, 1, 36)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBSBR93493P275260', N'Kia', N'Cee''d', 2010, 1551, 795, 3, 1, 72)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WBSWD9C57AP228332', N'BMW', N'X5', 2007, 1426, 403, 1, 1, 160)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WDDHH8HB5BA767975', N'Kia', N'Cee''d', 1997, 1788, 345, 1, 1, 198)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WP0AB2A87FK108949', N'Cadillac', N'Eldorado', 2006, 1791, 690, 1, 2, 70)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WVGAV7AX3BW390470', N'Cadillac', N'Series 62', 2011, 1493, 307, 1, 1, 181)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WVWAA7AJ5CW398762', N'Kia', N'Rio', 2014, 1587, 301, 2, 1, 192)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WVWAB7AJ0CW557264', N'Kia', N'Bongo Frontier', 2017, 1667, 373, 1, 1, 115)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'WVWGD7AJ7EW053317', N'BMW', N'5-Series, M5', 2008, 1705, 223, 3, 1, 18)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'YV1382MW1A2097161', N'Kia', N'Potentia', 1997, 1757, 202, 1, 1, 89)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'YV1612FH2D1519917', N'Volkswagen', N'Gol', 2008, 1769, 120, 3, 1, 119)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'YV1672MK0D2114467', N'BMW', N'5-Series, M5', 2004, 1480, 373, 2, 1, 154)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'YV1902FH3D1001332', N'BMW', N'3-Series', 2019, 1797, 235, 3, 1, 137)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'YV4902NC8F1531985', N'BMW', N'3-Series, M3', 2014, 1685, 245, 3, 1, 139)
INSERT [dbo].[Vehicle] ([VIN], [VehicleManufacturer], [VehicleModel], [Year], [Weight], [VehicleColorId], [EngineTypeId], [TypeOfDriverId], [DriverId]) VALUES (N'ZFBCFACH5FZ996096', N'Kia', N'Magentis / Optima / K5', 1995, 1669, 145, 2, 2, 85)
GO
SET IDENTITY_INSERT [dbo].[VehicleAccident] ON 

INSERT [dbo].[VehicleAccident] ([Id], [Description], [Address], [RowOfRoad], [TrafficLane], [VictimsCount], [Date], [Time]) VALUES (1, N'1', N'1', N'1', N'1', 1, CAST(N'2022-12-07' AS Date), CAST(N'00:00:00' AS Time))
INSERT [dbo].[VehicleAccident] ([Id], [Description], [Address], [RowOfRoad], [TrafficLane], [VictimsCount], [Date], [Time]) VALUES (2, N'2', N'2', N'2', N'2', 2, CAST(N'2022-12-22' AS Date), CAST(N'11:52:46.8549719' AS Time))
SET IDENTITY_INSERT [dbo].[VehicleAccident] OFF
GO
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (100, N'#7d0822', 1, N'Триумф', N'Серебристый красный', N'Triumph', N'Silver red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (101, N'#aa0000', NULL, N'Кардинал', N'Ярко-красный', N'Cardinal', N'Bright red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (107, N'#241033', NULL, N'Баклажановый', N'Фиолетовый', N'Eggplant', N'Violet')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (110, N'#7e0004', NULL, N'Рубин', N'Красный', N'Ruby', N'Red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (116, N'#700b37', 1, N'Коралл', N'Серебристый темно-красный', N'Coral', N'Silver Dark Red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (118, N'#a11637', NULL, N'Кармен', N'Красный', N'Carmen', N'Red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (120, N'#2e0203', 1, N'Майя', N'Серебристый темно-бордовый', N'Mayan', N'Silver maroon')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (127, N'#40030a', NULL, N'Вишня', N'Темно-красный', N'Cherry', N'Dark red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (128, N'#4a0001', 1, N'Искра', N'Красный металлик', N'Spark', N'Red metallic')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (129, N'#990000', 1, N'Виктория', N'Серебристый ярко-красный', N'Victoria', N'Silver bright red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (133, N'#443a78', 1, N'Магия', N'Серебристый темный', N'Magic', N'Dark silver')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (145, N'#32011f', 1, N'Аметист', N'Серебристый фиолетовый', N'Amethyst', N'Silver purple')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (170, N'#a71122', NULL, N'Торнадо', N'Красный', N'Tornado', N'Red')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (180, N'#4f072c', NULL, N'Гранат', N'Темно-бордовый', N'Garnet', N'Maroon')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (201, N'#f8eff0', NULL, N'Белый', N'Белый', N'White', N'White')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (202, N'#e6eef0', NULL, N'Белый', N'Ярко-белый', N'White', N'Bright white')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (203, N'#f3f3cf', NULL, N'Жасмин', N'Бело-желтый', N'Jasmine', N'White yellow')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (204, N'#f0ffe6', NULL, N'Айсберг', N'Белая двухслойная', N'Iceberg', N'White Double Layer')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (210, N'#f2b258', NULL, N'Примула', N'Светло-желтый', N'Primrose', N'Light yellow')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (215, N'#e9d1af', NULL, N'Сафари', N'Светло-бежевый', N'Safari', N'Light beige')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (217, N'#c8b8b5', 1, N'Миндаль', N'Бежево-розовый', N'Almond', N'Beige and pink')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (223, N'#f1a301', NULL, N'Нарцисс', N'Желтый', N'Narcissus', N'Yellow')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (228, N'#f2d48b', NULL, N'Чайная роза', N'Светло-желтый', N'Tea rose', N'Light yellow')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (233, N'#dde2de', NULL, N'Белый', N'Серо-белый', N'White', N'Gray white')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (235, N'#c49648', NULL, N'Бежевый', N'Бежевый', N'Beige', N'Beige')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (236, N'#b38c61', NULL, N'Серо-бежевый', N'Серо-бежевый', N'Gray beige', N'Gray beige')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (245, N'#c18f33', 1, N'Золотая нива', N'Золотой', N'Golden Niva', N'Gold')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (276, N'#daa37c', 1, N'Приз', N'Серебристо-золотой', N'Prize', N'Silver gold')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (277, N'#d6762a', 1, N'Антилопа Люкс', N'Серебристо-бежевый', N'Antelope Suite', N'Silver beige')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (280, N'#cac79c', 1, N'Мираж', N'Серебристый желто-зеленый', N'Mirage', N'Silvery yellow green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (286, N'#d3671f', 1, N'Опатия', N'Серебристый оранжевый', N'Opatija', N'Silvery orange')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (295, N'#f6d1a4', NULL, N'Сливочно-белый', N'Сливочно-белый', N'Creamy white', N'Creamy white')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (301, N'#dfdcc4', 1, N'Серебристая ива', N'Светло-зеленый', N'Silvery willow', N'Light green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (302, N'#2c8370', 1, N'Моцарт', N'', N'Mozart', N'')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (307, N'#0a1e11', NULL, N'Зеленый сад', N'Зеленый', N'Green Garden', N'Green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (310, N'#707561', 1, N'Валюта', N'Серо-зеленый металлик', N'Currency', N'Gray Green Metallic')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (311, N'#20543d', 1, N'Игуана', N'Серебристый ярко-зеленый', N'Iguana', N'Silvery bright green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (340, N'#594b0c', NULL, N'Оливковый', N'Желто-зеленый', N'Olive', N'Yellow green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (345, N'#afaf83', 1, N'Оливин', N'Золотисто-зеленый', N'Olivine', N'Golden green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (370, N'#373b2c', 1, N'Корсика', N'Серебристый темно-зеленый', N'Corsica', N'Silver Dark Green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (371, N'#33593f', 1, N'Амулет', N'Темно-зеленый', N'Amulet', N'Dark green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (373, N'#566143', NULL, N'Серо-зеленая', N'Серо-зеленый', N'Gray green', N'Gray green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (377, N'#153230', NULL, N'Мурена', N'Сине-зеленый', N'Moray eel', N'Blue green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (383, N'#9f998c', 1, N'Ниагара', N'Золотисто-серый', N'Niagara', N'Golden gray')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (385, N'#196155', 1, N'Изумруд', N'Серебристо-зеленый', N'Emerald', N'Silver green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (387, N'#cecdb7', 1, N'Папирус', N'Серебристый серо-зеленый', N'Papyrus', N'Silver gray green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (399, N'#614925', 1, N'Табачный', N'Серебристый коричнево-зеленый', N'Tobacco', N'Silver brown-green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (403, N'#3d4274', NULL, N'Монте-Карло', N'Ярко-синий', N'Monte Carlo', N'Bright blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (406, N'#200f33', NULL, N'Ирис', N'Фиолетовый', N'Iris', N'Violet')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (408, N'#2c1541', 1, N'Чароит', N'Серебристый темно-фиолетовый', N'Charoite', N'Silver Dark Purple')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (415, N'#3a454b', 1, N'Электрон', N'Темно-серый металлик', N'Electron', N'Dark Gray Metallic')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (416, N'#897a91', 1, N'Фея (Лесная фея)', N'Серебристо-синий', N'Fairy (Forest Fairy)', N'Silver blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (417, N'#015255', NULL, N'Пицунда', N'Зелено-синий', N'Pitsunda', N'Green blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (419, N'#b3c6c0', 1, N'Опал', N'Серебристо-голубой', N'Opal', N'Silver blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (420, N'#145051', NULL, N'Балтика', N'Сине-зеленый', N'Baltika', N'Blue green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (421, N'#417c6a', 1, N'Афалина', N'Серебристый зелено-голубой', N'Afalina', N'Silver Green Blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (425, N'#3a5e74', NULL, N'Адриатика', N'Голубой', N'Adriatic', N'Blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (427, N'#355155', NULL, N'Серо-голубой', N'Серо-голубой', N'Gray blue', N'Gray blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (428, N'#0d3e8b', NULL, N'Медео', N'Голубой', N'Medeo', N'Blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (445, N'#0b083f', 1, N'Лазурит', N'Фиолетово-синий металлик', N'Lapis lazuli', N'Purple Blue Metallic')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (446, N'#363b5b', 1, N'Сапфир', N'Серебристый сине-фиолетовый', N'Sapphire', N'Silver Blue-Purple')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (447, N'#31175c', NULL, N'Синяя полночь', N'Синий', N'Blue midnight', N'Blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (448, N'#1c384e', 1, N'Рапсодия', N'Серебристый ярко-синий', N'Rhapsody', N'Silver bright blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (449, N'#2e1e5c', NULL, N'Океан', N'Темно-голубой', N'Ocean', N'Dark blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (456, N'#07011b', NULL, N'Темно-синий', N'Темно-синий', N'Navy blue', N'Navy blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (458, N'#5d0e50', NULL, N'Мулен-Руж', N'Ярко-фиолетовый', N'Moulin rouge', N'Bright purple')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (460, N'#0a7679', 1, N'Аквамарин Люкс', N'Серебристый сине-зеленый', N'Aquamarine Suite', N'Silver Blue Green')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (464, N'#12294b', NULL, N'Валентина', N'Серо-фиолетовый', N'Valentine', N'Gray-purple')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (480, N'#397261', NULL, N'Бриз', N'Зелено-голубой', N'Breeze', N'Green blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (481, N'#01415c', NULL, N'Голубая', N'Голубой', N'Blue', N'Blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (487, N'#002e3b', 1, N'Лагуна', N'Серебристо-синий', N'Lagoon', N'Silver blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (498, N'#001522', 1, N'Лазурно-синий', N'Серебристый темно-синий', N'Azure Blue', N'Silver Navy')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (509, N'#66472a', NULL, N'Темно-бежевая', N'Темно-бежевый', N'Dark beige', N'Dark beige')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (601, N'#040001', NULL, N'Черный', N'Черный', N'The black', N'The black')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (602, N'#00111b', 1, N'Авантюрин', N'Серебристо-черный', N'Aventurine', N'Silver black')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (626, N'#312725', 1, N'Мокрый асфальт', N'Серо-бежевый металлик', N'Wet asphalt', N'Gray beige metallic')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (628, N'#4a534e', 1, N'Нептун', N'Темный серо-синий', N'Neptune', N'Dark gray-blue')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (640, N'#c9c7c8', 1, N'Серебристый', N'Серебристый', N'Silver', N'Silver')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (670, N'#693623', 1, N'Сандаловый', N'Бежево-красный металлик', N'Sandalwood', N'Metallic red and beige')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (671, N'#97948f', NULL, N'Светло-серый', N'Светло-серый', N'Light gray', N'Light gray')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (690, N'#dddfde', 1, N'Снежная королева', N'Серебристый металлик', N'The Snow Queen', N'Metallic Silver')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (793, N'#0d0304', NULL, N'Темно-коричневый', N'Темно-коричневый', N'Dark brown', N'Dark brown')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (795, N'#522929', 1, N'Пирано', N'Красно-коричневый', N'Pirano', N'Red brown')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (798, N'#200204', 1, N'Корица', N'Коричневый', N'Cinnamon', N'Brown')
INSERT [dbo].[VehicleColor] ([Id], [HexCode], [IsMetalic], [NameRU], [DescriptionRU], [NameEN], [DescriptionEN]) VALUES (963, N'#012313', NULL, N'Зеленая', N'Зеленый', N'Green', N'Green')
GO
ALTER TABLE [dbo].[CarofAccident]  WITH CHECK ADD FOREIGN KEY([AccidentId])
REFERENCES [dbo].[VehicleAccident] ([Id])
GO
ALTER TABLE [dbo].[CarofAccident]  WITH CHECK ADD FOREIGN KEY([VehicleVIN])
REFERENCES [dbo].[Vehicle] ([VIN])
GO
ALTER TABLE [dbo].[CatrgoryOfLicense]  WITH CHECK ADD FOREIGN KEY([LicenseId])
REFERENCES [dbo].[License] ([Id])
GO
ALTER TABLE [dbo].[CatrgoryOfLicense]  WITH CHECK ADD FOREIGN KEY([LicenseCategoryId])
REFERENCES [dbo].[LicenseCategory] ([Id])
GO
ALTER TABLE [dbo].[DriverOfAccident]  WITH CHECK ADD FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[DriverOfAccident]  WITH CHECK ADD FOREIGN KEY([VehicleAccidentId])
REFERENCES [dbo].[VehicleAccident] ([Id])
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [FK_License_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [FK_License_Driver]
GO
ALTER TABLE [dbo].[License]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseState] FOREIGN KEY([LicenseStateId])
REFERENCES [dbo].[LicenseState] ([Id])
GO
ALTER TABLE [dbo].[License] CHECK CONSTRAINT [FK_License_LicenseState]
GO
ALTER TABLE [dbo].[PhotoOfVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_PhotoOfVehicleAccident_VehicleAccident] FOREIGN KEY([VehicleAccidentId])
REFERENCES [dbo].[VehicleAccident] ([Id])
GO
ALTER TABLE [dbo].[PhotoOfVehicleAccident] CHECK CONSTRAINT [FK_PhotoOfVehicleAccident_VehicleAccident]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Driver]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_EngineType] FOREIGN KEY([EngineTypeId])
REFERENCES [dbo].[EngineType] ([Id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_EngineType]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_TypeOfDrive] FOREIGN KEY([TypeOfDriverId])
REFERENCES [dbo].[TypeOfDrive] ([Id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_TypeOfDrive]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleColor] FOREIGN KEY([VehicleColorId])
REFERENCES [dbo].[VehicleColor] ([Id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleColor]
GO
USE [master]
GO
ALTER DATABASE [TrafficPolice] SET  READ_WRITE 
GO
