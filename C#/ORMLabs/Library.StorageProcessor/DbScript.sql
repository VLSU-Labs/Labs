USE [master]
GO
/****** Object:  Database [SportGoods]    Script Date: 3/16/2021 10:53:54 AM ******/
CREATE DATABASE [SportGoods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportGoodsDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SportGoodsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportGoodsDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SportGoodsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SportGoods] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportGoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportGoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportGoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportGoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportGoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportGoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportGoods] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportGoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportGoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportGoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportGoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportGoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportGoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportGoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportGoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportGoods] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportGoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportGoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportGoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportGoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportGoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportGoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportGoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportGoods] SET RECOVERY FULL 
GO
ALTER DATABASE [SportGoods] SET  MULTI_USER 
GO
ALTER DATABASE [SportGoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportGoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportGoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportGoods] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportGoods] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportGoods] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SportGoods', N'ON'
GO
ALTER DATABASE [SportGoods] SET QUERY_STORE = OFF
GO
USE [SportGoods]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 3/16/2021 10:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](30) NOT NULL,
	[Model] [nvarchar](30) NOT NULL,
	[OriginalPrice] [decimal](18, 2) NOT NULL,
	[DiscontPercent] [smallint] NULL,
	[Description] [nvarchar](150) NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsProviders]    Script Date: 3/16/2021 10:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsProviders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoodId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_GoodsProviders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 3/16/2021 10:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[TelNumber] [varchar](11) NOT NULL,
	[Address] [nvarchar](70) NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 3/16/2021 10:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Types]
GO
ALTER TABLE [dbo].[GoodsProviders]  WITH CHECK ADD  CONSTRAINT [FK_GoodsProviders_Goods] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Goods] ([Id])
GO
ALTER TABLE [dbo].[GoodsProviders] CHECK CONSTRAINT [FK_GoodsProviders_Goods]
GO
ALTER TABLE [dbo].[GoodsProviders]  WITH CHECK ADD  CONSTRAINT [FK_GoodsProviders_Providers] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Providers] ([Id])
GO
ALTER TABLE [dbo].[GoodsProviders] CHECK CONSTRAINT [FK_GoodsProviders_Providers]
GO
USE [master]
GO
ALTER DATABASE [SportGoods] SET  READ_WRITE 
GO
