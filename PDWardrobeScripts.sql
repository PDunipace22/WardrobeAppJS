USE [master]
GO
/****** Object:  Database [WardrobeDB]    Script Date: 3/21/2018 2:21:58 PM ******/
CREATE DATABASE [WardrobeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WardrobeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WardrobeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WardrobeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WardrobeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WardrobeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WardrobeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WardrobeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WardrobeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WardrobeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WardrobeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET  MULTI_USER 
GO
ALTER DATABASE [WardrobeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WardrobeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WardrobeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WardrobeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WardrobeDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WardrobeDB]
GO
/****** Object:  Table [dbo].[Occasions]    Script Date: 3/21/2018 2:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasions](
	[OccasionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Occasions] PRIMARY KEY CLUSTERED 
(
	[OccasionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfits]    Script Date: 3/21/2018 2:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfits](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
	[AccessoryID] [int] NOT NULL,
 CONSTRAINT [PK_Outfits] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 3/21/2018 2:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WardrobeItems]    Script Date: 3/21/2018 2:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WardrobeItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_WardrobeItems] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WardrobeType]    Script Date: 3/21/2018 2:21:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WardrobeType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WardrobeType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Occasions] ON 

INSERT [dbo].[Occasions] ([OccasionID], [Description]) VALUES (1, N'casual')
INSERT [dbo].[Occasions] ([OccasionID], [Description]) VALUES (2, N'formal')
INSERT [dbo].[Occasions] ([OccasionID], [Description]) VALUES (3, N'semi-formal')
SET IDENTITY_INSERT [dbo].[Occasions] OFF
SET IDENTITY_INSERT [dbo].[Outfits] ON 

INSERT [dbo].[Outfits] ([OutfitID], [Description], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (2, N'First Outfit', 11, 8, 9, 10)
INSERT [dbo].[Outfits] ([OutfitID], [Description], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (3, N'Second Outfit', 7, 12, 13, 14)
INSERT [dbo].[Outfits] ([OutfitID], [Description], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (4, N'Professional', 16, 18, 15, 17)
INSERT [dbo].[Outfits] ([OutfitID], [Description], [TopID], [BottomID], [ShoeID], [AccessoryID]) VALUES (5, N'Fourth Outfit', 7, 12, 13, 19)
SET IDENTITY_INSERT [dbo].[Outfits] OFF
SET IDENTITY_INSERT [dbo].[Seasons] ON 

INSERT [dbo].[Seasons] ([SeasonID], [Description]) VALUES (1, N'summer')
INSERT [dbo].[Seasons] ([SeasonID], [Description]) VALUES (2, N'winter')
INSERT [dbo].[Seasons] ([SeasonID], [Description]) VALUES (3, N'fall')
INSERT [dbo].[Seasons] ([SeasonID], [Description]) VALUES (4, N'spring')
INSERT [dbo].[Seasons] ([SeasonID], [Description]) VALUES (5, N'All Seasons')
SET IDENTITY_INSERT [dbo].[Seasons] OFF
SET IDENTITY_INSERT [dbo].[WardrobeItems] ON 

INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (7, N'Lightweight Shirt', N'/Content/images/rszc_rbxshirt.jpg', N'dark blue, light blue', 3, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (8, N'Jeans', N'/Content/images/rszc_lee-jeans.jpg', N'blue', 4, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (9, N'Shoes', N'/Content/images/rszc_asics-shoes.jpg', N'blue', 5, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (10, N'Belt', N'/Content/images/rszc_belt.jpg', N'black', 6, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (11, N'Striped Shirt', N'/Content/images/rszc_golfshirt.jpg', N'blue', 3, 1, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (12, N'Sweatpants', N'/Content/images/rszc_russell.jpg', N'black', 4, 2, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (13, N'Hiking Boots', N'/Content/images/rszc_timberland-boots.jpg', N'brown', 5, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (14, N'Braves Hat', N'/Content/images/rszc_braves_hat.jpg', N'light blue and red', 6, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (15, N'Dress Shoes', N'/Content/images/rszc_ecco-dress-shoes.jpg', N'black', 5, 5, 1)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (16, N'Dress Shirt', N'/Content/images/rszc_dress-shirt.jpg', N'light blue', 3, 1, 2)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (17, N'Tie', N'/Content/images/rszc_dress-tie.jpg', N'mixed color', 6, 5, 2)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (18, N'Dress Pants', N'/Content/images/rszc_dress-pants.jpg', N'black', 4, 5, 2)
INSERT [dbo].[WardrobeItems] ([ItemID], [Description], [Photo], [Color], [TypeID], [SeasonID], [OccasionID]) VALUES (19, N'Smart Watch', N'/Content/images/rszc_smartwatch.jpg', N'Silver', 6, 5, 1)
SET IDENTITY_INSERT [dbo].[WardrobeItems] OFF
SET IDENTITY_INSERT [dbo].[WardrobeType] ON 

INSERT [dbo].[WardrobeType] ([TypeID], [Description]) VALUES (3, N'Tops')
INSERT [dbo].[WardrobeType] ([TypeID], [Description]) VALUES (4, N'Bottoms')
INSERT [dbo].[WardrobeType] ([TypeID], [Description]) VALUES (5, N'Shoes')
INSERT [dbo].[WardrobeType] ([TypeID], [Description]) VALUES (6, N'Accessories')
SET IDENTITY_INSERT [dbo].[WardrobeType] OFF
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems_Accessories] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[WardrobeItems] ([ItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems_Accessories]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems_Bottoms] FOREIGN KEY([BottomID])
REFERENCES [dbo].[WardrobeItems] ([ItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems_Bottoms]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems_Shoes] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[WardrobeItems] ([ItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems_Shoes]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems_Tops] FOREIGN KEY([TopID])
REFERENCES [dbo].[WardrobeItems] ([ItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems_Tops]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Occasions]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Seasons]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_WardrobeType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[WardrobeType] ([TypeID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_WardrobeType]
GO
USE [master]
GO
ALTER DATABASE [WardrobeDB] SET  READ_WRITE 
GO
