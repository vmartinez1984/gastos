USE [master]
GO
/****** Object:  Database [Gastos]    Script Date: 22/07/2023 11:34:41 a. m. ******/
CREATE DATABASE [Gastos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gastos', FILENAME = N'/var/opt/mssql/data/Gastos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gastos_log', FILENAME = N'/var/opt/mssql/data/Gastos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Gastos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gastos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gastos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gastos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gastos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gastos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gastos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gastos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gastos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gastos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gastos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gastos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gastos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gastos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gastos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gastos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gastos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gastos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gastos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gastos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gastos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gastos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gastos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gastos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gastos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gastos] SET  MULTI_USER 
GO
ALTER DATABASE [Gastos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gastos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gastos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gastos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gastos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gastos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gastos', N'ON'
GO
ALTER DATABASE [Gastos] SET QUERY_STORE = ON
GO
ALTER DATABASE [Gastos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Gastos]
GO
/****** Object:  Table [dbo].[Apartado]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoDeApartadoId] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Intereses] [decimal](5, 2) NOT NULL,
	[CantidadInicial] [decimal](7, 2) NOT NULL,
	[CantidadFinal] [decimal](7, 2) NULL,
	[FechaInicial] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[FechaDeRegistro] [datetime] NOT NULL,
	[EstaActivo] [bit] NOT NULL,
	[PeriodoId] [int] NOT NULL,
	[SubcategoriaId] [int] NOT NULL,
	[Guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Apartado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[EstaActivo] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Nota] [varchar](255) NULL,
	[MesesSinIntereses] [int] NOT NULL,
	[Cantidad] [decimal](8, 2) NOT NULL,
	[TdcId] [int] NOT NULL,
	[FechaDeRegistro] [datetime] NOT NULL,
	[EstaActivo] [bit] NOT NULL,
	[Guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Presupuesto] [decimal](5, 2) NOT NULL,
	[EstaActivo] [bit] NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleDeApartado]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleDeApartado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [decimal](7, 2) NOT NULL,
	[Nota] [varchar](255) NULL,
	[FechaDeRegistro] [datetime] NOT NULL,
	[ApartadoId] [int] NOT NULL,
	[EstaActivo] [bit] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DetalleDeApartado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gasto]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gasto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PeriodoId] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cantidad] [decimal](7, 2) NOT NULL,
	[SubcategoriaId] [int] NOT NULL,
	[FechaDeRegistro] [datetime] NOT NULL,
	[EstaActivo] [bit] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Gasto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HttpContext]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HttpContext](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](255) NULL,
	[Path] [nvarchar](max) NULL,
	[Method] [nvarchar](max) NULL,
	[RequestHeader] [nvarchar](max) NULL,
	[RequestBody] [nvarchar](max) NULL,
	[ResponseHeader] [nvarchar](max) NULL,
	[ResponseBody] [nvarchar](max) NULL,
	[RequestDateRegistration] [datetime2](7) NOT NULL,
	[ResponseDateRegistration] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_HttpContext] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompraId] [int] NOT NULL,
	[NumeroDePago] [int] NOT NULL,
	[CantidadEsperada] [decimal](18, 2) NOT NULL,
	[FechaDeDeposito] [date] NULL,
	[CantidadDepositada] [decimal](18, 2) NOT NULL,
	[FechaDePago] [date] NOT NULL,
	[EstaActivo] [bit] NOT NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaInicial] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[EstaActivo] [bit] NOT NULL,
	[Guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategoria]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaId] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[EstaActivo] [bit] NOT NULL,
	[Cantidad] [decimal](7, 2) NULL,
	[Guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Subcategoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeApartado]    Script Date: 22/07/2023 11:34:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeApartado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[EstaActivo] [bit] NOT NULL,
 CONSTRAINT [PK_TipoDeApartado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartado] ON 

INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (8, 2, N'Camioneta', CAST(0.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(7, 2)), CAST(1400.00 AS Decimal(7, 2)), CAST(N'2023-04-10' AS Date), CAST(N'2023-11-25' AS Date), CAST(N'2023-04-10T17:14:53.843' AS DateTime), 1, 1, 38, N'd66553a9-1526-473a-9e47-bf9b05013f28')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (9, 2, N'Ahorro n', CAST(0.00 AS Decimal(5, 2)), CAST(1300.00 AS Decimal(7, 2)), CAST(200.00 AS Decimal(7, 2)), CAST(N'2023-04-10' AS Date), CAST(N'2023-11-20' AS Date), CAST(N'2023-04-10T17:17:05.027' AS DateTime), 1, 1, 34, N'af1ce7b6-6ac9-4bef-9671-a3dcb2c9aa8a')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (24, 2, N'Ahorro gastos médicos', CAST(0.00 AS Decimal(5, 2)), CAST(3300.00 AS Decimal(7, 2)), CAST(4100.00 AS Decimal(7, 2)), CAST(N'2023-04-25' AS Date), CAST(N'2023-12-31' AS Date), CAST(N'2023-04-11T13:58:48.040' AS DateTime), 1, 1, 37, N'd5e0599e-0e23-46f4-8ad7-07ba1ec73e6e')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (27, 2, N'Ahorro ropa', CAST(0.00 AS Decimal(5, 2)), CAST(900.00 AS Decimal(7, 2)), CAST(100.00 AS Decimal(7, 2)), CAST(N'2023-03-25' AS Date), CAST(N'2023-12-20' AS Date), CAST(N'2023-04-11T13:59:25.693' AS DateTime), 1, 1, 40, N'cdcf465e-4447-43d7-b28c-9d37f194b676')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (28, 2, N'Ahorro gastos Tlax', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(400.00 AS Decimal(7, 2)), CAST(N'2023-03-25' AS Date), CAST(N'2023-12-20' AS Date), CAST(N'2023-04-11T13:59:47.860' AS DateTime), 1, 1, 36, N'64d36eb2-9b21-496f-9d4a-f221e3061af7')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (33, 3, N'Afore', CAST(3.75 AS Decimal(5, 2)), CAST(57672.68 AS Decimal(7, 2)), CAST(58179.00 AS Decimal(7, 2)), CAST(N'2023-04-08' AS Date), CAST(N'2023-07-31' AS Date), CAST(N'2023-04-12T09:27:25.380' AS DateTime), 1, 0, 39, N'4cbf3816-d305-4fb3-b5f4-421461c18a8a')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (34, 12, N'Sabatico 91 dias', CAST(3.15 AS Decimal(5, 2)), CAST(27210.36 AS Decimal(7, 2)), CAST(27416.85 AS Decimal(7, 2)), CAST(N'2023-01-02' AS Date), CAST(N'2023-08-01' AS Date), CAST(N'2023-04-12T09:44:37.187' AS DateTime), 1, 0, 28, N'99edabbd-9377-4fc0-ad21-0b35baf04fd3')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (35, 4, N'Tdc Anualidad Inversion BBva', CAST(9.35 AS Decimal(5, 2)), CAST(1166.17 AS Decimal(7, 2)), CAST(635.86 AS Decimal(7, 2)), CAST(N'2023-04-11' AS Date), CAST(N'2023-12-30' AS Date), CAST(N'2023-04-12T09:49:17.733' AS DateTime), 1, 0, 6, N'e989b192-a504-465d-b61c-6a956270ec5e')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (36, 4, N'Gatos arena liq gub', CAST(9.35 AS Decimal(5, 2)), CAST(945.73 AS Decimal(7, 2)), CAST(1001.00 AS Decimal(7, 2)), CAST(N'2023-05-25' AS Date), CAST(N'2023-07-30' AS Date), CAST(N'2023-04-12T09:59:01.777' AS DateTime), 1, 0, 14, N'354bfaa9-1a49-4308-a15f-1d75d28ff8d6')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (37, 4, N'Gatos arena liq pesos', CAST(9.35 AS Decimal(5, 2)), CAST(620.52 AS Decimal(7, 2)), CAST(309.29 AS Decimal(7, 2)), CAST(N'2023-05-25' AS Date), CAST(N'2023-07-30' AS Date), CAST(N'2023-04-12T09:59:51.860' AS DateTime), 1, 0, 15, N'79dce29f-da5a-4470-babd-e8f5c7226ade')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (38, 4, N'Ahorro Pc liq gub', CAST(9.35 AS Decimal(5, 2)), CAST(1169.88 AS Decimal(7, 2)), CAST(301.32 AS Decimal(7, 2)), CAST(N'2023-04-12' AS Date), CAST(N'2023-08-01' AS Date), CAST(N'2023-04-12T10:01:22.873' AS DateTime), 1, 0, 29, N'af8a2afc-e387-4fa1-a3c2-0abeb13d0875')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (39, 4, N'Ahorro tech liq pesos', CAST(9.35 AS Decimal(5, 2)), CAST(311.04 AS Decimal(7, 2)), CAST(672.59 AS Decimal(7, 2)), CAST(N'2023-04-12' AS Date), CAST(N'2023-08-01' AS Date), CAST(N'2023-04-12T10:02:05.600' AS DateTime), 1, 0, 35, N'bb0bdc85-0c27-4012-bb84-266171328aa2')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (40, 4, N'Ahorro vacaciones', CAST(9.35 AS Decimal(5, 2)), CAST(3186.13 AS Decimal(7, 2)), CAST(2537.44 AS Decimal(7, 2)), CAST(N'2023-04-12' AS Date), CAST(N'2024-11-20' AS Date), CAST(N'2023-04-12T12:25:13.113' AS DateTime), 1, 0, 30, N'b4ca4c95-8692-4e9b-8778-81bd6a5973cb')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (41, 4, N'Sabatico Si1759', CAST(9.35 AS Decimal(5, 2)), CAST(10103.37 AS Decimal(7, 2)), CAST(10229.06 AS Decimal(7, 2)), CAST(N'2023-02-15' AS Date), CAST(N'2023-11-20' AS Date), CAST(N'2023-04-12T12:37:09.333' AS DateTime), 1, 0, 28, N'b425ab97-c304-40f4-ae6b-6d8b950d2fdf')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (42, 4, N'yo merengues Si1740', CAST(9.73 AS Decimal(5, 2)), CAST(1641.10 AS Decimal(7, 2)), CAST(1641.10 AS Decimal(7, 2)), CAST(N'2023-05-24' AS Date), CAST(N'2023-11-20' AS Date), CAST(N'2023-04-12T12:39:41.177' AS DateTime), 1, 0, 34, N'dcadaeb0-4a03-4459-a8bd-f2a7d3669bf8')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (43, 4, N'yo merengues Si1740', CAST(9.35 AS Decimal(5, 2)), CAST(2014.78 AS Decimal(7, 2)), CAST(2021.12 AS Decimal(7, 2)), CAST(N'2023-02-15' AS Date), CAST(N'2023-11-20' AS Date), CAST(N'2023-04-12T12:41:39.257' AS DateTime), 1, 0, 34, N'a35d01bc-0410-4422-afd0-da36c487ddff')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (44, 8, N'Techero Sabatico 3475', CAST(8.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(7, 2)), CAST(312.35 AS Decimal(7, 2)), CAST(N'2022-12-26' AS Date), CAST(N'2023-06-26' AS Date), CAST(N'2023-04-12T12:44:41.337' AS DateTime), 0, 0, 28, N'eb756406-eaa2-48d5-9987-c87554089510')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (45, 8, N'Techero Sabatico 3771', CAST(8.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(7, 2)), CAST(348.33 AS Decimal(7, 2)), CAST(N'2022-01-10' AS Date), CAST(N'2024-07-10' AS Date), CAST(N'2023-04-12T12:46:03.840' AS DateTime), 1, 0, 28, N'bf9732b1-8bcc-4845-8a52-17d3fee70cfc')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (46, 7, N'Techero seminario 4006', CAST(6.50 AS Decimal(5, 2)), CAST(3000.00 AS Decimal(7, 2)), CAST(3049.02 AS Decimal(7, 2)), CAST(N'2023-01-20' AS Date), CAST(N'2023-04-20' AS Date), CAST(N'2023-04-12T12:49:04.917' AS DateTime), 0, 0, 27, N'8c4c9bf8-ae23-4897-89fe-92934cb07fc8')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (47, 8, N'Techero seminario 4007', CAST(8.00 AS Decimal(5, 2)), CAST(1747.74 AS Decimal(7, 2)), CAST(1747.74 AS Decimal(7, 2)), CAST(N'2023-01-20' AS Date), CAST(N'2023-07-20' AS Date), CAST(N'2023-04-12T12:54:51.113' AS DateTime), 1, 0, 27, N'e647170d-9cf3-40c9-854a-8feb2623aefa')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (48, 7, N'Techero seminario 4011', CAST(6.50 AS Decimal(5, 2)), CAST(3849.00 AS Decimal(7, 2)), CAST(3911.92 AS Decimal(7, 2)), CAST(N'2023-01-21' AS Date), CAST(N'2023-04-21' AS Date), CAST(N'2023-04-12T12:58:48.670' AS DateTime), 0, 0, 27, N'74075e1f-2be4-4a0a-8790-7d0168a5752a')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (49, 7, N'Techero Afore 4055', CAST(6.50 AS Decimal(5, 2)), CAST(700.00 AS Decimal(7, 2)), CAST(711.43 AS Decimal(7, 2)), CAST(N'2023-01-25' AS Date), CAST(N'2023-04-24' AS Date), CAST(N'2023-04-12T12:59:40.583' AS DateTime), 0, 0, 39, N'aadd8348-c9a4-4b21-9f24-d6c5954da512')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (50, 8, N'Techero sabatico 4063', CAST(8.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(7, 2)), CAST(312.41 AS Decimal(7, 2)), CAST(N'2023-01-25' AS Date), CAST(N'2023-07-25' AS Date), CAST(N'2023-04-12T13:02:45.183' AS DateTime), 1, 0, 28, N'df634d25-dc0a-41a0-9f3a-b2cea0d7849b')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (51, 7, N'Techero Afore 4416', CAST(6.50 AS Decimal(5, 2)), CAST(700.00 AS Decimal(7, 2)), CAST(711.56 AS Decimal(7, 2)), CAST(N'2023-02-13' AS Date), CAST(N'2023-05-15' AS Date), CAST(N'2023-04-12T13:03:34.753' AS DateTime), 0, 0, 39, N'5e3ccc3b-14f8-495f-9630-1e6bd654fa88')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (52, 7, N'Techero yo merengues 4439', CAST(6.50 AS Decimal(5, 2)), CAST(3062.00 AS Decimal(7, 2)), CAST(3111.49 AS Decimal(7, 2)), CAST(N'2023-02-15' AS Date), CAST(N'2023-05-15' AS Date), CAST(N'2023-04-12T13:05:47.157' AS DateTime), 0, 0, 34, N'b1c393fe-4092-495e-8769-a51d6a63d512')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (53, 7, N'Techero Afore 4458', CAST(6.50 AS Decimal(5, 2)), CAST(2424.90 AS Decimal(7, 2)), CAST(2464.09 AS Decimal(7, 2)), CAST(N'2023-02-19' AS Date), CAST(N'2023-05-19' AS Date), CAST(N'2023-04-12T13:07:02.723' AS DateTime), 0, 0, 39, N'5179e161-60f7-4df6-ba84-691a2fe70056')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (54, 7, N'Techero sabatico 4459', CAST(6.50 AS Decimal(5, 2)), CAST(300.00 AS Decimal(7, 2)), CAST(304.85 AS Decimal(7, 2)), CAST(N'2023-02-19' AS Date), CAST(N'2023-05-19' AS Date), CAST(N'2023-04-12T13:11:08.157' AS DateTime), 0, 0, 28, N'8d682f41-c1f2-470b-9455-b602f970aba8')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (55, 10, N'Cetes yo merengues 230309', CAST(10.82 AS Decimal(5, 2)), CAST(99.12 AS Decimal(7, 2)), CAST(99.37 AS Decimal(7, 2)), CAST(N'2023-05-04' AS Date), CAST(N'2023-07-30' AS Date), CAST(N'2023-04-12T13:13:08.917' AS DateTime), 1, 0, 34, N'b03e2a05-e9c9-41d3-a8d7-bb2deed19d9a')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (56, 10, N'Cetes yo merengues 230316', CAST(11.05 AS Decimal(5, 2)), CAST(4997.03 AS Decimal(7, 2)), CAST(5045.52 AS Decimal(7, 2)), CAST(N'2023-02-16' AS Date), CAST(N'2023-11-20' AS Date), CAST(N'2023-04-12T13:15:26.187' AS DateTime), 1, 0, 34, N'f352fb6b-41f9-497a-9fa8-8ddf9a1aff4f')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (57, 7, N'Techero Afore 4463', CAST(6.50 AS Decimal(5, 2)), CAST(3015.52 AS Decimal(7, 2)), CAST(3065.36 AS Decimal(7, 2)), CAST(N'2023-02-20' AS Date), CAST(N'2023-05-22' AS Date), CAST(N'2023-04-12T13:16:28.597' AS DateTime), 0, 0, 39, N'd0d64c06-852c-4bfa-b116-dab96121ecc9')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (58, 9, N'Bondia yo merengues', CAST(10.82 AS Decimal(5, 2)), CAST(9000.00 AS Decimal(7, 2)), CAST(9000.00 AS Decimal(7, 2)), CAST(N'2023-05-24' AS Date), CAST(N'2023-07-31' AS Date), CAST(N'2023-04-12T13:17:15.807' AS DateTime), 1, 0, 34, N'063fd258-a069-43f1-a89a-fc6b9f470bfb')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (59, 7, N'Techero sabatico 4562', CAST(5.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(7, 2)), CAST(303.73 AS Decimal(7, 2)), CAST(N'2023-02-25' AS Date), CAST(N'2023-05-25' AS Date), CAST(N'2023-04-12T13:24:29.223' AS DateTime), 0, 0, 28, N'871783b7-2d62-4de2-8532-9b478af78571')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (60, 7, N'Techero Afore 4563', CAST(5.00 AS Decimal(5, 2)), CAST(700.00 AS Decimal(7, 2)), CAST(708.69 AS Decimal(7, 2)), CAST(N'2023-02-25' AS Date), CAST(N'2023-05-25' AS Date), CAST(N'2023-04-12T13:31:28.130' AS DateTime), 0, 0, 39, N'3b118b68-fb87-4757-8605-1c2cb25729ec')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (61, 7, N'Techero Sabatico 4614', CAST(5.00 AS Decimal(5, 2)), CAST(3045.75 AS Decimal(7, 2)), CAST(3084.83 AS Decimal(7, 2)), CAST(N'2023-03-01' AS Date), CAST(N'2023-06-01' AS Date), CAST(N'2023-04-12T13:33:43.427' AS DateTime), 0, 0, 28, N'b6008c50-71f8-47ac-ba4a-f8bced5e2d95')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (62, 4, N'Fondo de inversion yo merengues', CAST(8.43 AS Decimal(5, 2)), CAST(6606.33 AS Decimal(7, 2)), CAST(6627.29 AS Decimal(7, 2)), CAST(N'2023-03-01' AS Date), CAST(N'2023-06-01' AS Date), CAST(N'2023-04-12T13:35:33.347' AS DateTime), 0, 0, 34, N'a9d9a4f6-3838-46c6-b74f-1b71e0e89140')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (63, 5, N'Techero Afore 358598 crece +', CAST(5.00 AS Decimal(5, 2)), CAST(15384.56 AS Decimal(7, 2)), CAST(14942.31 AS Decimal(7, 2)), CAST(N'2023-03-24' AS Date), CAST(N'2023-09-26' AS Date), CAST(N'2023-04-12T13:40:13.180' AS DateTime), 1, 0, 39, N'efd7e2ac-b2f7-4025-8d99-69962a58782c')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (64, 7, N'Techero Titulacion 358592 crece +', CAST(5.00 AS Decimal(5, 2)), CAST(10965.68 AS Decimal(7, 2)), CAST(10391.89 AS Decimal(7, 2)), CAST(N'2023-06-26' AS Date), CAST(N'2023-07-26' AS Date), CAST(N'2023-04-12T13:41:49.660' AS DateTime), 1, 0, 27, N'ea56523f-b27e-48d1-b2f8-de428a1c7352')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (65, 8, N'Techero Sabatico 275641 crece +', CAST(5.00 AS Decimal(5, 2)), CAST(6705.76 AS Decimal(7, 2)), CAST(6487.49 AS Decimal(7, 2)), CAST(N'2023-03-24' AS Date), CAST(N'2023-09-25' AS Date), CAST(N'2023-04-12T13:42:38.643' AS DateTime), 1, 0, 28, N'28d34fe8-7e8a-40aa-bc69-cbb1174c36ab')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (66, 10, N'Cetes Vacaciones 230511/27483924', CAST(11.28 AS Decimal(5, 2)), CAST(1500.00 AS Decimal(7, 2)), CAST(993.44 AS Decimal(7, 2)), CAST(N'2023-04-13' AS Date), CAST(N'2023-05-11' AS Date), CAST(N'2023-04-12T13:44:50.787' AS DateTime), 0, 0, 42, N'dddcc2b6-54a2-41dd-b372-4e35d0456d3a')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (67, 2, N'Ahorro Tech, cosas', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(N'2023-04-12' AS Date), CAST(N'2023-12-20' AS Date), CAST(N'2023-04-12T15:07:51.680' AS DateTime), 1, 0, 35, N'a87a81b7-3425-499d-93e2-3f82d0ecbe83')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (70, 4, N'Cdmx internet Liq gub', CAST(9.37 AS Decimal(5, 2)), CAST(612.76 AS Decimal(7, 2)), CAST(436.72 AS Decimal(7, 2)), CAST(N'2023-05-09' AS Date), CAST(N'2023-07-25' AS Date), CAST(N'2023-04-14T11:12:02.427' AS DateTime), 1, 0, 22, N'954a796f-705c-49f0-9778-cdca33f1311c')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (71, 4, N'Cdmx Luz Liq pesos', CAST(9.33 AS Decimal(5, 2)), CAST(105.04 AS Decimal(7, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(N'2023-06-26' AS Date), CAST(N'2023-08-25' AS Date), CAST(N'2023-04-14T11:14:33.810' AS DateTime), 1, 0, 21, N'1a4157c9-986e-45c8-b458-b4cc4277aa96')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (72, 4, N'Tlax internet Liq Gub', CAST(9.37 AS Decimal(5, 2)), CAST(68.56 AS Decimal(7, 2)), CAST(369.00 AS Decimal(7, 2)), CAST(N'2023-05-25' AS Date), CAST(N'2023-07-25' AS Date), CAST(N'2023-04-14T11:19:20.793' AS DateTime), 1, 0, 5, N'f456215a-02f7-4a2f-b8bf-2864e2865b5c')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (73, 4, N'Tlax Luz Liq pesos', CAST(9.33 AS Decimal(5, 2)), CAST(534.67 AS Decimal(7, 2)), CAST(239.47 AS Decimal(7, 2)), CAST(N'2023-05-09' AS Date), CAST(N'2023-08-25' AS Date), CAST(N'2023-04-14T11:22:13.690' AS DateTime), 1, 0, 4, N'a9211722-d8a3-4d96-b57c-b3eba48c911e')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (74, 10, N'Vacaciones cuba 3646', CAST(11.30 AS Decimal(5, 2)), CAST(1496.90 AS Decimal(7, 2)), CAST(1497.35 AS Decimal(7, 2)), CAST(N'2023-05-18' AS Date), CAST(N'2023-07-15' AS Date), CAST(N'2023-04-20T10:10:00.440' AS DateTime), 0, 0, 31, N'cb409d6e-4520-4a1b-a75d-cf8f8d0d5751')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (75, 10, N'Vacaciones cuba', CAST(11.30 AS Decimal(5, 2)), CAST(500.00 AS Decimal(7, 2)), CAST(500.00 AS Decimal(7, 2)), CAST(N'2023-04-20' AS Date), CAST(N'2023-05-18' AS Date), CAST(N'2023-04-20T10:13:34.927' AS DateTime), 0, 0, 42, N'8e60b0d5-4042-4800-b023-36e4d39aed29')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (76, 9, N'Vacaciones cuba yo bondia', CAST(11.28 AS Decimal(5, 2)), CAST(500.00 AS Decimal(7, 2)), CAST(500.00 AS Decimal(7, 2)), CAST(N'0023-04-27' AS Date), CAST(N'2023-05-18' AS Date), CAST(N'2023-04-27T09:31:47.200' AS DateTime), 0, 0, 31, N'7c8df763-871b-49b9-845a-aca0d98dc10a')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (77, 4, N'Renta', CAST(7.77 AS Decimal(5, 2)), CAST(2849.97 AS Decimal(7, 2)), CAST(2849.97 AS Decimal(7, 2)), CAST(N'2023-04-27' AS Date), CAST(N'2023-05-13' AS Date), CAST(N'2023-04-27T09:36:50.400' AS DateTime), 0, 0, 34, N'0b175ab5-7b05-4990-868a-e5d4caa151b8')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (78, 5, N'Yo merengues 346688 crece +', CAST(5.00 AS Decimal(5, 2)), CAST(6086.31 AS Decimal(7, 2)), CAST(6111.67 AS Decimal(7, 2)), CAST(N'2023-07-20' AS Date), CAST(N'2023-08-21' AS Date), CAST(N'2023-05-15T10:05:56.220' AS DateTime), 1, 0, 34, N'5511a2d4-0462-4f56-851f-98d04cbd5910')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (79, 10, N'Cetes 28 29043857', CAST(11.25 AS Decimal(5, 2)), CAST(1546.47 AS Decimal(7, 2)), CAST(1549.41 AS Decimal(7, 2)), CAST(N'2023-05-25' AS Date), CAST(N'2023-07-15' AS Date), CAST(N'2023-05-19T08:41:40.233' AS DateTime), 0, 0, 42, N'13e98270-afd4-43e8-b097-d780fc70f83c')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (82, 2, N'string', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(N'2023-05-23' AS Date), CAST(N'2023-05-23' AS Date), CAST(N'2023-05-22T18:50:08.630' AS DateTime), 0, 0, 39, N'3fa85f64-5717-4562-b3fc-2c963f66afa6')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (83, 9, N'vacaciones bondia', CAST(0.00 AS Decimal(5, 2)), CAST(3500.00 AS Decimal(7, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(N'2023-05-25' AS Date), CAST(N'2023-07-31' AS Date), CAST(N'2023-05-26T09:15:40.390' AS DateTime), 1, 0, 31, N'80060d3c-a808-4c01-a0c6-2249b665c0b5')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (84, 9, N'Vacaciones', CAST(0.00 AS Decimal(5, 2)), CAST(3500.00 AS Decimal(7, 2)), CAST(0.00 AS Decimal(7, 2)), CAST(N'2023-01-29' AS Date), CAST(N'2023-07-31' AS Date), CAST(N'2023-05-29T09:24:09.793' AS DateTime), 1, 0, 42, N'18bf146d-5cb6-4179-847e-f76557f7d4ed')
INSERT [dbo].[Apartado] ([Id], [TipoDeApartadoId], [Nombre], [Intereses], [CantidadInicial], [CantidadFinal], [FechaInicial], [FechaFinal], [FechaDeRegistro], [EstaActivo], [PeriodoId], [SubcategoriaId], [Guid]) VALUES (85, 10, N'Cetes 28', CAST(11.20 AS Decimal(5, 2)), CAST(1946.96 AS Decimal(7, 2)), CAST(1497.00 AS Decimal(7, 2)), CAST(N'2023-06-01' AS Date), CAST(N'2023-07-15' AS Date), CAST(N'2023-06-01T11:59:37.520' AS DateTime), 0, 0, 34, N'54a9c054-5928-4cba-93ab-aeebe0a8078b')
SET IDENTITY_INSERT [dbo].[Apartado] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre], [EstaActivo]) VALUES (1, N'Entrada', 1)
INSERT [dbo].[Categoria] ([Id], [Nombre], [EstaActivo]) VALUES (2, N'Gastos', 1)
INSERT [dbo].[Categoria] ([Id], [Nombre], [EstaActivo]) VALUES (3, N'Apartado', 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1, N'Silla de Nancy', NULL, 15, CAST(5100.00 AS Decimal(8, 2)), 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 0, N'2a77bd0f-2a52-4e7f-a7f3-7ab2f8c43a6c')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (2, N'Tablet', NULL, 12, CAST(3804.00 AS Decimal(8, 2)), 1, CAST(N'2022-08-22T00:00:00.000' AS DateTime), 1, N'1ada6992-c587-4d69-ae9f-b0aa03a314ae')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3, N'Horno electrico', NULL, 9, CAST(1701.00 AS Decimal(8, 2)), 1, CAST(N'2022-09-13T00:00:00.000' AS DateTime), 0, N'907c6bc3-5879-4b5e-9502-ada1ea0297d9')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4, N'Escritorio ajustable', NULL, 12, CAST(5990.00 AS Decimal(8, 2)), 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1, N'1acdfed2-fb22-4692-9406-3d25dce3a635')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (5, N'Bocina Electra', N'Moises', 6, CAST(4299.00 AS Decimal(8, 2)), 1, CAST(N'2023-03-19T00:00:00.000' AS DateTime), 1, N'9d43d802-aeeb-4748-967a-eb85a76fd006')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (6, N'Int del periodo', NULL, 1, CAST(314.11 AS Decimal(8, 2)), 1, CAST(N'2022-04-03T00:00:00.000' AS DateTime), 0, N'57280ee1-d4c8-47b8-a696-0621f1350dd5')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (7, N'Compra aurrera', NULL, 1, CAST(742.00 AS Decimal(8, 2)), 1, CAST(N'2023-04-13T00:00:00.000' AS DateTime), 0, N'8b3ba3b1-8dee-4cad-acaf-9f473a5e9963')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (8, N'Anterio', NULL, 1, CAST(7434.60 AS Decimal(8, 2)), 1, CAST(N'2023-04-14T00:00:00.000' AS DateTime), 0, N'dba82137-64bf-47da-91cc-4d6bf12613de')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (9, N'Pago', NULL, 1, CAST(-1350.00 AS Decimal(8, 2)), 1, CAST(N'2023-04-14T00:00:00.000' AS DateTime), 0, N'b3330d11-8279-446d-a441-b5c83f9898b3')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (10, N'Luz cdmx', NULL, 1, CAST(333.00 AS Decimal(8, 2)), 1, CAST(N'2023-04-26T00:00:00.000' AS DateTime), 0, N'1d2729da-43a3-4ec6-8924-c54ed0c52dc4')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (11, N'Pago', N'Bocina electra', 1, CAST(-717.00 AS Decimal(8, 2)), 1, CAST(N'2023-04-26T00:00:00.000' AS DateTime), 0, N'24f9d76f-73bb-43c2-acc2-e34d1aed5324')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (12, N'Kindle', NULL, 6, CAST(1949.00 AS Decimal(8, 2)), 1, CAST(N'2023-07-14T00:00:00.000' AS DateTime), 1, N'1ad69c3d-4b70-4c0d-bcbb-926b179b6b5a')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (13, N'Bici', NULL, 15, CAST(4149.00 AS Decimal(8, 2)), 1, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 1, N'5ca32971-ef64-4fe4-bad2-c97c127aeebf')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (14, N'Saldo restante', NULL, 1, CAST(7282.00 AS Decimal(8, 2)), 1, CAST(N'2023-07-17T00:00:00.000' AS DateTime), 1, N'e90af322-06ce-44b0-8cd8-d283a966dcab')
INSERT [dbo].[Compra] ([Id], [Nombre], [Nota], [MesesSinIntereses], [Cantidad], [TdcId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1014, N'Examen de ingles', NULL, 1, CAST(1375.00 AS Decimal(8, 2)), 1, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1, N'856c412c-a9ed-4ec5-98c2-fbba2542f3d8')
SET IDENTITY_INSERT [dbo].[Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Destino] ON 

INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (1, N'Ahorro Camioneta', CAST(100.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (2, N'Ahorro Gastos Medicos', CAST(100.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (3, N'Ahorro vacaciones Cuba', CAST(500.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (4, N'Ahorro Ropa', CAST(100.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (5, N'Ahorro N', CAST(200.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (6, N'Ahorro Tech, Cosas', CAST(100.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (7, N'Ahorro Tlax', CAST(400.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (8, N'Afore', CAST(700.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (9, N'Titulacion', CAST(500.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (10, N'Sabatico', CAST(300.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (11, N'PC', CAST(300.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [Presupuesto], [EstaActivo]) VALUES (13, N'Ahorro vacaciones Cuba', CAST(500.00 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[Destino] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleDeApartado] ON 

INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (1, CAST(57511.55 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T09:27:31.270' AS DateTime), 33, 1, N'39380960-2dfd-41a8-87c6-e84bd7e3bf2a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (2, CAST(27013.47 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T09:44:44.927' AS DateTime), 34, 1, N'c2f9a961-9473-406f-b60a-7c78f3a2707a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3, CAST(523.34 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T09:49:20.947' AS DateTime), 35, 1, N'137c8dbf-1e54-4d9c-8c1e-409f445a24e8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (8, CAST(2437.44 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:25:13.300' AS DateTime), 40, 1, N'043a1f52-656c-43ef-b5cd-2c0828287249')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (9, CAST(10103.37 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:37:09.363' AS DateTime), 41, 1, N'b422fefd-8b4e-4186-922e-58e935ccd412')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (10, CAST(6606.33 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:39:41.350' AS DateTime), 42, 1, N'00b16263-6aef-40f3-b4c8-d07dc2a5c3f7')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (11, CAST(2014.78 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:41:39.280' AS DateTime), 43, 1, N'057ff7aa-c32e-4d4d-8c30-97d1fb3effab')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (12, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:44:41.350' AS DateTime), 44, 1, N'7f64cc45-23ff-40f7-8d35-4c961fc316cf')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (13, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:46:04.013' AS DateTime), 45, 1, N'48966846-760e-4020-8473-229154b857d7')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (14, CAST(3000.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:49:04.943' AS DateTime), 46, 1, N'dc885f72-60f0-421c-88e1-22f74aa14e24')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (15, CAST(3000.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:54:51.117' AS DateTime), 47, 1, N'421afc79-e667-4abc-9e3c-ff022a8fe1be')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (16, CAST(3849.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:58:48.800' AS DateTime), 48, 1, N'1f8fbc0e-d0b4-444d-b329-21ad165518ba')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (17, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T12:59:40.623' AS DateTime), 49, 1, N'bbf5ef5b-aa96-484c-a9f8-b472df325c6d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (18, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:02:45.190' AS DateTime), 50, 1, N'2e4699be-de4d-44f4-8206-f6407cb4366a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (19, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:03:34.763' AS DateTime), 51, 1, N'df2de6b6-1abe-400f-aad1-5d1d80404d77')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (20, CAST(3062.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:05:47.167' AS DateTime), 52, 1, N'ebd33680-f640-4619-8bb6-b0fecb3a198b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (21, CAST(2424.90 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:07:02.727' AS DateTime), 53, 1, N'1cd6562d-71ba-4370-ba6e-7819d6b6b014')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (22, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:11:08.160' AS DateTime), 54, 1, N'a6a65eff-08c2-4cbc-920e-9c28a2e95833')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (23, CAST(99.16 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:13:08.940' AS DateTime), 55, 1, N'e0af9ce2-ede5-4053-8b99-223c3f137602')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (24, CAST(4997.03 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:15:26.223' AS DateTime), 56, 1, N'27423363-b0aa-4460-819e-1084e6d7ce3f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (25, CAST(3015.52 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:16:28.600' AS DateTime), 57, 1, N'068cc8af-704e-44e9-a25d-b8cd55e7c172')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (26, CAST(9994.07 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:17:15.817' AS DateTime), 58, 1, N'd2fd65ea-cbe7-4343-80b1-ac49018629ee')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (27, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:24:29.520' AS DateTime), 59, 1, N'b31fd417-a695-4034-a631-4e93202a97be')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (28, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:31:28.143' AS DateTime), 60, 1, N'5e9e0c73-2080-4e27-9ee3-5c4ef07fe448')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (29, CAST(3045.75 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:33:43.430' AS DateTime), 61, 1, N'938a7b51-6a2f-41c2-8704-df448b30478d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (30, CAST(6606.33 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:35:33.360' AS DateTime), 62, 1, N'2f30c584-b858-4246-86ab-79b2a3347302')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (31, CAST(2823.43 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:40:13.187' AS DateTime), 63, 1, N'b9295fa6-4460-45af-889f-650ffc67d30d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (32, CAST(1003.76 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:41:49.673' AS DateTime), 64, 1, N'140d2628-2030-478d-92f5-24030f82b6b7')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (33, CAST(600.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T13:42:38.657' AS DateTime), 65, 1, N'1b7e54fa-0397-4957-bfd3-e096794e1cf1')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (34, CAST(500.00 AS Decimal(7, 2)), N'Nancy', CAST(N'2023-04-12T13:44:50.790' AS DateTime), 66, 1, N'1c5cd0d3-3d84-42d5-b886-8e625df3c1c3')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (35, CAST(400.00 AS Decimal(7, 2)), N'Historico', CAST(N'2023-04-12T14:56:38.890' AS DateTime), 8, 1, N'7c94c13c-dabb-49b3-aea3-ee165a5d780f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (37, CAST(1400.00 AS Decimal(7, 2)), N'historico', CAST(N'2023-04-12T15:05:30.957' AS DateTime), 27, 1, N'113ba96f-4262-4ead-bebe-9d2f834af6b9')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (38, CAST(2600.00 AS Decimal(7, 2)), N'historico', CAST(N'2023-04-12T15:06:14.017' AS DateTime), 24, 1, N'ec0783b7-5554-4643-9e7e-03c03d9aceef')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (39, CAST(178.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T15:07:51.687' AS DateTime), 67, 1, N'e63bdd79-0b30-41de-b214-e2ba288bc02f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (43, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-12T17:44:31.063' AS DateTime), 8, 1, N'2447cc87-0d93-44ee-8e7c-4d91f61a2468')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (44, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T11:56:15.567' AS DateTime), 24, 1, N'b1cf29a3-7452-4421-b855-0d2b39cb17b8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (45, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:26:28.547' AS DateTime), 63, 1, N'12ddf3ef-4908-40bb-9170-5ba3f126b41b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (46, CAST(400.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:34:27.907' AS DateTime), 28, 1, N'123fe7ad-eb2b-4597-a0bf-d249f307d977')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (47, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:36:53.373' AS DateTime), 9, 1, N'600e2055-1052-4218-a5fc-b5908fe8fe99')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (48, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:39:23.850' AS DateTime), 27, 1, N'1ef94176-49ed-450d-8554-d41aa26ae83c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (49, CAST(101.90 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:45:14.100' AS DateTime), 39, 1, N'142f4faf-8e02-4317-8ac4-d19e9b223ff9')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (50, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:48:13.260' AS DateTime), 40, 1, N'd7c47a95-7af6-42c2-b16a-3a6d2b0c6ce8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (51, CAST(500.00 AS Decimal(7, 2)), N'Victor', CAST(N'2023-04-13T13:50:32.210' AS DateTime), 66, 1, N'c9f17351-3253-4746-95df-66c151dc801b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (52, CAST(288.73 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:51:59.703' AS DateTime), 37, 1, N'33471f3d-8ba4-4365-8c5a-903a86b3832a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (53, CAST(285.46 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:52:19.867' AS DateTime), 36, 1, N'7d31bf71-2e39-4ce6-8a41-e6713b845cfc')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (54, CAST(301.32 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:54:25.220' AS DateTime), 38, 1, N'6dc080b5-52f0-4b7b-93bc-bf6fb3b90a8f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (55, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-13T13:58:32.473' AS DateTime), 65, 1, N'c7e4cadc-08cd-4e8e-99cd-ef304056fe12')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (57, CAST(175.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-14T11:12:22.170' AS DateTime), 70, 1, N'4ccce387-c260-4677-94d7-19880b50450f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (58, CAST(101.95 AS Decimal(7, 2)), NULL, CAST(N'2023-04-14T11:14:45.643' AS DateTime), 71, 1, N'8ec741b3-8305-4473-bb5f-82270f7a2c2c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (59, CAST(111.07 AS Decimal(7, 2)), NULL, CAST(N'2023-04-14T11:15:58.913' AS DateTime), 35, 1, N'8f91f2d8-22f7-457b-89c6-f60a76a925f5')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (60, CAST(126.63 AS Decimal(7, 2)), NULL, CAST(N'2023-04-14T11:19:59.587' AS DateTime), 72, 1, N'57a8625f-9b94-4957-b75e-1b63e468fb9e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (61, CAST(118.94 AS Decimal(7, 2)), NULL, CAST(N'2023-04-14T11:22:33.937' AS DateTime), 73, 1, N'eba01db1-c477-4925-80b7-15e36ff20b9c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (62, CAST(3050.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-20T08:33:00.000' AS DateTime), 64, 1, N'4f0c3e95-6801-4a29-8817-6edd7c8e6914')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (63, CAST(500.00 AS Decimal(7, 2)), N'Nancy', CAST(N'2023-04-20T10:14:17.147' AS DateTime), 75, 1, N'f77196ae-4267-47ac-925d-35c5504a8186')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (64, CAST(-500.00 AS Decimal(7, 2)), N'Verificación 400, ayuda 200', CAST(N'2023-04-20T14:54:51.970' AS DateTime), 8, 1, N'19a97797-9456-4cb5-aed5-e9f663dbddd7')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (66, CAST(3911.92 AS Decimal(7, 2)), N'Techero seminario 4011', CAST(N'2023-04-21T08:49:52.283' AS DateTime), 64, 1, N'86203a2c-ef08-4a8c-ad0e-4e7f0ad0481a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (67, CAST(711.43 AS Decimal(7, 2)), N'4055', CAST(N'2023-04-25T09:21:49.000' AS DateTime), 63, 1, N'f42eb342-e9dd-4137-b4fe-6f96f830354d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (68, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-26T20:52:41.207' AS DateTime), 63, 1, N'eedad77f-a9ff-4879-8e10-2e826d907ca3')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (69, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-26T20:54:41.353' AS DateTime), 65, 1, N'b9cad158-da50-4ad6-bce5-000e377b696a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (70, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-26T20:56:43.097' AS DateTime), 64, 1, N'4af021d6-93bf-4a2b-9e13-5f911bb4851a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (71, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-26T21:41:55.867' AS DateTime), 24, 1, N'a8756c71-fcb5-4e0a-968a-ac74c84020d1')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (72, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-26T21:42:44.023' AS DateTime), 27, 1, N'0071d7ef-d110-470d-af9e-10236b746abe')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (73, CAST(200.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:40:51.187' AS DateTime), 9, 1, N'eed20749-3206-4666-94be-23583b9f03be')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (74, CAST(110.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:42:46.180' AS DateTime), 40, 1, N'f3ca9eb0-c15d-4dc9-b90e-a9a9853f3cb1')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (75, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:44:46.157' AS DateTime), 8, 1, N'eca674ef-7f9a-41cf-943c-35ee26aed038')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (76, CAST(175.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:46:05.940' AS DateTime), 70, 1, N'afd9263f-5aed-4e97-9b4f-b9f70ee25a45')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (77, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:46:46.833' AS DateTime), 71, 1, N'eea1e7a1-81c6-45e6-8eb8-1762e1f8c659')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (78, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:48:00.580' AS DateTime), 37, 1, N'b28dff5b-433e-4e46-8f05-56580632165f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (79, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:48:38.337' AS DateTime), 36, 1, N'7ef623c7-b123-4fd5-8a55-54abbb769b6b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (80, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:50:29.103' AS DateTime), 38, 1, N'25a96fdd-1199-416d-89d1-eef59772940c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (81, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:51:19.873' AS DateTime), 35, 1, N'ad188f08-5035-4a2b-860e-a838ac827265')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (82, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:52:05.393' AS DateTime), 39, 1, N'ef67272c-13de-456b-8e79-e0f39caef714')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (83, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:56:16.283' AS DateTime), 72, 1, N'803ed876-db55-4e0e-8cb2-ad4d1be785b6')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (84, CAST(125.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T08:57:24.313' AS DateTime), 73, 1, N'4e6e91f0-095e-498e-9bb7-0765246d160c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (86, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-04-27T09:33:08.173' AS DateTime), 76, 1, N'c9fb4e91-fbc3-49b1-8db4-e1180955e129')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (87, CAST(500.00 AS Decimal(7, 2)), N'Bondia', CAST(N'2023-05-09T14:25:43.097' AS DateTime), 66, 1, N'd26fabb3-ccbb-479e-8003-493dc111e520')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (88, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T08:52:44.150' AS DateTime), 63, 1, N'7c2a50d6-a551-47c6-8119-769327ddfe70')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (89, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T08:59:10.857' AS DateTime), 64, 1, N'04e9dcce-5273-4827-9992-3f920e62cb52')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (90, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:02:07.507' AS DateTime), 65, 1, N'8671436f-e918-4685-85c5-441dfc45732c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (91, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:08:24.767' AS DateTime), 8, 1, N'bc9e1cc2-c8ce-4d03-b3a2-01504ea2b112')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (92, CAST(108.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:11:07.900' AS DateTime), 39, 1, N'9d1b4fa1-3f98-49f6-a25f-9555d0526679')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (93, CAST(287.64 AS Decimal(7, 2)), N'591.28, 878.93', CAST(N'2023-05-11T09:15:45.323' AS DateTime), 38, 1, N'ebd4e779-2fbd-4b33-94c0-a742ea0e63be')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (94, CAST(200.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:21:05.767' AS DateTime), 9, 1, N'903460f8-bff1-4bcd-a0fb-5de5a10a2923')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (95, CAST(102.68 AS Decimal(7, 2)), N'2652.77, 2748.65', CAST(N'2023-05-11T09:23:30.553' AS DateTime), 40, 1, N'bb79ddde-9470-4506-a8b9-b23a98f8a690')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (96, CAST(159.80 AS Decimal(7, 2)), N'335.59, 495.39', CAST(N'2023-05-11T09:25:07.220' AS DateTime), 70, 1, N'b0da2bbf-9861-4d9e-98ed-45d88971093c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (97, CAST(85.57 AS Decimal(7, 2)), N'188.26,  273.83', CAST(N'2023-05-11T09:28:36.877' AS DateTime), 71, 1, N'51721c98-72ee-45de-8137-1e2bb67a3e07')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (98, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:31:00.623' AS DateTime), 24, 1, N'4ea1d27d-3c59-47ec-a5ad-c4e97e040c29')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (99, CAST(400.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:31:23.383' AS DateTime), 28, 1, N'bda6f0d2-ecb4-4e86-89ca-50b62e3ec029')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (100, CAST(308.06 AS Decimal(7, 2)), N'581.59', CAST(N'2023-05-11T09:33:51.683' AS DateTime), 37, 1, N'c1cddc2c-286b-491d-bb8b-4ddca6e48614')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (101, CAST(303.63 AS Decimal(7, 2)), N'575.29, 878.93', CAST(N'2023-05-11T09:35:31.400' AS DateTime), 36, 1, N'e0b70aa5-b585-47fb-acbc-96ae787f01a6')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (102, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-11T09:36:21.023' AS DateTime), 27, 1, N'8d4e7b8e-d674-47b9-ab9c-7c35db328622')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (103, CAST(11.86 AS Decimal(7, 2)), N'735.10, 846.96', CAST(N'2023-05-11T09:40:18.500' AS DateTime), 35, 1, N'6a547e92-7f46-4bb7-a556-d4437022f16c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (104, CAST(111.86 AS Decimal(7, 2)), N'127.84, 239.70', CAST(N'2023-05-11T09:42:02.933' AS DateTime), 72, 1, N'a65d3d53-87ee-49e7-b267-a5bb2f2472d1')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (105, CAST(119.80 AS Decimal(7, 2)), N'239.60, 359.40', CAST(N'2023-05-11T09:43:45.870' AS DateTime), 73, 1, N'07e4bb55-4eb3-4f70-8042-1bea38f41493')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (106, CAST(500.00 AS Decimal(7, 2)), N'bondia', CAST(N'2023-05-11T09:49:16.580' AS DateTime), 74, 1, N'23bb7837-9268-47a7-af44-0d87c05871b8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (107, CAST(711.56 AS Decimal(7, 2)), NULL, CAST(N'2023-05-15T09:44:27.203' AS DateTime), 63, 1, N'502939f9-eebf-4f9d-a29b-b60aaf6d3999')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (108, CAST(304.85 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T08:21:56.760' AS DateTime), 65, 1, N'6e344488-147c-4029-8eac-7903fe6930e8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (109, CAST(2464.09 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T08:32:20.190' AS DateTime), 63, 1, N'ea2a45be-b337-420c-bccc-240b0800806e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (110, CAST(500.00 AS Decimal(7, 2)), N'500', CAST(N'2023-05-19T08:44:21.747' AS DateTime), 79, 1, N'3e236b0e-3bb1-4d50-a091-98276f008d1b')
GO
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (111, CAST(1000.00 AS Decimal(7, 2)), N'Previo', CAST(N'2023-05-19T08:45:17.310' AS DateTime), 79, 1, N'2a1e30d3-5f44-4903-82c6-3bb9472b58b8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (112, CAST(1000.00 AS Decimal(7, 2)), N'anterior', CAST(N'2023-05-19T08:48:39.330' AS DateTime), 74, 1, N'0cb0019b-cace-4965-b3c6-d5f3bbb4d486')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (113, CAST(-896.79 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T10:33:15.463' AS DateTime), 37, 1, N'b735c3f8-61e1-4d2e-8526-6bcacd5b58dd')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (114, CAST(-178.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T10:35:58.063' AS DateTime), 67, 1, N'5708dae0-1213-483f-8e07-2b7e08910d7a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (115, CAST(570.87 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T10:39:17.407' AS DateTime), 39, 1, N'3ffc209a-9e44-4884-8956-7e0537bb73e7')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (116, CAST(-287.52 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T10:42:13.890' AS DateTime), 71, 1, N'99ebbd08-9c4c-4038-bd33-52133cc6abba')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (117, CAST(-208.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-19T10:44:01.847' AS DateTime), 39, 1, N'e1f2d494-2522-45e1-86f9-c2e5b40d778c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (118, CAST(3065.36 AS Decimal(7, 2)), NULL, CAST(N'2023-05-22T08:23:18.500' AS DateTime), 63, 1, N'81a96919-6a2b-4a52-8be1-b33bfaadb43a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (119, CAST(0.00 AS Decimal(7, 2)), N'string', CAST(N'2023-05-23T16:39:55.553' AS DateTime), 8, 1, N'3fa85f64-5717-4562-b3fc-2c963f66afa6')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (120, CAST(-5000.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-24T09:40:01.350' AS DateTime), 42, 1, N'b7ac2a5c-0f9d-47d3-ab99-8d68ae851f86')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (121, CAST(708.69 AS Decimal(7, 2)), NULL, CAST(N'2023-05-25T18:53:40.053' AS DateTime), 63, 1, N'92a6ea5e-3a5b-4ac2-a528-b99ee00fcb95')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (122, CAST(303.73 AS Decimal(7, 2)), NULL, CAST(N'2023-05-25T18:56:30.803' AS DateTime), 65, 1, N'50c68eea-4004-4112-9263-18a6c614c811')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (123, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-25T19:27:47.890' AS DateTime), 63, 1, N'2e9e3dde-310c-48c5-ab15-0ea40c377465')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (126, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:08:56.670' AS DateTime), 65, 1, N'34efc579-9409-4f74-bfaa-e106461878af')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (127, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:10:33.223' AS DateTime), 64, 1, N'ea306ec8-7b01-4d6b-ab4c-184b0b42c838')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (128, CAST(200.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:27:51.007' AS DateTime), 9, 1, N'c675b734-db91-4f4b-bc26-5ffad92279b4')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (129, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:30:29.623' AS DateTime), 8, 1, N'f0b99259-b9e2-43a8-a45e-e7684c95228e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (130, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:31:04.003' AS DateTime), 24, 1, N'1066a248-2d35-4582-a874-3e87d2d991e0')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (131, CAST(304.83 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:34:01.563' AS DateTime), 38, 1, N'f614b2f0-184b-4cf8-9041-15d1088415cc')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (132, CAST(-215.12 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:44:21.237' AS DateTime), 38, 1, N'c05ca22e-a5b6-4dc9-a683-8ee0e3c5e6d5')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (133, CAST(96.26 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:46:22.387' AS DateTime), 40, 1, N'dcf6ea13-98d3-46c3-ac00-e503e4ffe29b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (134, CAST(400.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:47:08.617' AS DateTime), 28, 1, N'aeee5075-66d4-4293-9d68-e4d76554a2fa')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (135, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:47:45.417' AS DateTime), 27, 1, N'980dd327-fd83-45f4-b159-a7843b611360')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (136, CAST(192.52 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:51:30.060' AS DateTime), 70, 1, N'e6304fa1-1d75-4474-be2f-1ec8e7cb3fe8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (137, CAST(103.09 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:52:32.697' AS DateTime), 71, 1, N'3031893c-e25b-489d-bb8c-1cf306bb8ef9')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (138, CAST(309.29 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:54:11.907' AS DateTime), 37, 1, N'55b56f39-3c6a-4fb4-83db-750ef2bb2913')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (139, CAST(320.87 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:55:08.280' AS DateTime), 36, 1, N'7c5e14ce-3d9f-4925-a358-d804ffa3596f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (140, CAST(96.26 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:56:19.727' AS DateTime), 35, 1, N'8d47ec38-6278-4149-b492-ea5de8d1abd4')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (141, CAST(-215.25 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T08:57:39.377' AS DateTime), 36, 1, N'3a097551-4288-4c75-b97f-fa253cfaef6c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (142, CAST(128.35 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T09:03:00.540' AS DateTime), 72, 1, N'21dd1143-38d2-43c0-909c-711ad0d08154')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (143, CAST(120.27 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T09:04:10.217' AS DateTime), 73, 1, N'ffd3ca0c-af0e-44b7-80c3-97ca5d99725f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (144, CAST(-97.84 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T09:05:32.600' AS DateTime), 72, 1, N'96161e65-8825-4dce-ad59-c6749ba4310b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (145, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T09:16:56.077' AS DateTime), 83, 1, N'c3a40bd5-cc9b-488d-a185-0691cd50c078')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (146, CAST(-672.77 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T09:18:00.250' AS DateTime), 39, 1, N'51fd47e2-d0ff-44ce-9dd8-142eb3254552')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (147, CAST(103.09 AS Decimal(7, 2)), NULL, CAST(N'2023-05-26T09:19:17.133' AS DateTime), 39, 1, N'd3673f21-e73c-4fb1-9104-ea9d8a453e89')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (148, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-05-29T09:24:26.860' AS DateTime), 84, 1, N'76e265b2-e999-4780-bd43-2742f3312a68')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (149, CAST(3084.83 AS Decimal(7, 2)), NULL, CAST(N'2023-06-01T09:28:50.983' AS DateTime), 65, 1, N'056d4dc0-03db-4d82-b4b0-74c51709290d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (150, CAST(-500.00 AS Decimal(7, 2)), N'Luz Tlami', CAST(N'2023-06-01T09:41:49.790' AS DateTime), 28, 1, N'e6d85bea-8296-4149-9dd7-febc7718b720')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (151, CAST(-364.87 AS Decimal(7, 2)), N'Pago de internet', CAST(N'2023-06-01T09:47:08.393' AS DateTime), 70, 1, N'5e2ae9f3-83fa-48c0-b014-694b479b7fb8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (152, CAST(1496.96 AS Decimal(7, 2)), NULL, CAST(N'2023-06-01T12:00:15.400' AS DateTime), 85, 1, N'3f45d6c4-b172-4395-8705-98ef1beccca1')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (153, CAST(-1185.31 AS Decimal(7, 2)), NULL, CAST(N'2023-06-01T17:08:49.703' AS DateTime), 58, 1, N'2626e704-f5a4-4125-8e52-e0c92f654eea')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (154, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-09T14:54:31.250' AS DateTime), 63, 1, N'23c88fb5-0d37-4ad6-9fb4-8d096a84badb')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (155, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-09T18:47:55.783' AS DateTime), 65, 1, N'6c0d9292-8dec-4421-ace5-98b3f88c7e1e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (156, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-09T18:51:07.873' AS DateTime), 64, 1, N'bc9edbbc-e586-4642-9166-32486f0beca5')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (157, CAST(400.00 AS Decimal(7, 2)), N'Yan', CAST(N'2023-06-11T09:18:49.763' AS DateTime), 28, 1, N'cf0d20a5-dc5d-4574-95e7-32272e09e56f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (158, CAST(7907.90 AS Decimal(7, 2)), N'Bono y premio', CAST(N'2023-06-11T09:43:11.630' AS DateTime), 78, 1, N'e07bde9a-ae18-48d4-8e50-4fe19390a79b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (159, CAST(3118.84 AS Decimal(7, 2)), NULL, CAST(N'2023-06-11T09:46:43.353' AS DateTime), 78, 1, N'b541f43e-383b-43a0-b9ef-6acc09a635f6')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (160, CAST(-309.29 AS Decimal(7, 2)), N'Alimento', CAST(N'2023-06-12T10:05:26.153' AS DateTime), 37, 1, N'9789a637-e91d-4722-af40-403341dbeb98')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (161, CAST(500.00 AS Decimal(7, 2)), N'Vacaciones', CAST(N'2023-06-12T10:13:08.850' AS DateTime), 83, 1, N'ba47a2ab-12cf-4786-89f3-ae69be95ed86')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (162, CAST(360.00 AS Decimal(7, 2)), N'Arena', CAST(N'2023-06-12T10:14:11.053' AS DateTime), 36, 1, N'f14e077f-28c2-4d9d-8667-16cd0377f3f8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (163, CAST(-360.00 AS Decimal(7, 2)), N'Arena mercado libre', CAST(N'2023-06-12T10:14:37.207' AS DateTime), 36, 1, N'43bcea32-3044-422c-8478-b5222daba1c7')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (164, CAST(200.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:15:53.900' AS DateTime), 9, 1, N'5913f92c-22c1-4748-8cda-f7fdce947829')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (165, CAST(112.80 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:17:39.273' AS DateTime), 40, 1, N'c7c0e746-661c-4bad-b828-7bfc85dd2547')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (166, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:18:20.283' AS DateTime), 24, 1, N'7e24e474-8e00-47bd-99de-1f31747ab673')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (167, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:18:58.150' AS DateTime), 8, 1, N'094c2d91-3cb8-4335-82c0-37f3667f2756')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (168, CAST(177.27 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:20:29.803' AS DateTime), 70, 1, N'5a24b942-0452-4207-aba2-521ed741935f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (169, CAST(103.55 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:21:43.407' AS DateTime), 71, 1, N'63a090b1-a870-447a-b660-6655b95bbd99')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (170, CAST(325.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:22:46.033' AS DateTime), 37, 1, N'ca571bdf-2853-4c7e-9b9b-09994a3509cf')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (171, CAST(-325.00 AS Decimal(7, 2)), N'Mercado libre', CAST(N'2023-06-12T10:23:49.500' AS DateTime), 37, 1, N'04a8a53a-3211-43f5-a228-d54829952411')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (172, CAST(306.19 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:25:14.483' AS DateTime), 38, 1, N'599a8b6b-9c14-4924-a593-56d82bfe60ab')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (173, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:26:25.243' AS DateTime), 27, 1, N'5ab70b00-d3ac-4213-aa86-91d60caab537')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (174, CAST(-1600.00 AS Decimal(7, 2)), N'Pago tdc de ropa', CAST(N'2023-06-12T10:27:10.347' AS DateTime), 27, 1, N'ac79eee0-c4d5-452a-9cb0-b3b841bed2de')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (175, CAST(96.69 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:29:33.910' AS DateTime), 35, 1, N'4683f917-63f1-4c06-9053-799afab10bdc')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (176, CAST(103.55 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:30:37.147' AS DateTime), 39, 1, N'32404271-268c-4391-9985-aba35d3cd0b8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (177, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:32:50.263' AS DateTime), 72, 1, N'3187a04c-5c0f-461c-b3dc-446aa1b9d30e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (178, CAST(-400.00 AS Decimal(7, 2)), N'PAgo de internet', CAST(N'2023-06-12T10:33:17.467' AS DateTime), 72, 1, N'a1d17fce-e570-4c99-b693-f15c2bb259d8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (179, CAST(120.81 AS Decimal(7, 2)), NULL, CAST(N'2023-06-12T10:35:16.800' AS DateTime), 73, 1, N'e2b6b79b-07aa-467e-a007-6e746267b4ab')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (180, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-19T18:57:55.230' AS DateTime), 84, 1, N'08803531-a1d1-4c89-a5b1-98e93abf08dc')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (181, CAST(-400.00 AS Decimal(7, 2)), N'mantenimiento', CAST(N'2023-06-19T19:02:26.730' AS DateTime), 8, 1, N'16f2616a-022d-457d-a640-82b68f6b473a')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (182, CAST(-1000.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-19T19:03:15.610' AS DateTime), 28, 1, N'371af15b-988a-4164-b362-f03535635300')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (183, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-24T10:01:13.533' AS DateTime), 63, 1, N'73b0d560-05e4-4d78-974a-a7b4a5138935')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (184, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-24T10:22:51.240' AS DateTime), 65, 1, N'159db219-4cd6-47bd-bef4-6c00aad33957')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (185, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-24T10:26:16.047' AS DateTime), 64, 1, N'6cdbd07e-c6d9-45d2-97b1-287570bccc5f')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (186, CAST(200.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-25T09:25:42.407' AS DateTime), 9, 1, N'f551c0d9-96a4-4426-936e-4204032491d3')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (187, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-25T09:26:31.830' AS DateTime), 24, 1, N'0414f89e-96b5-400c-9ac7-a1eece1a77fe')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (188, CAST(400.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-25T09:27:18.980' AS DateTime), 28, 1, N'167ebc7b-c8c7-4643-b8a4-d68482c24b2b')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (189, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-25T09:28:23.030' AS DateTime), 8, 1, N'72b63e6c-1cdf-4771-b5f3-3c0332c06dbe')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (190, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-25T09:29:56.610' AS DateTime), 27, 1, N'6f0e6054-1560-4a5f-8a12-05495151a962')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (191, CAST(312.35 AS Decimal(7, 2)), N'anterior', CAST(N'2023-06-26T07:51:50.197' AS DateTime), 65, 1, N'8f909255-2cd3-458a-8ed5-7380a6cea6b2')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (192, CAST(80.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:39:00.027' AS DateTime), 71, 1, N'7f36c3a8-215a-478c-8388-f7fbe32ffb4d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (193, CAST(-286.00 AS Decimal(7, 2)), N'Pago', CAST(N'2023-06-26T09:39:39.000' AS DateTime), 71, 1, N'9eb6c2a4-3ec1-4e0f-9682-07d1be673a70')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (194, CAST(-258.00 AS Decimal(7, 2)), N'pago', CAST(N'2023-06-26T09:43:19.840' AS DateTime), 70, 1, N'c35f393a-1481-4b0a-9e3b-b5468b850199')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (195, CAST(177.92 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:45:05.840' AS DateTime), 70, 1, N'875c613d-4228-43d0-8391-f6b285f7f676')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (196, CAST(113.22 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:48:15.613' AS DateTime), 40, 1, N'b17971ae-e623-4edc-802a-747e840f4d74')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (197, CAST(311.82 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:49:35.737' AS DateTime), 37, 1, N'bde7c121-511c-4b86-9494-0ab1f8194cba')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (198, CAST(307.32 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:50:22.933' AS DateTime), 36, 1, N'9a6bb227-00c6-4d12-9440-657370a2dcde')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (199, CAST(307.32 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:51:52.083' AS DateTime), 38, 1, N'788c5a0c-d027-4bdf-9c84-53fa927673ff')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (200, CAST(113.22 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:52:56.317' AS DateTime), 35, 1, N'e30e6908-699d-4820-a5c1-5b7f02d78292')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (201, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T09:54:30.913' AS DateTime), 67, 1, N'c7e52254-7f14-45db-9284-d701c1ebd136')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (202, CAST(834.00 AS Decimal(7, 2)), N'previo', CAST(N'2023-06-26T09:55:01.050' AS DateTime), 67, 1, N'7627e89e-736c-4ad2-9dbe-bcd371c0a088')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (203, CAST(97.04 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T10:05:25.960' AS DateTime), 72, 1, N'98873a78-1da0-47fd-a909-63d13f0a347d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (204, CAST(121.26 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T10:06:51.457' AS DateTime), 73, 1, N'c8eb235c-5812-45c4-8468-c52877323d4e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (205, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-06-26T10:07:46.300' AS DateTime), 83, 1, N'42845765-5852-4c73-94c5-93605e52ed4c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (1183, CAST(-665.00 AS Decimal(7, 2)), N'compra de alimento', CAST(N'2023-07-03T10:36:27.370' AS DateTime), 36, 1, N'8cb06bae-e4a9-47ec-9cba-6daa15607d61')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (1184, CAST(-718.00 AS Decimal(7, 2)), N'SSD nuevo', CAST(N'2023-07-03T13:55:36.617' AS DateTime), 67, 1, N'6fb0a2e9-b34c-492d-9694-a675de4b1957')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (1185, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-05T17:44:22.943' AS DateTime), 84, 1, N'1277995c-69d9-4d14-8f15-01b4e9d8aea2')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (2185, CAST(700.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-10T15:51:51.653' AS DateTime), 63, 1, N'da76fe92-8a3c-4760-8b8c-4e5a6d205b82')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (2186, CAST(300.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-10T15:56:57.223' AS DateTime), 65, 1, N'07c0dcad-c2dc-41b7-b65e-9e6c1abff771')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (2187, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-10T15:59:15.383' AS DateTime), 64, 1, N'e7490d2b-592e-484d-85b2-011f5a742873')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3185, CAST(-330.61 AS Decimal(7, 2)), N'Pago', CAST(N'2023-07-13T15:31:44.873' AS DateTime), 73, 1, N'a987bc54-ad59-498d-b164-bfdf4413d01b')
GO
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3186, CAST(600.00 AS Decimal(7, 2)), N'mili gas, berenjena', CAST(N'2023-07-13T15:39:06.030' AS DateTime), 28, 1, N'76d9f2e8-b5fb-43ff-a26c-d5df266fc364')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3187, CAST(200.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:40:51.887' AS DateTime), 9, 1, N'68340003-3b0d-43f3-a445-1dbccf5e9f55')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3188, CAST(-1084.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:41:36.817' AS DateTime), 9, 1, N'b6cc3d2f-5b2b-4071-a93c-a8f4fd411dba')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3189, CAST(113.73 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:42:53.337' AS DateTime), 40, 1, N'39602b4d-3ae2-41b5-b760-6394e1f5be50')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3190, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:43:48.807' AS DateTime), 24, 1, N'489db3e3-89e8-4270-a2bf-4dcbb233851d')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3191, CAST(100.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:44:22.497' AS DateTime), 8, 1, N'2bdfbc05-eb76-454b-8181-a7c25e856d57')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3192, CAST(178.12 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:46:15.147' AS DateTime), 70, 1, N'627a7536-11b4-48d6-ace8-47a9f13e59c1')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3193, CAST(104.40 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:49:24.077' AS DateTime), 71, 1, N'964c3ee3-8f44-4d07-b59d-f73332cf71b3')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3194, CAST(308.70 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:51:56.250' AS DateTime), 37, 1, N'b3ffa6bc-83ff-44ad-8d48-63e04b6f296e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3195, CAST(308.70 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:52:44.407' AS DateTime), 36, 1, N'6281edcd-abf3-4390-8273-21beb5c60d4e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3196, CAST(308.70 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:54:46.760' AS DateTime), 38, 1, N'1ba64d5a-15dc-47fa-8259-0beb0c0734c8')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3197, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:56:04.390' AS DateTime), 27, 1, N'f38a610f-a711-4dbd-ad24-29de5d4c4a2c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3198, CAST(113.73 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T15:58:07.937' AS DateTime), 35, 1, N'd64b8932-119c-4494-b90c-397dbce6ea95')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3199, CAST(104.40 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T16:00:10.257' AS DateTime), 39, 1, N'607b55d8-0e9d-48c0-a076-e3176e74a59c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3200, CAST(-97.48 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T16:01:10.003' AS DateTime), 72, 1, N'6fdb284c-90d4-4d27-b014-85120e21ce16')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3201, CAST(139.20 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T16:02:40.340' AS DateTime), 73, 1, N'caacaf33-fb3f-405d-975d-a64c19ef3cc2')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3202, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-13T16:03:41.347' AS DateTime), 83, 1, N'4e958d54-fc88-4dd7-b45c-429d59a3bedd')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3203, CAST(-731.00 AS Decimal(7, 2)), N'disco duro nuevo', CAST(N'2023-07-13T16:11:57.510' AS DateTime), 38, 1, N'97c033a3-a245-494a-9d13-685e17d1e505')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3204, CAST(-1100.00 AS Decimal(7, 2)), N'Ajuste', CAST(N'2023-07-16T00:05:44.033' AS DateTime), 28, 1, N'7d2a9858-230e-4851-ae55-5c1b6566ec7c')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3205, CAST(-416.00 AS Decimal(7, 2)), N'Asiento y camara', CAST(N'2023-07-16T00:44:29.690' AS DateTime), 9, 1, N'7ca068ee-ec59-46da-b5c9-275f723cccf4')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3206, CAST(1300.00 AS Decimal(7, 2)), N'ajuste', CAST(N'2023-07-16T00:46:06.193' AS DateTime), 9, 1, N'50a047cc-d2f3-468a-bba6-62b90d22c2d6')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3207, CAST(-216.00 AS Decimal(7, 2)), N'camara y asiento', CAST(N'2023-07-16T00:47:09.850' AS DateTime), 67, 1, N'67747364-7e4b-41be-a0cd-adcb1c7321e9')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (3208, CAST(500.00 AS Decimal(7, 2)), NULL, CAST(N'2023-07-17T22:15:39.587' AS DateTime), 84, 1, N'4012b55d-e3ea-4e6e-97d1-2f75e7f2e1f0')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (4208, CAST(1500.00 AS Decimal(7, 2)), N'Anteriores', CAST(N'2023-07-20T17:37:11.413' AS DateTime), 84, 1, N'7e151a3e-01de-4191-97ff-9f8aca8f7efe')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (4209, CAST(1500.00 AS Decimal(7, 2)), N'Anterior', CAST(N'2023-07-20T17:37:35.010' AS DateTime), 83, 1, N'b072ed71-f463-465b-aa8c-aa970224853e')
INSERT [dbo].[DetalleDeApartado] ([Id], [Cantidad], [Nota], [FechaDeRegistro], [ApartadoId], [EstaActivo], [Guid]) VALUES (4210, CAST(1375.00 AS Decimal(7, 2)), N'Examen de ingles', CAST(N'2023-07-20T17:58:57.467' AS DateTime), 47, 1, N'149bc6f2-c9f8-4340-acaf-becb4027805b')
SET IDENTITY_INSERT [dbo].[DetalleDeApartado] OFF
GO
SET IDENTITY_INSERT [dbo].[Gasto] ON 

INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3, 1, N'Salario', CAST(12100.00 AS Decimal(7, 2)), 2, CAST(N'2023-04-05T18:10:01.177' AS DateTime), 1, N'59a6806a-cb91-4b81-a7a1-f35a662dd796')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4, 1, N'Nancy', CAST(2500.00 AS Decimal(7, 2)), 3, CAST(N'2023-04-05T18:25:31.373' AS DateTime), 1, N'8309bdb4-ce32-4e5d-a907-152d368d03eb')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (6, 1, N'Apartados', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-04-10T13:27:56.467' AS DateTime), 1, N'44e0a7a7-5219-4f38-94b3-5290976f84d4')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (7, 1, N'Apartados', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-04-10T17:14:54.020' AS DateTime), 1, N'14c5a406-25fc-4a6d-9776-6da4ac4712a9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (8, 1, N'Apartados', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-04-10T17:17:05.057' AS DateTime), 1, N'75b50b31-a3d0-41a5-967d-35412240ba22')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (9, 2, N'Apartados', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-04-10T17:48:40.477' AS DateTime), 1, N'b06aee6d-16f2-4fa6-987a-0c65144af3f8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (10, 1, N'Apartados', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-04-10T22:10:53.697' AS DateTime), 1, N'9eaaa0f2-1df3-4883-ad02-9555509c1bd6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (11, 1, N'Apartados', CAST(300.00 AS Decimal(7, 2)), 29, CAST(N'2023-04-10T22:11:26.023' AS DateTime), 1, N'b4190e4d-f9ca-46ec-a0cb-1722ba0d98f0')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (12, 1, N'Apartados', CAST(100.00 AS Decimal(7, 2)), 30, CAST(N'2023-04-10T22:11:47.097' AS DateTime), 1, N'131725e8-2bb1-47ab-be71-858e353ff743')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (13, 1, N'Apartados', CAST(105.00 AS Decimal(7, 2)), 6, CAST(N'2023-04-11T13:29:44.297' AS DateTime), 1, N'cdcfbca1-058f-4c79-b7ab-572cadafff61')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (14, 1, N'Apartados', CAST(125.00 AS Decimal(7, 2)), 4, CAST(N'2023-04-11T13:54:29.170' AS DateTime), 1, N'5661525c-aee0-4ed8-a4bc-4b49ecad1928')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (15, 1, N'Apartados', CAST(0.00 AS Decimal(7, 2)), 5, CAST(N'2023-04-11T13:55:16.260' AS DateTime), 1, N'b7fb738d-9f42-4574-9c1c-daa54818e57f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (16, 1, N'Apartados', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-04-11T13:56:38.640' AS DateTime), 1, N'3ccfb960-3834-4a53-bd99-113eddd1935c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (17, 1, N'Apartados', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-04-11T13:57:54.217' AS DateTime), 1, N'f94d636f-e254-4b31-bf57-63fed233a67e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (18, 1, N'Apartados', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-04-11T13:58:48.043' AS DateTime), 1, N'0892867b-ac24-4f2e-b504-afcfc51e0217')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (19, 1, N'Apartados', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-04-11T13:59:25.697' AS DateTime), 1, N'2ca3c88b-4521-4384-855f-415dfda2ad0f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (20, 1, N'Apartados', CAST(400.00 AS Decimal(7, 2)), 36, CAST(N'2023-04-11T13:59:47.860' AS DateTime), 1, N'5ac8a2b8-6c24-47c4-a86d-d09a8826671d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (21, 1, N'Apartados', CAST(100.00 AS Decimal(7, 2)), 35, CAST(N'2023-04-11T14:00:12.967' AS DateTime), 1, N'062446b2-346c-428d-bf28-302901c0430c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (22, 2, N'Apartados', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-04-11T14:30:26.770' AS DateTime), 1, N'caa85ac1-b0d5-4044-b994-48a98ec897ff')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (23, 2, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-04-12T17:44:50.097' AS DateTime), 1, N'6fbda492-7ff5-4961-9e83-6feecc61891d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (24, 2, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-04-13T11:56:16.300' AS DateTime), 1, N'1ebe88f9-5f50-4171-a3bf-d2fc5871b645')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (25, 2, N'Salario', CAST(12387.00 AS Decimal(7, 2)), 2, CAST(N'2023-04-13T12:25:34.520' AS DateTime), 1, N'587f4fb6-c1c0-41b6-bc59-785741397d4c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (26, 2, N'Abril', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-04-13T12:54:29.647' AS DateTime), 1, N'c82a05ef-6856-4370-9f45-ad101ddfb8c0')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (29, 2, N'Abril', CAST(250.00 AS Decimal(7, 2)), 13, CAST(N'2023-04-13T13:05:34.253' AS DateTime), 1, N'9c49319b-824d-47b7-a7c2-2428107fdd29')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (30, 2, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-04-13T13:26:28.620' AS DateTime), 1, N'c72a3aea-d088-485e-84b1-c41d317b3d96')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (31, 2, N'', CAST(400.00 AS Decimal(7, 2)), 36, CAST(N'2023-04-13T13:35:04.423' AS DateTime), 1, N'4ff9a736-33ee-4075-850c-a1886ac2abf5')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (32, 2, N'', CAST(300.00 AS Decimal(7, 2)), 34, CAST(N'2023-04-13T13:37:20.170' AS DateTime), 1, N'55a0b865-c254-4305-a4c2-71ecd320742f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (33, 2, N'', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-04-13T13:39:23.873' AS DateTime), 1, N'b68956fe-131f-40c7-bb88-3039751f3696')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (34, 2, N'', CAST(101.90 AS Decimal(7, 2)), 35, CAST(N'2023-04-13T13:45:14.120' AS DateTime), 1, N'322b889d-2148-40d1-b70e-b42d02d1592d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (35, 2, N'', CAST(100.00 AS Decimal(7, 2)), 30, CAST(N'2023-04-13T13:48:13.293' AS DateTime), 1, N'08292c9b-65e9-4b62-aac4-ce8b16995e45')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (36, 2, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-04-13T13:50:32.217' AS DateTime), 1, N'0e646e9d-8ea4-4901-ac3c-3d3d889b85de')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (37, 2, N'', CAST(288.73 AS Decimal(7, 2)), 15, CAST(N'2023-04-13T13:51:59.717' AS DateTime), 1, N'd41f75a1-90bb-437f-b24d-31ccda0b22bb')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (38, 2, N'', CAST(285.46 AS Decimal(7, 2)), 14, CAST(N'2023-04-13T13:52:19.883' AS DateTime), 1, N'b3f437b2-fef1-4ddd-a3ad-f366e9a483f8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (39, 2, N'', CAST(301.32 AS Decimal(7, 2)), 29, CAST(N'2023-04-13T13:54:25.230' AS DateTime), 1, N'c617f9f0-6d88-4238-b496-d17b21fdce53')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (40, 2, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-04-13T13:58:32.507' AS DateTime), 1, N'4cb266a8-4439-47ee-a55a-8f3704a0a265')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (41, 2, N'renta', CAST(2800.00 AS Decimal(7, 2)), 11, CAST(N'2023-04-13T21:20:58.113' AS DateTime), 1, N'47ac4ea1-c6bc-4bb6-a680-870e3a5a33ab')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (42, 2, N'seguro', CAST(75.00 AS Decimal(7, 2)), 10, CAST(N'2023-04-13T21:21:16.110' AS DateTime), 1, N'bd7c0915-b1b7-44f8-8a3a-bb8b378772f4')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (43, 2, N'tianguis 1', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-04-13T21:23:27.413' AS DateTime), 1, N'f7c143e3-eb13-4bbd-9d73-538638b71401')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (44, 2, N'', CAST(175.00 AS Decimal(7, 2)), 22, CAST(N'2023-04-14T11:12:22.213' AS DateTime), 1, N'68c3ee89-de48-4b6f-8852-fe4146a7935f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (45, 2, N'', CAST(101.95 AS Decimal(7, 2)), 21, CAST(N'2023-04-14T11:14:45.670' AS DateTime), 1, N'fee033e8-4fd3-462f-bd37-0f9b68e07d6f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (46, 2, N'', CAST(111.07 AS Decimal(7, 2)), 6, CAST(N'2023-04-14T11:15:58.943' AS DateTime), 1, N'8f19dde4-2a13-4b6f-93e8-40dbd4b40b30')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (47, 2, N'', CAST(126.63 AS Decimal(7, 2)), 5, CAST(N'2023-04-14T11:19:59.603' AS DateTime), 1, N'2c16ea07-bb35-4603-9abc-58a650b4344a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (48, 2, N'', CAST(118.94 AS Decimal(7, 2)), 4, CAST(N'2023-04-14T11:22:33.977' AS DateTime), 1, N'ff287ec4-6151-4947-bdff-af3ce3cb7820')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (49, 2, N'Pago tdc', CAST(850.00 AS Decimal(7, 2)), 7, CAST(N'2023-04-14T11:41:02.693' AS DateTime), 1, N'ec503919-fbbc-4a4c-aac5-ac1d6c27bf2a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (50, 2, N'Nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-04-20T00:09:08.257' AS DateTime), 1, N'1a603da4-389d-4731-97f5-932a3e76c5c5')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (51, 2, N'Tianguis 2', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-04-20T00:11:35.313' AS DateTime), 1, N'd0abf0bc-17b6-4e3c-903b-9169d4c64430')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (52, 2, N'Agua', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-04-20T00:12:10.333' AS DateTime), 1, N'fdb7543e-8241-4efb-98a4-2bb6975beb17')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (53, 2, N'Cel', CAST(250.00 AS Decimal(7, 2)), 20, CAST(N'2023-04-20T00:12:33.430' AS DateTime), 1, N'fedac95e-549e-4b2a-b569-b602ce2ab949')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (54, 2, N'Gas', CAST(300.00 AS Decimal(7, 2)), 16, CAST(N'2023-04-20T00:13:48.363' AS DateTime), 1, N'd1288601-49fd-44f7-8424-17a69e2ac66a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (55, 2, N'Semana', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-04-20T00:14:36.040' AS DateTime), 1, N'f9816995-3b2f-48c0-bbbd-a098f2c43b41')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (56, 2, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-04-20T10:14:17.167' AS DateTime), 1, N'd3ad3e6e-636c-4aaf-986d-9c3e38cfc3fa')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (57, 4, N'salario', CAST(12436.15 AS Decimal(7, 2)), 2, CAST(N'2023-04-26T20:49:43.463' AS DateTime), 1, N'52a6c789-8bdd-4eb8-ab1f-b1ad3cce5aa8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (58, 4, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-04-26T20:52:41.307' AS DateTime), 1, N'f7fac530-ed1d-4ffc-997f-a4d0ad8b5ca6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (59, 4, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-04-26T20:54:41.367' AS DateTime), 1, N'6b26a93f-fe96-42d5-8c62-8498011445e2')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (60, 4, N'', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-04-26T20:56:43.110' AS DateTime), 1, N'4c173075-bbf0-462a-b05e-1be8aef551af')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (62, 4, N'Abril 25', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-04-26T21:03:17.823' AS DateTime), 1, N'd50f4d49-9f90-46ca-8e92-d62e4a1aa028')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (63, 4, N'natacion', CAST(200.00 AS Decimal(7, 2)), 13, CAST(N'2023-04-26T21:08:15.207' AS DateTime), 1, N'd1c6dfb2-3070-4e13-9f85-941e5276e426')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (64, 4, N'50', CAST(50.00 AS Decimal(7, 2)), 20, CAST(N'2023-04-26T21:20:11.337' AS DateTime), 1, N'92ba4530-891c-4d72-8dd1-d88550426e66')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (65, 4, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-04-26T21:41:55.903' AS DateTime), 1, N'192718c6-039d-49c6-9fc3-97274a25ac19')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (66, 4, N'', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-04-26T21:42:44.063' AS DateTime), 1, N'93f5c627-b9f3-4991-88c7-2782a138262f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (67, 4, N'', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-04-27T08:40:51.330' AS DateTime), 1, N'0ac2898e-6b6e-4290-b391-e577833d07c0')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (68, 4, N'', CAST(110.00 AS Decimal(7, 2)), 30, CAST(N'2023-04-27T08:42:46.210' AS DateTime), 1, N'dc333f15-2bfc-4af6-a39c-25c7a38135c8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (69, 4, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-04-27T08:44:46.163' AS DateTime), 1, N'4796c248-0f1d-43a9-a446-0d48bb0544b6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (70, 4, N'', CAST(175.00 AS Decimal(7, 2)), 22, CAST(N'2023-04-27T08:46:05.953' AS DateTime), 1, N'f8cd528a-6113-40a1-9113-c03fb3633bbb')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (71, 4, N'', CAST(100.00 AS Decimal(7, 2)), 21, CAST(N'2023-04-27T08:46:46.860' AS DateTime), 1, N'0024540a-7711-407f-81fb-7bddcb2da9f3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (72, 4, N'', CAST(300.00 AS Decimal(7, 2)), 15, CAST(N'2023-04-27T08:48:00.587' AS DateTime), 1, N'862af90d-9259-46bb-bdc8-f499f2e89dcf')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (73, 4, N'', CAST(300.00 AS Decimal(7, 2)), 14, CAST(N'2023-04-27T08:48:38.363' AS DateTime), 1, N'9ceb3b20-4c65-439f-aa43-418c5ac1af71')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (74, 4, N'', CAST(300.00 AS Decimal(7, 2)), 29, CAST(N'2023-04-27T08:50:29.110' AS DateTime), 1, N'6e944ae2-3a1f-42f1-99a1-80c2f3d689bc')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (75, 4, N'', CAST(100.00 AS Decimal(7, 2)), 6, CAST(N'2023-04-27T08:51:19.900' AS DateTime), 1, N'145b2004-255a-42c5-a6a6-f5ed9ecf4dcc')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (76, 4, N'', CAST(100.00 AS Decimal(7, 2)), 35, CAST(N'2023-04-27T08:52:05.403' AS DateTime), 1, N'3ce4e03b-f402-4978-af38-051130505ad4')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (77, 4, N'', CAST(100.00 AS Decimal(7, 2)), 5, CAST(N'2023-04-27T08:56:16.290' AS DateTime), 1, N'98111eb0-abd6-42e0-a4b0-a88d8f2bdcac')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (78, 4, N'', CAST(125.00 AS Decimal(7, 2)), 4, CAST(N'2023-04-27T08:57:24.320' AS DateTime), 1, N'837469bb-44e3-4c51-84b5-4a292ad61d9e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (79, 4, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-04-27T09:33:08.180' AS DateTime), 1, N'5e2a6c74-2e3f-4103-8c4a-471a3b88ee17')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (80, 4, N'Inversion bbva', CAST(2849.97 AS Decimal(7, 2)), 11, CAST(N'2023-04-27T09:38:51.653' AS DateTime), 1, N'5aa597e2-38fa-40b6-af00-eb7f99fcb775')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (81, 4, N'Nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-05-02T19:29:47.923' AS DateTime), 1, N'61c0bda6-e07b-4350-8557-ca5adabf26bf')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (82, 4, N'Tianguis', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-05-02T19:41:51.923' AS DateTime), 1, N'aa9ba62b-fbbc-4b97-a76a-06766edbd6a4')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (83, 4, N'Tianguis', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-05-02T20:20:47.113' AS DateTime), 1, N'bceaa26d-6786-4b90-a6e8-9abcae509c07')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (84, 4, N'Semana 1', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-05-02T20:23:17.193' AS DateTime), 1, N'5a91ea71-0391-4e0d-83d6-b71e99e6e02f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (85, 4, N'Semana', CAST(500.00 AS Decimal(7, 2)), 9, CAST(N'2023-05-02T20:23:45.267' AS DateTime), 1, N'80a56a30-0731-4087-8f88-88b67c328656')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (86, 4, N'tianguis', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-05-02T20:24:45.323' AS DateTime), 1, N'b9f2d8ac-26e0-4ece-986a-0c31e63b05ad')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (87, 4, N'gas', CAST(200.00 AS Decimal(7, 2)), 16, CAST(N'2023-05-02T20:26:00.930' AS DateTime), 1, N'5f63ab6a-978e-411e-afbb-56e962435f5a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (88, 4, N'Agua', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-05-02T20:26:36.673' AS DateTime), 1, N'0540f3fc-d027-462a-b2fe-1205ece8c998')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (89, 4, N'Disco Nordika', CAST(200.00 AS Decimal(7, 2)), 17, CAST(N'2023-05-02T20:27:03.377' AS DateTime), 1, N'fd015d42-fdbd-439b-bd2d-47360d90b8fe')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (90, 4, N'Comida vegana', CAST(200.00 AS Decimal(7, 2)), 26, CAST(N'2023-05-02T20:27:39.810' AS DateTime), 1, N'5b757e2d-aed6-4907-bf64-67401bc42b22')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (91, 4, N'Efectivo', CAST(200.00 AS Decimal(7, 2)), 41, CAST(N'2023-05-02T20:27:53.223' AS DateTime), 1, N'6872097e-c05a-4cfb-b345-9db6b1e2eeee')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (92, 4, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-05-09T14:25:43.170' AS DateTime), 1, N'c59712b2-1fb3-45cb-9bdf-7dc9cfc95970')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (93, 33, N'Salario', CAST(12310.16 AS Decimal(7, 2)), 2, CAST(N'2023-05-11T08:47:46.160' AS DateTime), 1, N'23e07d0b-31ec-474f-8932-f13cc396ba9c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (94, 33, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-05-11T08:52:44.223' AS DateTime), 1, N'd5eccb38-765a-41a4-86bb-55e987066768')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (95, 33, N'', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-05-11T08:59:10.873' AS DateTime), 1, N'422a7fc5-295f-45c1-a322-b877bdf5c87b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (96, 33, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-05-11T09:02:07.510' AS DateTime), 1, N'1a7eb176-36f6-4d43-92c7-33b02b6385a9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (97, 33, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-05-11T09:08:24.787' AS DateTime), 1, N'208a7a38-450d-44ed-867c-98b792016846')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (98, 33, N'', CAST(108.00 AS Decimal(7, 2)), 35, CAST(N'2023-05-11T09:11:07.907' AS DateTime), 1, N'62cddbfc-fbf3-401a-b3a4-4afd8c8d3919')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (99, 33, N'', CAST(300.00 AS Decimal(7, 2)), 29, CAST(N'2023-05-11T09:15:45.323' AS DateTime), 1, N'9707c9fe-be7e-4b23-ada8-433c3ac4dfec')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (100, 33, N'', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-05-11T09:21:05.777' AS DateTime), 1, N'53a619eb-176d-4b5c-9f29-aa7084eaa269')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (101, 33, N'', CAST(100.00 AS Decimal(7, 2)), 30, CAST(N'2023-05-11T09:23:30.597' AS DateTime), 1, N'2a3cc4c2-eecd-4020-b571-759f127d89af')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (102, 33, N'', CAST(175.00 AS Decimal(7, 2)), 22, CAST(N'2023-05-11T09:25:07.223' AS DateTime), 1, N'bb59cb2e-b082-43a4-a7fd-3e4b5ce0fb67')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (103, 33, N'', CAST(85.57 AS Decimal(7, 2)), 21, CAST(N'2023-05-11T09:28:36.890' AS DateTime), 1, N'cf7d155e-955d-406d-914e-975505d7f386')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (104, 33, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-05-11T09:31:00.630' AS DateTime), 1, N'cb787c84-28a2-46d8-8246-21ca94dfd2d2')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (105, 33, N'', CAST(400.00 AS Decimal(7, 2)), 36, CAST(N'2023-05-11T09:31:23.390' AS DateTime), 1, N'c865f0eb-e26e-47d4-a649-a0b18dbdc47c')
GO
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (106, 33, N'', CAST(308.06 AS Decimal(7, 2)), 15, CAST(N'2023-05-11T09:33:51.697' AS DateTime), 1, N'376a51a5-66df-487e-93cc-3b4581f432b9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (107, 33, N'', CAST(303.63 AS Decimal(7, 2)), 14, CAST(N'2023-05-11T09:35:31.407' AS DateTime), 1, N'0d2b5d60-ae79-4e1b-8e7c-a2cd744eb889')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (108, 33, N'', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-05-11T09:36:21.040' AS DateTime), 1, N'5565214b-66e2-41df-8500-4fa9ab7d2170')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (109, 33, N'', CAST(11.86 AS Decimal(7, 2)), 6, CAST(N'2023-05-11T09:40:18.533' AS DateTime), 1, N'92f08968-8b0e-4cc5-952d-ba9278f2a49b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (110, 33, N'', CAST(111.86 AS Decimal(7, 2)), 5, CAST(N'2023-05-11T09:42:03.163' AS DateTime), 1, N'3e0c55d8-81fa-42fe-b14c-e8daf391657f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (111, 33, N'', CAST(119.80 AS Decimal(7, 2)), 4, CAST(N'2023-05-11T09:43:45.883' AS DateTime), 1, N'642c124d-0b5e-4245-acad-8b1562d62def')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (112, 33, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-05-11T09:49:16.600' AS DateTime), 1, N'ec0c9ccb-ead2-420b-a2e4-971cc9ff2271')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (113, 33, N'mayo', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-05-11T09:55:39.363' AS DateTime), 1, N'c33e5d03-85a7-466a-bd79-57ed121ac8e9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (114, 33, N'Natacion', CAST(200.00 AS Decimal(7, 2)), 13, CAST(N'2023-05-11T10:24:28.427' AS DateTime), 1, N'ab1a85c8-c907-4bd2-9433-bf0e888ac9d1')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (115, 33, N'2844', CAST(2800.00 AS Decimal(7, 2)), 11, CAST(N'2023-05-11T10:27:36.447' AS DateTime), 1, N'aed2fb37-d571-4144-ba27-88875dadc574')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (116, 39, N'agua', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-05-14T09:55:28.960' AS DateTime), 1, N'584a6482-09fe-4af0-8562-590b15f2913a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (117, 33, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-05-19T08:44:21.747' AS DateTime), 1, N'bdd637be-4167-4bce-b810-e847fcc66e3c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (118, 33, N'tianguis 15', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-05-19T10:48:11.177' AS DateTime), 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (119, 33, N'abuita', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-05-19T11:29:43.137' AS DateTime), 1, N'91c5f752-8fde-436e-9f41-fc5fa619201b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (120, 33, N'gas', CAST(250.00 AS Decimal(7, 2)), 16, CAST(N'2023-05-19T11:30:21.400' AS DateTime), 1, N'cc5862a4-8e9a-4d53-8e1d-2e2d2003d9cd')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (121, 33, N'semana 1', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-05-19T11:30:39.400' AS DateTime), 1, N'8ac8f143-0418-4c47-99c5-02e5d244f8a7')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (122, 33, N'semana 2', CAST(500.00 AS Decimal(7, 2)), 9, CAST(N'2023-05-19T11:31:08.387' AS DateTime), 1, N'e11d8a0f-1b46-4c0a-bf11-76520a83df90')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (123, 33, N'tianguis 2', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-05-19T11:31:39.103' AS DateTime), 1, N'2523aa28-5aad-4fb3-8c62-122bde3cd601')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (124, 33, N'Nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-05-19T11:33:07.320' AS DateTime), 1, N'b3068917-944c-4e90-a6c6-234b3a7db09c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (125, 33, N'Efectivo', CAST(700.00 AS Decimal(7, 2)), 41, CAST(N'2023-05-19T11:34:39.607' AS DateTime), 1, N'657350ee-deb3-4df3-a206-af9f6a74e836')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (126, 42, N'Nombre de prueba 2.0', CAST(100.00 AS Decimal(7, 2)), 26, CAST(N'2023-05-23T18:03:07.117' AS DateTime), 1, N'3fa85f64-5717-4562-b3fc-2c963f66afa6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (127, 33, N'Varios, Licencia de conducir', CAST(1200.00 AS Decimal(7, 2)), 26, CAST(N'2023-05-24T13:58:49.113' AS DateTime), 1, N'b0e4e32a-9ab7-44e6-8d77-750a0733f1a7')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (128, 33, N'Pago tdc', CAST(850.00 AS Decimal(7, 2)), 7, CAST(N'2023-05-24T14:02:21.747' AS DateTime), 1, N'97688613-5d84-47cd-bc2e-87d10525c5c8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (129, 43, N'Quincena', CAST(12230.90 AS Decimal(7, 2)), 2, CAST(N'2023-05-25T19:03:16.560' AS DateTime), 1, N'7440073d-f07b-41cd-a61b-19772029b679')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (130, 43, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-05-25T19:28:06.973' AS DateTime), 1, N'4314521f-34ee-4d46-ae22-4fc61c73a738')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (132, 43, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-05-26T08:08:56.920' AS DateTime), 1, N'771f3ee5-2cae-4b5c-9e79-318d7e2198c3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (133, 43, N'', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-05-26T08:10:33.233' AS DateTime), 1, N'96797b9a-22a4-4df3-aad1-a9567cb497a1')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (134, 43, N'mayo', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-05-26T08:19:05.270' AS DateTime), 1, N'f9b467ac-c0b4-43f4-8bb6-4bf42438d26a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (135, 43, N'natacion', CAST(200.00 AS Decimal(7, 2)), 13, CAST(N'2023-05-26T08:20:53.690' AS DateTime), 1, N'84438128-5009-400d-8b93-80a7bc6f3c64')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (136, 43, N'', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-05-26T08:27:51.043' AS DateTime), 1, N'50086a1d-8dfd-4189-a381-80183decc93c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (137, 43, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-05-26T08:30:29.650' AS DateTime), 1, N'ee5ac990-8ee6-4660-9c1d-a29bd656dd56')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (138, 43, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-05-26T08:31:04.010' AS DateTime), 1, N'282e38f3-dbe1-4c29-aeaf-d110a5e77c3d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (139, 43, N'', CAST(304.83 AS Decimal(7, 2)), 29, CAST(N'2023-05-26T08:34:01.570' AS DateTime), 1, N'08fbad35-dd8d-4f1c-87e8-f254657ba092')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (140, 43, N'', CAST(96.26 AS Decimal(7, 2)), 30, CAST(N'2023-05-26T08:46:22.393' AS DateTime), 1, N'f9056b65-c630-4180-96c3-26d3f8fcb9dd')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (141, 43, N'luz tlami', CAST(900.00 AS Decimal(7, 2)), 36, CAST(N'2023-05-26T08:47:08.630' AS DateTime), 1, N'55dd3303-d719-45e7-a034-229e2aab1566')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (142, 43, N'', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-05-26T08:47:45.420' AS DateTime), 1, N'88f8321d-89bf-4287-9dcc-fc93a683cca9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (143, 43, N'', CAST(192.52 AS Decimal(7, 2)), 22, CAST(N'2023-05-26T08:51:30.267' AS DateTime), 1, N'63af32fc-e04e-4811-a483-b13b53b12402')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (144, 43, N'', CAST(103.09 AS Decimal(7, 2)), 21, CAST(N'2023-05-26T08:52:32.710' AS DateTime), 1, N'848ba1f0-8c18-4492-9efe-72f780a41aac')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (145, 43, N'', CAST(309.29 AS Decimal(7, 2)), 15, CAST(N'2023-05-26T08:54:11.913' AS DateTime), 1, N'fe267858-1aaa-410e-91c4-0e8cc9425fb5')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (146, 43, N'', CAST(320.87 AS Decimal(7, 2)), 14, CAST(N'2023-05-26T08:55:08.323' AS DateTime), 1, N'8e0a3870-5211-4653-a6ed-35a021d4cdd8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (147, 43, N'', CAST(96.26 AS Decimal(7, 2)), 6, CAST(N'2023-05-26T08:56:19.733' AS DateTime), 1, N'e1cb299f-ac4a-41b3-b560-338c530ce680')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (148, 43, N'', CAST(128.35 AS Decimal(7, 2)), 5, CAST(N'2023-05-26T09:03:00.550' AS DateTime), 1, N'595520d3-cf62-4d3b-bb10-721dcbb15eff')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (149, 43, N'', CAST(120.27 AS Decimal(7, 2)), 4, CAST(N'2023-05-26T09:04:10.257' AS DateTime), 1, N'dcc8c6ea-0ac9-47e4-82b6-5e482e6267c6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (150, 43, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-05-26T09:16:56.083' AS DateTime), 1, N'b0bbbc92-273e-40f5-be67-e5112263044f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (151, 43, N'', CAST(103.09 AS Decimal(7, 2)), 35, CAST(N'2023-05-26T09:19:17.140' AS DateTime), 1, N'd1932fe7-bd72-4edf-9b75-811b393d7363')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (152, 43, N'inversion 2839.75', CAST(2839.75 AS Decimal(7, 2)), 11, CAST(N'2023-05-26T09:21:41.813' AS DateTime), 1, N'8c89d390-75c1-416e-be7c-3fc4abbc2d10')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (153, 43, N'Nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-05-29T08:58:28.973' AS DateTime), 1, N'503a205f-fe09-40f3-a0e4-4e95963a880e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (154, 43, N'Cantina', CAST(1000.00 AS Decimal(7, 2)), 26, CAST(N'2023-05-29T08:58:50.177' AS DateTime), 1, N'5b3b6063-d077-4d43-a314-8a94e0e0939b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (155, 43, N'Tianguis', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-05-29T09:02:53.200' AS DateTime), 1, N'e5b93461-eabc-4777-a7d1-8bf28787eb25')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (156, 43, N'semana', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-05-29T09:03:21.183' AS DateTime), 1, N'0b1974fe-2dd1-4e34-9014-e1ed27242bcf')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (157, 43, N'semana', CAST(500.00 AS Decimal(7, 2)), 9, CAST(N'2023-05-29T09:04:29.267' AS DateTime), 1, N'040ce0ab-c571-4927-9c2c-20032027a586')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (158, 43, N'semana', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-05-29T09:05:05.367' AS DateTime), 1, N'57573f1d-f4cd-4b17-a7d3-2ea7a2c2c0f3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (159, 43, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-05-29T09:24:26.897' AS DateTime), 1, N'7a1448ac-7d8c-479c-9358-e5436a318e3b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (160, 43, N'agua', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-05-29T09:42:36.900' AS DateTime), 1, N'b4a2417a-2d68-46d7-8e6a-c413d7cb5dc7')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (161, 43, N'Prueba 2', CAST(100.00 AS Decimal(7, 2)), 20, CAST(N'2023-05-30T14:16:36.567' AS DateTime), 1, N'65da6881-f86e-490d-8187-cb16c81c9e3c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (162, 43, N'Pago Tdc', CAST(850.00 AS Decimal(7, 2)), 7, CAST(N'2023-06-08T12:49:44.190' AS DateTime), 1, N'234cfea7-d456-4b93-aa4d-df81d9fed07a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1162, 45, N'Salario', CAST(12314.03 AS Decimal(7, 2)), 2, CAST(N'2023-06-09T11:30:04.120' AS DateTime), 1, N'e2dbef10-a80f-4d53-bc16-69ee59c104da')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1163, 45, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-06-09T14:54:55.177' AS DateTime), 1, N'e26e2bb9-437c-43b2-8f52-f35f6a81890e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1164, 45, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-06-09T18:47:55.817' AS DateTime), 1, N'58f8b360-f7dd-4248-a1b5-08f16b70837b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1165, 45, N'', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-06-09T18:51:07.880' AS DateTime), 1, N'63a6dd0c-4953-4d66-bd43-3f793f7f4c4c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1166, 45, N'', CAST(400.00 AS Decimal(7, 2)), 36, CAST(N'2023-06-11T09:18:49.997' AS DateTime), 1, N'b3b3d75f-bf9b-4b3a-8c0d-bd99d088952a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1167, 45, N'Junio', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-06-11T09:28:18.453' AS DateTime), 1, N'ed524189-d0fc-4625-9036-17769845483d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1168, 43, N'Star + Disney', CAST(100.00 AS Decimal(7, 2)), 17, CAST(N'2023-06-11T10:00:28.673' AS DateTime), 1, N'96e913b3-980a-4786-83df-9c261b055160')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1169, 33, N'Saldo', CAST(100.00 AS Decimal(7, 2)), 20, CAST(N'2023-06-12T09:58:18.443' AS DateTime), 1, N'c7a401f9-bed7-48d7-9a26-3f805b9ae70c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1170, 45, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-06-12T10:13:08.867' AS DateTime), 1, N'e10a2c73-dcba-4cf3-9332-436ca659cd31')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1171, 45, N'', CAST(360.00 AS Decimal(7, 2)), 14, CAST(N'2023-06-12T10:14:11.060' AS DateTime), 1, N'90498d1b-2f8e-457e-aac2-e04be96df265')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1172, 45, N'', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-06-12T10:15:53.903' AS DateTime), 1, N'08bc382c-27eb-4dc7-9316-ba80cc4631a6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1173, 45, N'', CAST(112.80 AS Decimal(7, 2)), 30, CAST(N'2023-06-12T10:17:39.303' AS DateTime), 1, N'6551ea47-1ef1-4ccc-b71c-1a4ceda8e0de')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1174, 45, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-06-12T10:18:20.297' AS DateTime), 1, N'8ca46fb8-e073-47b4-aabd-a082ccd6470e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1175, 45, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-06-12T10:18:58.153' AS DateTime), 1, N'0e3eeb7d-6ece-4d1f-bf99-58ff1bf0c7fa')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1176, 45, N'', CAST(177.27 AS Decimal(7, 2)), 22, CAST(N'2023-06-12T10:20:29.807' AS DateTime), 1, N'e9a5c3d9-d89e-4317-b251-df894606eaed')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1177, 45, N'', CAST(103.55 AS Decimal(7, 2)), 21, CAST(N'2023-06-12T10:21:43.420' AS DateTime), 1, N'c3ffacfd-6fc8-47b2-8e18-1cfdf40d269d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1178, 45, N'', CAST(325.00 AS Decimal(7, 2)), 15, CAST(N'2023-06-12T10:22:46.060' AS DateTime), 1, N'a49086c0-4471-49c2-9de9-28b6810194b7')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1179, 45, N'', CAST(306.19 AS Decimal(7, 2)), 29, CAST(N'2023-06-12T10:25:14.510' AS DateTime), 1, N'471250b1-bba6-43ea-860d-6746ecf0a67c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1180, 45, N'', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-06-12T10:26:25.250' AS DateTime), 1, N'a5e1380f-06b1-4b38-bb9a-91d11d22ce48')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1181, 45, N'', CAST(96.69 AS Decimal(7, 2)), 6, CAST(N'2023-06-12T10:29:33.937' AS DateTime), 1, N'86c09df8-95db-40e7-83be-e846017922ee')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1182, 45, N'', CAST(103.55 AS Decimal(7, 2)), 35, CAST(N'2023-06-12T10:30:37.150' AS DateTime), 1, N'13964f76-1ad6-4d74-ac66-93dd49541ae1')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1183, 45, N'', CAST(100.00 AS Decimal(7, 2)), 5, CAST(N'2023-06-12T10:32:50.267' AS DateTime), 1, N'db2f1e0c-c662-4a03-ba64-62e4f67c6ed2')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1184, 45, N'', CAST(120.81 AS Decimal(7, 2)), 4, CAST(N'2023-06-12T10:35:16.820' AS DateTime), 1, N'88c32fbb-fa17-4068-bc55-3f1e17a406cd')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1185, 45, N'renta', CAST(2836.34 AS Decimal(7, 2)), 11, CAST(N'2023-06-12T10:39:41.850' AS DateTime), 1, N'48472a4b-29c2-4d14-9f22-efca9588479e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1186, 45, N'agua', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-06-12T14:37:03.860' AS DateTime), 1, N'3f72d3c9-79a1-45b7-902f-82daeec3b061')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1187, 43, N'gas', CAST(250.00 AS Decimal(7, 2)), 16, CAST(N'2023-06-12T14:42:11.713' AS DateTime), 1, N'623ebaf4-72ba-4a9f-a722-1e6bee8ce52e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1188, 45, N'semana 1', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-06-12T14:43:39.190' AS DateTime), 1, N'ea345b92-b99b-4ee7-a8c8-fb9f0ff1b17a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1189, 45, N'semana 2', CAST(500.00 AS Decimal(7, 2)), 9, CAST(N'2023-06-12T14:43:58.753' AS DateTime), 1, N'61e0c4f9-8bbf-4710-b262-3783fc4ad8eb')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1190, 45, N'efectivo', CAST(2260.00 AS Decimal(7, 2)), 41, CAST(N'2023-06-12T14:54:27.947' AS DateTime), 1, N'5986a12c-a818-4cfd-887d-134e4dfa7478')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1191, 45, N'tianguis', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-06-12T14:54:50.047' AS DateTime), 1, N'7b40fee9-7e85-40ab-806c-97e5045d57c7')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1192, 45, N'tianguis', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-06-12T14:55:25.460' AS DateTime), 1, N'e70202d3-ed1b-4c7f-9ac7-4ae79f92e3d5')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1193, 45, N'nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-06-19T08:08:29.443' AS DateTime), 1, N'f82e634d-b36e-4e22-9ba5-be7f76a0c91d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1194, 45, N'Varios', CAST(500.00 AS Decimal(7, 2)), 26, CAST(N'2023-06-19T18:53:56.423' AS DateTime), 1, N'4bc12788-0ac2-46b3-934f-78e5de756727')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1195, 45, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-06-19T18:57:55.267' AS DateTime), 1, N'83f541e7-b1c6-4a2d-bd0c-08db86cefeef')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1196, 45, N'gas', CAST(250.00 AS Decimal(7, 2)), 16, CAST(N'2023-06-19T19:00:09.380' AS DateTime), 1, N'5d328233-5e8b-4206-8737-4e4327a30cf6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1197, 46, N'salario', CAST(12253.60 AS Decimal(7, 2)), 2, CAST(N'2023-06-24T09:50:50.703' AS DateTime), 1, N'a371071d-2d18-414b-9720-471fb1e6876d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1198, 46, N'jinio', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-06-24T09:52:47.820' AS DateTime), 1, N'c3195ca9-e300-446f-85c8-cab505bd734f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1199, 46, N'natacion', CAST(200.00 AS Decimal(7, 2)), 13, CAST(N'2023-06-24T09:53:04.057' AS DateTime), 1, N'05f34cbd-bee3-4b0f-bd87-d62e8c52a886')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1200, 45, N'natacion', CAST(400.00 AS Decimal(7, 2)), 13, CAST(N'2023-06-24T09:56:47.927' AS DateTime), 1, N'7b025575-437a-4ba5-a929-b9785fbadc73')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1201, 46, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-06-24T10:01:13.567' AS DateTime), 1, N'd0dae61a-d41c-4447-8c8d-efbbca67a39d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1202, 46, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-06-24T10:22:51.243' AS DateTime), 1, N'125ed42f-0b59-40c8-b824-a84562889cc8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1203, 46, N'', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-06-24T10:26:16.087' AS DateTime), 1, N'54135021-e48d-406b-ac59-36882158fd1a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1204, 43, N'varios', CAST(600.00 AS Decimal(7, 2)), 41, CAST(N'2023-06-25T08:28:35.470' AS DateTime), 1, N'caf8bef6-513f-4647-bcec-05a09020080e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1205, 46, N'tianguis ', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-06-25T08:37:53.993' AS DateTime), 1, N'b0ea7b5b-3036-4a84-9aca-1672536405c9')
GO
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1206, 46, N'semana', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-06-25T08:39:00.020' AS DateTime), 1, N'f1a73ae2-2e4f-4c50-a93b-cc14d7a3ef89')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1207, 46, N'semana', CAST(500.00 AS Decimal(7, 2)), 9, CAST(N'2023-06-25T08:39:21.280' AS DateTime), 1, N'912fd695-aa0e-472a-8691-1853ab8f6951')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1208, 46, N'gas', CAST(200.00 AS Decimal(7, 2)), 16, CAST(N'2023-06-25T08:49:16.150' AS DateTime), 1, N'a75cdef9-a898-4ee4-be0f-1b677e8c5046')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1209, 46, N'', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-06-25T09:25:42.480' AS DateTime), 1, N'eb2f32b0-4916-41ad-a17e-e4abe8e4083a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1210, 46, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-06-25T09:26:31.833' AS DateTime), 1, N'a6676858-16a5-4f06-9c42-6df25b742533')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1211, 46, N'', CAST(400.00 AS Decimal(7, 2)), 36, CAST(N'2023-06-25T09:27:19.007' AS DateTime), 1, N'd83afc77-5670-4a47-a624-576bb5937ad6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1212, 46, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-06-25T09:28:23.033' AS DateTime), 1, N'18409329-a062-49ff-adbb-0db55fad59ba')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1213, 46, N'', CAST(100.00 AS Decimal(7, 2)), 40, CAST(N'2023-06-25T09:29:56.627' AS DateTime), 1, N'21217180-db12-46cb-8a65-14eeee1471c8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1214, 46, N'', CAST(80.00 AS Decimal(7, 2)), 21, CAST(N'2023-06-26T09:39:00.150' AS DateTime), 1, N'b35861be-b6bf-45f5-927b-f440da6fb53c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1215, 46, N'', CAST(177.92 AS Decimal(7, 2)), 22, CAST(N'2023-06-26T09:45:05.843' AS DateTime), 1, N'560fa416-a252-4363-9c52-139e2142d5d1')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1216, 46, N'', CAST(113.22 AS Decimal(7, 2)), 30, CAST(N'2023-06-26T09:48:15.627' AS DateTime), 1, N'efb8cd26-f497-4730-a5dd-c38ba25296fd')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1217, 46, N'', CAST(311.82 AS Decimal(7, 2)), 15, CAST(N'2023-06-26T09:49:35.743' AS DateTime), 1, N'cc730dbd-fc63-44e2-886a-7098396526bc')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1218, 46, N'', CAST(307.32 AS Decimal(7, 2)), 14, CAST(N'2023-06-26T09:50:22.933' AS DateTime), 1, N'6b9d2b23-8ea2-42d1-a1a3-d8cc4e8f29ce')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1219, 46, N'', CAST(307.32 AS Decimal(7, 2)), 29, CAST(N'2023-06-26T09:51:52.090' AS DateTime), 1, N'1d4ce2a1-93b7-4d1b-809d-4eb179edbbc3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1220, 46, N'', CAST(113.22 AS Decimal(7, 2)), 6, CAST(N'2023-06-26T09:52:56.333' AS DateTime), 1, N'12418a2c-6652-4c73-99e7-407de8cc8867')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1221, 46, N'', CAST(100.00 AS Decimal(7, 2)), 35, CAST(N'2023-06-26T09:54:30.920' AS DateTime), 1, N'3cc4ae7d-647b-4ad1-b24e-a5df971fe1cb')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1222, 46, N'', CAST(97.04 AS Decimal(7, 2)), 5, CAST(N'2023-06-26T10:05:25.960' AS DateTime), 1, N'31101b6e-37d4-481e-984e-980489fb1103')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1223, 46, N'', CAST(121.26 AS Decimal(7, 2)), 4, CAST(N'2023-06-26T10:06:51.470' AS DateTime), 1, N'5d2cc8e1-22e1-4cb1-8bc1-45f54a4f32d3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1224, 46, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-06-26T10:07:46.313' AS DateTime), 1, N'6350a4e8-9255-4638-8f18-15aa7aae575b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1225, 46, N'inversion', CAST(2846.78 AS Decimal(7, 2)), 11, CAST(N'2023-06-26T10:09:04.293' AS DateTime), 1, N'8b56fad6-d5f3-4fc8-b5f6-513f94c20c77')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1226, 46, N'tdc', CAST(850.00 AS Decimal(7, 2)), 7, CAST(N'2023-06-26T10:13:58.917' AS DateTime), 1, N'59cabae2-234b-4ec4-a0b0-a01c2bbf3983')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1227, 46, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-07-05T17:44:31.767' AS DateTime), 1, N'45655b55-78a4-42ed-99d0-8686e3ff54de')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (1228, 46, N'nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-07-05T17:44:57.553' AS DateTime), 1, N'cf287067-ec7e-4b90-9a53-45d16abf38c4')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (2227, 46, N'Hamburguesas, comida doña blanca, otros', CAST(1100.00 AS Decimal(7, 2)), 26, CAST(N'2023-07-08T23:33:24.620' AS DateTime), 1, N'8e016623-58f6-4bb8-b313-73acc4f527a5')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (2228, 46, N'2/07', CAST(100.00 AS Decimal(7, 2)), 20, CAST(N'2023-07-08T23:34:02.580' AS DateTime), 1, N'31284441-631c-40b5-9b48-bc365bcbb8a2')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (2229, 46, N'09/07', CAST(350.00 AS Decimal(7, 2)), 51, CAST(N'2023-07-08T23:34:22.627' AS DateTime), 1, N'2ee0b8b5-5626-48de-9e0e-0d51abb8a4a8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (2230, 46, N'Tienguis 2', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-07-08T23:36:57.493' AS DateTime), 1, N'3af604e2-62eb-45db-87c3-534efbfae954')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3227, 47, N'Salario', CAST(12253.60 AS Decimal(7, 2)), 2, CAST(N'2023-07-10T15:43:48.393' AS DateTime), 1, N'a68c61ab-e98a-474a-839e-7082f65a2916')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3228, 47, N'', CAST(700.00 AS Decimal(7, 2)), 39, CAST(N'2023-07-10T15:51:51.697' AS DateTime), 1, N'11c3641d-50d7-441f-8c39-206963f0bed3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3229, 47, N'', CAST(300.00 AS Decimal(7, 2)), 28, CAST(N'2023-07-10T15:56:57.233' AS DateTime), 1, N'debc9f1f-97f9-40e3-9a83-2606b4643eab')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3230, 47, N'', CAST(500.00 AS Decimal(7, 2)), 27, CAST(N'2023-07-10T15:59:15.393' AS DateTime), 1, N'294efde4-3dda-42a0-999f-5fb385f2ba6a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3231, 47, N'julio', CAST(1500.00 AS Decimal(7, 2)), 19, CAST(N'2023-07-10T16:03:13.217' AS DateTime), 1, N'160564ec-f37c-4879-a879-aac00e1964be')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (3232, 47, N'natacion', CAST(200.00 AS Decimal(7, 2)), 13, CAST(N'2023-07-10T16:04:29.163' AS DateTime), 1, N'a2ffaf74-c2c8-4a3f-bb2f-e3691531eb34')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4227, 47, N'renta', CAST(2800.00 AS Decimal(7, 2)), 11, CAST(N'2023-07-13T15:34:50.550' AS DateTime), 1, N'09687961-f372-412a-9f69-2e9e373917ba')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4228, 47, N'seguro', CAST(75.00 AS Decimal(7, 2)), 10, CAST(N'2023-07-13T15:38:04.030' AS DateTime), 1, N'2f35b42f-eacb-4fe6-8155-2580f268501d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4229, 47, N'400 gas mili, 200 berenjena, 200 mili', CAST(800.00 AS Decimal(7, 2)), 36, CAST(N'2023-07-13T15:39:06.037' AS DateTime), 1, N'05dd2a59-1b18-46c8-9ef9-09cf790ced18')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4230, 47, N'', CAST(200.00 AS Decimal(7, 2)), 34, CAST(N'2023-07-13T15:40:51.897' AS DateTime), 1, N'52e46020-73ca-49e4-8db0-c40f46e383fe')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4231, 47, N'', CAST(113.73 AS Decimal(7, 2)), 30, CAST(N'2023-07-13T15:42:53.347' AS DateTime), 1, N'e2e2220b-111e-487b-9392-3ebe92dd218d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4232, 47, N'', CAST(100.00 AS Decimal(7, 2)), 37, CAST(N'2023-07-13T15:43:48.817' AS DateTime), 1, N'77e599a9-b5e9-4e3c-82b7-267d2256e9ac')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4233, 47, N'', CAST(100.00 AS Decimal(7, 2)), 38, CAST(N'2023-07-13T15:44:22.507' AS DateTime), 1, N'9966047f-8a05-48cb-9817-24d3e9c63a21')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4234, 47, N'', CAST(178.12 AS Decimal(7, 2)), 22, CAST(N'2023-07-13T15:46:15.157' AS DateTime), 1, N'7ec2aece-5c78-494b-b976-ba2466d72ee2')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4235, 47, N'', CAST(104.40 AS Decimal(7, 2)), 21, CAST(N'2023-07-13T15:49:24.083' AS DateTime), 1, N'd4dee83b-6640-4033-ba14-5a9221558d18')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4236, 47, N'', CAST(308.70 AS Decimal(7, 2)), 15, CAST(N'2023-07-13T15:51:56.260' AS DateTime), 1, N'fa352829-78f7-4e8d-a604-c057552a635d')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4237, 47, N'', CAST(308.70 AS Decimal(7, 2)), 14, CAST(N'2023-07-13T15:52:44.417' AS DateTime), 1, N'29072cca-c648-4702-98e1-a7be1058adb6')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4238, 47, N'', CAST(308.70 AS Decimal(7, 2)), 29, CAST(N'2023-07-13T15:54:46.767' AS DateTime), 1, N'cbdafac9-7ee9-4d30-91ac-dcd6e12d988b')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4239, 47, N'', CAST(500.00 AS Decimal(7, 2)), 40, CAST(N'2023-07-13T15:56:04.400' AS DateTime), 1, N'dde249b8-7c3b-4b93-9445-48b7bbf39fa9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4240, 47, N'', CAST(113.73 AS Decimal(7, 2)), 6, CAST(N'2023-07-13T15:58:07.947' AS DateTime), 1, N'df65b7fa-c616-420a-b061-ace488a57e36')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4241, 47, N'', CAST(104.40 AS Decimal(7, 2)), 35, CAST(N'2023-07-13T16:00:10.267' AS DateTime), 1, N'db1a53ed-0c41-4753-8fc1-630b2ba3de4e')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4242, 47, N'tlax', CAST(97.48 AS Decimal(7, 2)), 5, CAST(N'2023-07-13T16:01:10.013' AS DateTime), 1, N'5881e44b-9f36-42b2-acb3-f258faf926a9')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4243, 47, N'', CAST(139.20 AS Decimal(7, 2)), 4, CAST(N'2023-07-13T16:02:40.347' AS DateTime), 1, N'2e0077ea-5cff-4569-a496-75e7f0fc1446')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4244, 47, N'', CAST(500.00 AS Decimal(7, 2)), 31, CAST(N'2023-07-13T16:03:41.357' AS DateTime), 1, N'8edb0f3c-2ca8-4937-95eb-cc10df6f2261')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4245, 47, N'prime ', CAST(100.00 AS Decimal(7, 2)), 17, CAST(N'2023-07-13T16:04:16.613' AS DateTime), 1, N'bfde0bfc-c2ff-4984-af25-b1efc88ac539')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4246, 47, N'pago', CAST(850.00 AS Decimal(7, 2)), 7, CAST(N'2023-07-13T16:14:57.223' AS DateTime), 1, N'4d82ee84-bbc1-481b-9f3f-61d34199dae5')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4247, 47, N'Agua', CAST(100.00 AS Decimal(7, 2)), 23, CAST(N'2023-07-15T20:39:07.990' AS DateTime), 1, N'1528aea4-27f1-4abc-9327-d4c51e53a17c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4248, 47, N'Gas', CAST(200.00 AS Decimal(7, 2)), 16, CAST(N'2023-07-15T20:42:04.630' AS DateTime), 1, N'7e744898-359e-44cf-bc3a-2489e90ec236')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4249, 47, N'300 kick boxing', CAST(350.00 AS Decimal(7, 2)), 51, CAST(N'2023-07-15T20:44:33.750' AS DateTime), 1, N'b3d85fce-a61b-4f34-803d-d03ade2d4af8')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4250, 47, N'semana', CAST(500.00 AS Decimal(7, 2)), 9, CAST(N'2023-07-15T20:45:30.130' AS DateTime), 1, N'aab34739-5412-4ec0-a32f-d135e3e5d6f3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4251, 47, N'semana 1', CAST(500.00 AS Decimal(7, 2)), 8, CAST(N'2023-07-15T20:49:49.077' AS DateTime), 1, N'553bf177-7310-4395-8ee7-7da78d55f396')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4252, 47, N'transporte', CAST(300.00 AS Decimal(7, 2)), 52, CAST(N'2023-07-15T20:52:06.040' AS DateTime), 1, N'707a0f4b-e3fa-4b69-9de4-0cdf7a956818')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4253, 47, N'Nancy', CAST(3000.00 AS Decimal(7, 2)), 3, CAST(N'2023-07-15T20:54:14.493' AS DateTime), 1, N'935a683b-86eb-4be3-9bb5-ae70d4875b8f')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4254, 47, N'tianguis 2', CAST(500.00 AS Decimal(7, 2)), 25, CAST(N'2023-07-15T23:52:24.977' AS DateTime), 1, N'3bb67c74-d3db-4425-904a-98a764c2ef3c')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4255, 47, N'Tianguis 1', CAST(500.00 AS Decimal(7, 2)), 24, CAST(N'2023-07-15T23:52:34.423' AS DateTime), 1, N'b2e31f9d-cce9-437b-8045-b9d43ac60de3')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4256, 47, N'En efectivo', CAST(500.00 AS Decimal(7, 2)), 26, CAST(N'2023-07-15T23:53:43.750' AS DateTime), 1, N'f1635353-95d5-452e-9dd9-1463bb628e7a')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4257, 47, N'comidin', CAST(0.00 AS Decimal(7, 2)), 41, CAST(N'2023-07-16T00:00:55.290' AS DateTime), 1, N'37aa4245-7ad1-4f5a-b7f8-4468f87f7889')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4258, 47, N'', CAST(500.00 AS Decimal(7, 2)), 42, CAST(N'2023-07-17T22:15:39.727' AS DateTime), 1, N'5fea18f2-ab4b-4e9c-8156-5bc391b30135')
INSERT [dbo].[Gasto] ([Id], [PeriodoId], [Nombre], [Cantidad], [SubcategoriaId], [FechaDeRegistro], [EstaActivo], [Guid]) VALUES (4259, 47, N'Paseo cicista', CAST(100.00 AS Decimal(7, 2)), 20, CAST(N'2023-07-17T22:16:09.040' AS DateTime), 1, N'13d0c433-e343-417c-9373-99a49c3ff627')
SET IDENTITY_INSERT [dbo].[Gasto] OFF
GO
SET IDENTITY_INSERT [dbo].[HttpContext] ON 

INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1, N'Museums', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:26:49.3966805' AS DateTime2), CAST(N'2023-07-17T17:26:51.6073051' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (2, N'Museums', N'/Compras', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Compras</h1>

<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">27473.00</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">2134</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
            <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">9416</h1>
            <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->


<p>
    <a href="/Compras/Create">Agregar nuevo</a>
</p>
<table class="table">
    <thead>
        <tr>
            <th>
                Id
            </th>
            <th>
                No de pago
            </th>
            <th>
                Corte
            </th>
            <th>
                Pago
            </th>
            <th>
                Fecha de pago
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nota
            </th>
            <th>
                MSI
            </th>
            <th>
                Precio
            </th>
            <th>
                Fecha
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody>
            <tr>
                <td>
                    2
                </td>
                <td>
                    11
                </td>
                <td>
                    03/09/2022
                </td>
                <td>
                    $317.00
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Tablet
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $3,804.00
                </td>
                <td>
                    22/08/2022
                </td>
                <td>
                    <a href="/Compras/Edit/2">Editar</a> |
                    <a href="/Compras/Details/2">Detalles</a> |
                    <a href="/Compras/Delete/2">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    5
                </td>
                <td>
                    03/03/2023
                </td>
                <td>
                    $499.17
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Escritorio ajustable
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $5,990.00
                </td>
                <td>
                    01/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/4">Editar</a> |
                    <a href="/Compras/Details/4">Detalles</a> |
                    <a href="/Compras/Delete/4">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    4
                </td>
                <td>
                    03/04/2023
                </td>
                <td>
                    $716.50
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Bocina Electra
                </td>
                <td>
                    Moises
                </td>
                <td>
                    6
                </td>
                <td>
                    $4,299.00
                </td>
                <td>
                    19/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/5">Editar</a> |
                    <a href="/Compras/Details/5">Detalles</a> |
                    <a href="/Compras/Delete/5">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    12
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $324.83
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Kindle
                </td>
                <td>
                    
                </td>
                <td>
                    6
                </td>
                <td>
                    $1,949.00
                </td>
                <td>
                    14/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/12">Editar</a> |
                    <a href="/Compras/Details/12">Detalles</a> |
                    <a href="/Compras/Delete/12">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    13
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $276.60
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Bici
                </td>
                <td>
                    
                </td>
                <td>
                    15
                </td>
                <td>
                    $4,149.00
                </td>
                <td>
                    15/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/13">Editar</a> |
                    <a href="/Compras/Details/13">Detalles</a> |
                    <a href="/Compras/Delete/13">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    14
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Saldo restante
                </td>
                <td>
                    
                </td>
                <td>
                    1
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    17/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/14">Editar</a> |
                    <a href="/Compras/Details/14">Detalles</a> |
                    <a href="/Compras/Delete/14">Delete</a>
                </td>
            </tr>
    </tbody>
</table>

        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:27:39.0826677' AS DateTime2), CAST(N'2023-07-17T17:27:39.2349055' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (3, N'Museums', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:31:09.8596838' AS DateTime2), CAST(N'2023-07-17T17:31:12.0084287' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (4, N'Museums', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:31:42.8931395' AS DateTime2), CAST(N'2023-07-17T17:31:45.0291132' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (5, N'Gastos', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:32:50.5557227' AS DateTime2), CAST(N'2023-07-17T17:32:52.6385592' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (6, N'Gastos', N'/Compras', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Compras</h1>

<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">27473.00</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">2134</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
            <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">9416</h1>
            <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->


<p>
    <a href="/Compras/Create">Agregar nuevo</a>
</p>
<table class="table">
    <thead>
        <tr>
            <th>
                Id
            </th>
            <th>
                No de pago
            </th>
            <th>
                Corte
            </th>
            <th>
                Pago
            </th>
            <th>
                Fecha de pago
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nota
            </th>
            <th>
                MSI
            </th>
            <th>
                Precio
            </th>
            <th>
                Fecha
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody>
            <tr>
                <td>
                    2
                </td>
                <td>
                    11
                </td>
                <td>
                    03/09/2022
                </td>
                <td>
                    $317.00
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Tablet
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $3,804.00
                </td>
                <td>
                    22/08/2022
                </td>
                <td>
                    <a href="/Compras/Edit/2">Editar</a> |
                    <a href="/Compras/Details/2">Detalles</a> |
                    <a href="/Compras/Delete/2">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    5
                </td>
                <td>
                    03/03/2023
                </td>
                <td>
                    $499.17
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Escritorio ajustable
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $5,990.00
                </td>
                <td>
                    01/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/4">Editar</a> |
                    <a href="/Compras/Details/4">Detalles</a> |
                    <a href="/Compras/Delete/4">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    4
                </td>
                <td>
                    03/04/2023
                </td>
                <td>
                    $716.50
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Bocina Electra
                </td>
                <td>
                    Moises
                </td>
                <td>
                    6
                </td>
                <td>
                    $4,299.00
                </td>
                <td>
                    19/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/5">Editar</a> |
                    <a href="/Compras/Details/5">Detalles</a> |
                    <a href="/Compras/Delete/5">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    12
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $324.83
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Kindle
                </td>
                <td>
                    
                </td>
                <td>
                    6
                </td>
                <td>
                    $1,949.00
                </td>
                <td>
                    14/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/12">Editar</a> |
                    <a href="/Compras/Details/12">Detalles</a> |
                    <a href="/Compras/Delete/12">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    13
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $276.60
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Bici
                </td>
                <td>
                    
                </td>
                <td>
                    15
                </td>
                <td>
                    $4,149.00
                </td>
                <td>
                    15/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/13">Editar</a> |
                    <a href="/Compras/Details/13">Detalles</a> |
                    <a href="/Compras/Delete/13">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    14
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Saldo restante
                </td>
                <td>
                    
                </td>
                <td>
                    1
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    17/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/14">Editar</a> |
                    <a href="/Compras/Details/14">Detalles</a> |
                    <a href="/Compras/Delete/14">Delete</a>
                </td>
            </tr>
    </tbody>
</table>

        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:33:01.3369178' AS DateTime2), CAST(N'2023-07-17T17:33:01.4959023' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (7, N'Gastos', N'/Compras/Delete/2', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{}', N'', CAST(N'2023-07-17T17:33:10.0160749' AS DateTime2), CAST(N'2023-07-17T17:33:10.0176715' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (8, N'Gastos', N'/Compras/Delete/2', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cache-Control":"max-age=0","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{}', N'', CAST(N'2023-07-17T17:33:12.6856851' AS DateTime2), CAST(N'2023-07-17T17:33:12.6864732' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (9, N'Gastos', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:34:31.1490983' AS DateTime2), CAST(N'2023-07-17T17:34:33.3090073' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (10, N'Gastos', N'/Compras', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Compras</h1>

<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">27473.00</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">2134</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
            <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">9416</h1>
            <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->


<p>
    <a href="/Compras/Create">Agregar nuevo</a>
</p>
<table class="table">
    <thead>
        <tr>
            <th>
                Id
            </th>
            <th>
                No de pago
            </th>
            <th>
                Corte
            </th>
            <th>
                Pago
            </th>
            <th>
                Fecha de pago
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nota
            </th>
            <th>
                MSI
            </th>
            <th>
                Precio
            </th>
            <th>
                Fecha
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody>
            <tr>
                <td>
                    2
                </td>
                <td>
                    11
                </td>
                <td>
                    03/09/2022
                </td>
                <td>
                    $317.00
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Tablet
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $3,804.00
                </td>
                <td>
                    22/08/2022
                </td>
                <td>
                    <a href="/Compras/Edit/2">Editar</a> |
                    <a href="/Compras/Details/2">Detalles</a> |
                    <a href="/Compras/Delete/2">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    5
                </td>
                <td>
                    03/03/2023
                </td>
                <td>
                    $499.17
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Escritorio ajustable
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $5,990.00
                </td>
                <td>
                    01/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/4">Editar</a> |
                    <a href="/Compras/Details/4">Detalles</a> |
                    <a href="/Compras/Delete/4">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    4
                </td>
                <td>
                    03/04/2023
                </td>
                <td>
                    $716.50
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Bocina Electra
                </td>
                <td>
                    Moises
                </td>
                <td>
                    6
                </td>
                <td>
                    $4,299.00
                </td>
                <td>
                    19/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/5">Editar</a> |
                    <a href="/Compras/Details/5">Detalles</a> |
                    <a href="/Compras/Delete/5">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    12
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $324.83
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Kindle
                </td>
                <td>
                    
                </td>
                <td>
                    6
                </td>
                <td>
                    $1,949.00
                </td>
                <td>
                    14/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/12">Editar</a> |
                    <a href="/Compras/Details/12">Detalles</a> |
                    <a href="/Compras/Delete/12">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    13
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $276.60
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Bici
                </td>
                <td>
                    
                </td>
                <td>
                    15
                </td>
                <td>
                    $4,149.00
                </td>
                <td>
                    15/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/13">Editar</a> |
                    <a href="/Compras/Details/13">Detalles</a> |
                    <a href="/Compras/Delete/13">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    14
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Saldo restante
                </td>
                <td>
                    
                </td>
                <td>
                    1
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    17/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/14">Editar</a> |
                    <a href="/Compras/Details/14">Detalles</a> |
                    <a href="/Compras/Delete/14">Delete</a>
                </td>
            </tr>
    </tbody>
</table>

        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:35:00.3433863' AS DateTime2), CAST(N'2023-07-17T17:35:00.5020638' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (11, N'Gastos', N'/Compras/Edit/14', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8","Cache-Control":"no-cache, no-store","Pragma":"no-cache"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Edita</h1>

<h4>Compra</h4>
<hr />
<div class="row">
    <div class="col-md-4">
        <form action="/Compras/Edit/14" method="post">
            
            
            <div class="form-group">
                <label class="control-label" for="Nombre">Nombre</label>
                <input class="form-control" type="text" data-val="true" data-val-length="The field Nombre must be a string with a maximum length of 20." data-val-length-max="20" data-val-required="El nombre es requerido" id="Nombre" maxlength="20" name="Nombre" value="Saldo restante" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Nombre" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="Nota">Nota</label>
                <input class="form-control" type="text" data-val="true" data-val-length="The field Nota must be a string with a maximum length of 255." data-val-length-max="255" id="Nota" maxlength="255" name="Nota" value="" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Nota" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="MesesSinIntereses">MSI</label>
                <input class="form-control" type="number" data-val="true" data-val-range="The field MSI must be between 1 and 18." data-val-range-max="18" data-val-range-min="1" data-val-required="The MSI field is required." id="MesesSinIntereses" name="MesesSinIntereses" value="1" />
                <span class="text-danger field-validation-valid" data-valmsg-for="MesesSinIntereses" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="Cantidad">Precio</label>
                <input class="form-control" type="text" data-val="true" data-val-number="The field Precio must be a number." data-val-required="El precio es requerido" id="Cantidad" name="Cantidad" value="7282.00" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Cantidad" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="TdcId">TdcId</label>
                <input class="form-control" type="number" data-val="true" data-val-required="The TdcId field is required." id="TdcId" name="TdcId" value="1" />
                <span class="text-danger field-validation-valid" data-valmsg-for="TdcId" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="FechaDeRegistro">Fecha</label>
                <input class="form-control" type="date" data-val="true" data-val-required="The Fecha field is required." id="FechaDeRegistro" name="FechaDeRegistro" value="2023-07-17" />
                <span class="text-danger field-validation-valid" data-valmsg-for="FechaDeRegistro" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group mt-3">
                <input type="submit" value="Guardar" class="btn btn-primary" />
            </div>
        <input name="__RequestVerificationToken" type="hidden" value="CfDJ8Dk-xe_U9gpGtY_gtLeyGMciQVC1pe2Fd6m2UTVyl4ozZn7YlCEs3aEDK0l6LfHaAue9wS8Es9TgvfVStqVaspzvPgOKBsgKEccxeKLXEQL3NnLqmwRh2TxWYIJTsiOGhXmeLpCeTXTFOJ7RWHGTzXg" /></form>
    </div>
</div>

<div>
    <a href="/Compras">Regresar a la lista</a>
</div>


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
<script src="/lib/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js"></script>

</body>
</html>
', CAST(N'2023-07-17T17:35:08.7262665' AS DateTime2), CAST(N'2023-07-17T17:35:08.8141648' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (12, N'Gastos', N'/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras/Edit/14","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{}', N'', CAST(N'2023-07-17T17:35:11.0648634' AS DateTime2), CAST(N'2023-07-17T17:35:11.0657345' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (13, N'Gastos', N'/Compras/Edit/img/icon-1.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras/Edit/14","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{}', N'', CAST(N'2023-07-17T17:35:25.8923502' AS DateTime2), CAST(N'2023-07-17T17:35:25.9145090' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (14, N'Gastos', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:40:19.4399263' AS DateTime2), CAST(N'2023-07-17T17:40:21.5615090' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (15, N'Gastos', N'/Compras', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Compras</h1>

<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">27473.00</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">2134</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
            <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">9416</h1>
            <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->


<p>
    <a href="/Compras/Create">Agregar nuevo</a>
</p>
<table class="table">
    <thead>
        <tr>
            <th>
                Id
            </th>
            <th>
                No de pago
            </th>
            <th>
                Corte
            </th>
            <th>
                Pago
            </th>
            <th>
                Fecha de pago
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nota
            </th>
            <th>
                MSI
            </th>
            <th>
                Precio
            </th>
            <th>
                Fecha
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody>
            <tr>
                <td>
                    2
                </td>
                <td>
                    11
                </td>
                <td>
                    03/09/2022
                </td>
                <td>
                    $317.00
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Tablet
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $3,804.00
                </td>
                <td>
                    22/08/2022
                </td>
                <td>
                    <a href="/Compras/Edit/2">Editar</a> |
                    <a href="/Compras/Details/2">Detalles</a> |
                    <a href="/Compras/Delete/2">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    5
                </td>
                <td>
                    03/03/2023
                </td>
                <td>
                    $499.17
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Escritorio ajustable
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $5,990.00
                </td>
                <td>
                    01/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/4">Editar</a> |
                    <a href="/Compras/Details/4">Detalles</a> |
                    <a href="/Compras/Delete/4">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    4
                </td>
                <td>
                    03/04/2023
                </td>
                <td>
                    $716.50
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Bocina Electra
                </td>
                <td>
                    Moises
                </td>
                <td>
                    6
                </td>
                <td>
                    $4,299.00
                </td>
                <td>
                    19/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/5">Editar</a> |
                    <a href="/Compras/Details/5">Detalles</a> |
                    <a href="/Compras/Delete/5">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    12
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $324.83
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Kindle
                </td>
                <td>
                    
                </td>
                <td>
                    6
                </td>
                <td>
                    $1,949.00
                </td>
                <td>
                    14/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/12">Editar</a> |
                    <a href="/Compras/Details/12">Detalles</a> |
                    <a href="/Compras/Delete/12">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    13
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $276.60
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Bici
                </td>
                <td>
                    
                </td>
                <td>
                    15
                </td>
                <td>
                    $4,149.00
                </td>
                <td>
                    15/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/13">Editar</a> |
                    <a href="/Compras/Details/13">Detalles</a> |
                    <a href="/Compras/Delete/13">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    14
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Saldo restante
                </td>
                <td>
                    
                </td>
                <td>
                    1
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    17/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/14">Editar</a> |
                    <a href="/Compras/Details/14">Detalles</a> |
                    <a href="/Compras/Delete/14">Delete</a>
                </td>
            </tr>
    </tbody>
</table>

        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:40:26.8304119' AS DateTime2), CAST(N'2023-07-17T17:40:26.9921410' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (16, N'Gastos', N'/Compras/Edit/14', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8","Cache-Control":"no-cache, no-store","Pragma":"no-cache"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Edita</h1>

<h4>Compra</h4>
<hr />
<div class="row">
    <div class="col-md-4">
        <form action="/Compras/Edit/14" method="post">
            
            
            <div class="form-group">
                <label class="control-label" for="Nombre">Nombre</label>
                <input class="form-control" type="text" data-val="true" data-val-length="The field Nombre must be a string with a maximum length of 20." data-val-length-max="20" data-val-required="El nombre es requerido" id="Nombre" maxlength="20" name="Nombre" value="Saldo restante" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Nombre" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="Nota">Nota</label>
                <input class="form-control" type="text" data-val="true" data-val-length="The field Nota must be a string with a maximum length of 255." data-val-length-max="255" id="Nota" maxlength="255" name="Nota" value="" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Nota" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="MesesSinIntereses">MSI</label>
                <input class="form-control" type="number" data-val="true" data-val-range="The field MSI must be between 1 and 18." data-val-range-max="18" data-val-range-min="1" data-val-required="The MSI field is required." id="MesesSinIntereses" name="MesesSinIntereses" value="1" />
                <span class="text-danger field-validation-valid" data-valmsg-for="MesesSinIntereses" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="Cantidad">Precio</label>
                <input class="form-control" type="text" data-val="true" data-val-number="The field Precio must be a number." data-val-required="El precio es requerido" id="Cantidad" name="Cantidad" value="7282.00" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Cantidad" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="TdcId">TdcId</label>
                <input class="form-control" type="number" data-val="true" data-val-required="The TdcId field is required." id="TdcId" name="TdcId" value="1" />
                <span class="text-danger field-validation-valid" data-valmsg-for="TdcId" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="FechaDeRegistro">Fecha</label>
                <input class="form-control" type="date" data-val="true" data-val-required="The Fecha field is required." id="FechaDeRegistro" name="FechaDeRegistro" value="2023-07-17" />
                <span class="text-danger field-validation-valid" data-valmsg-for="FechaDeRegistro" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group mt-3">
                <input type="submit" value="Guardar" class="btn btn-primary" />
            </div>
        <input name="__RequestVerificationToken" type="hidden" value="CfDJ8Dk-xe_U9gpGtY_gtLeyGMeFOkQOa27RUBgAu0q9B_ECzgBAm1-oKba3QvHJQIAuCq6XA3eX5ADSahECVzuZUaymVdhd-_4YksWDM9ivIackqJ2WP-ECtCOTh6k01lnZvKhW2F0JkgN8OPhi9LJQYPU" /></form>
    </div>
</div>

<div>
    <a href="/Compras">Regresar a la lista</a>
</div>


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
<script src="/lib/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js"></script>

</body>
</html>
', CAST(N'2023-07-17T17:40:32.0784821' AS DateTime2), CAST(N'2023-07-17T17:40:32.1685198' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (17, N'Gastos', N'/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras/Edit/14","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{}', N'', CAST(N'2023-07-17T17:40:33.9198378' AS DateTime2), CAST(N'2023-07-17T17:40:33.9201838' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (18, N'Gastos', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:51:25.7153691' AS DateTime2), CAST(N'2023-07-17T17:51:27.8099039' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (19, N'Gastos', N'/dont/exist', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{}', N'', CAST(N'2023-07-17T17:51:36.5848317' AS DateTime2), CAST(N'2023-07-17T17:51:36.5869769' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (20, N'Gastos', N'/Compras', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Compras</h1>

<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">27473.00</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">2134</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
            <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">9416</h1>
            <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->


<p>
    <a href="/Compras/Create">Agregar nuevo</a>
</p>
<table class="table">
    <thead>
        <tr>
            <th>
                Id
            </th>
            <th>
                No de pago
            </th>
            <th>
                Corte
            </th>
            <th>
                Pago
            </th>
            <th>
                Fecha de pago
            </th>
            <th>
                Nombre
            </th>
            <th>
                Nota
            </th>
            <th>
                MSI
            </th>
            <th>
                Precio
            </th>
            <th>
                Fecha
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody>
            <tr>
                <td>
                    2
                </td>
                <td>
                    11
                </td>
                <td>
                    03/09/2022
                </td>
                <td>
                    $317.00
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Tablet
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $3,804.00
                </td>
                <td>
                    22/08/2022
                </td>
                <td>
                    <a href="/Compras/Edit/2">Editar</a> |
                    <a href="/Compras/Details/2">Detalles</a> |
                    <a href="/Compras/Delete/2">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    4
                </td>
                <td>
                    5
                </td>
                <td>
                    03/03/2023
                </td>
                <td>
                    $499.17
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Escritorio ajustable
                </td>
                <td>
                    
                </td>
                <td>
                    12
                </td>
                <td>
                    $5,990.00
                </td>
                <td>
                    01/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/4">Editar</a> |
                    <a href="/Compras/Details/4">Detalles</a> |
                    <a href="/Compras/Delete/4">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    5
                </td>
                <td>
                    4
                </td>
                <td>
                    03/04/2023
                </td>
                <td>
                    $716.50
                </td>
                <td>
                    23/07/2023
                </td>
                <td>
                    Bocina Electra
                </td>
                <td>
                    Moises
                </td>
                <td>
                    6
                </td>
                <td>
                    $4,299.00
                </td>
                <td>
                    19/03/2023
                </td>
                <td>
                    <a href="/Compras/Edit/5">Editar</a> |
                    <a href="/Compras/Details/5">Detalles</a> |
                    <a href="/Compras/Delete/5">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    12
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $324.83
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Kindle
                </td>
                <td>
                    
                </td>
                <td>
                    6
                </td>
                <td>
                    $1,949.00
                </td>
                <td>
                    14/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/12">Editar</a> |
                    <a href="/Compras/Details/12">Detalles</a> |
                    <a href="/Compras/Delete/12">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    13
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $276.60
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Bici
                </td>
                <td>
                    
                </td>
                <td>
                    15
                </td>
                <td>
                    $4,149.00
                </td>
                <td>
                    15/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/13">Editar</a> |
                    <a href="/Compras/Details/13">Detalles</a> |
                    <a href="/Compras/Delete/13">Delete</a>
                </td>
            </tr>
            <tr>
                <td>
                    14
                </td>
                <td>
                    0
                </td>
                <td>
                    03/08/2023
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    23/08/2023
                </td>
                <td>
                    Saldo restante
                </td>
                <td>
                    
                </td>
                <td>
                    1
                </td>
                <td>
                    $7,282.00
                </td>
                <td>
                    17/07/2023
                </td>
                <td>
                    <a href="/Compras/Edit/14">Editar</a> |
                    <a href="/Compras/Details/14">Detalles</a> |
                    <a href="/Compras/Delete/14">Delete</a>
                </td>
            </tr>
    </tbody>
</table>

        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-17T17:51:41.0097841' AS DateTime2), CAST(N'2023-07-17T17:51:41.1721158' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (21, N'Gastos', N'/Compras/Edit/13', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8","Cache-Control":"no-cache, no-store","Pragma":"no-cache"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link active" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            

<h1>Edita</h1>

<h4>Compra</h4>
<hr />
<div class="row">
    <div class="col-md-4">
        <form action="/Compras/Edit/13" method="post">
            
            
            <div class="form-group">
                <label class="control-label" for="Nombre">Nombre</label>
                <input class="form-control" type="text" data-val="true" data-val-length="The field Nombre must be a string with a maximum length of 20." data-val-length-max="20" data-val-required="El nombre es requerido" id="Nombre" maxlength="20" name="Nombre" value="Bici" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Nombre" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="Nota">Nota</label>
                <input class="form-control" type="text" data-val="true" data-val-length="The field Nota must be a string with a maximum length of 255." data-val-length-max="255" id="Nota" maxlength="255" name="Nota" value="" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Nota" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="MesesSinIntereses">MSI</label>
                <input class="form-control" type="number" data-val="true" data-val-range="The field MSI must be between 1 and 18." data-val-range-max="18" data-val-range-min="1" data-val-required="The MSI field is required." id="MesesSinIntereses" name="MesesSinIntereses" value="15" />
                <span class="text-danger field-validation-valid" data-valmsg-for="MesesSinIntereses" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="Cantidad">Precio</label>
                <input class="form-control" type="text" data-val="true" data-val-number="The field Precio must be a number." data-val-required="El precio es requerido" id="Cantidad" name="Cantidad" value="4149.00" />
                <span class="text-danger field-validation-valid" data-valmsg-for="Cantidad" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="TdcId">TdcId</label>
                <input class="form-control" type="number" data-val="true" data-val-required="The TdcId field is required." id="TdcId" name="TdcId" value="1" />
                <span class="text-danger field-validation-valid" data-valmsg-for="TdcId" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group">
                <label class="control-label" for="FechaDeRegistro">Fecha</label>
                <input class="form-control" type="date" data-val="true" data-val-required="The Fecha field is required." id="FechaDeRegistro" name="FechaDeRegistro" value="2023-07-15" />
                <span class="text-danger field-validation-valid" data-valmsg-for="FechaDeRegistro" data-valmsg-replace="true"></span>
            </div>
            <div class="form-group mt-3">
                <input type="submit" value="Guardar" class="btn btn-primary" />
            </div>
        <input name="__RequestVerificationToken" type="hidden" value="CfDJ8Dk-xe_U9gpGtY_gtLeyGMeRHrDc6xTy3orXHnYnCb5AWgzh4eOL6n0UQPCfT8_YchkDyDnNjAPW49_S3XFZYyLZTfct8XXhUvNIJ42JM53i0y-4itqwUBBEu9mfcynJt5t-WSjojPGwLJB8auscF6c" /></form>
    </div>
</div>

<div>
    <a href="/Compras">Regresar a la lista</a>
</div>


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
<script src="/lib/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js"></script>

</body>
</html>
', CAST(N'2023-07-17T17:51:44.4371773' AS DateTime2), CAST(N'2023-07-17T17:51:44.5219986' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (22, N'Gastos', N'/lib/jquery-validation/dist/jquery.validate.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras/Edit/13","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{}', N'', CAST(N'2023-07-17T17:51:44.5585874' AS DateTime2), CAST(N'2023-07-17T17:51:44.5602994' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (23, N'Gastos', N'/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Cookie":".AspNetCore.Antiforgery.lU0G_DWPqL8=CfDJ8Dk-xe_U9gpGtY_gtLeyGMcHjhATmQNlpoaBQA0ddaBr9jydBZS-U1UeTo7-3voxvGw5d2NvipjUw8CCBL-h6mOfguutpRPSMKMYJAyWJjPLBn1KeRLG1fVrdmXxLJv7WkdJOBVrh_d3s6hidN1Sdcc",".AspNetCore.Antiforgery.2HQL-fjSEYw=CfDJ8GPo1orlGzZEgmdRh92W1N3K7Tao6pTaScuoCCqtM6fY8ndVreFbvooHYiZtw7JnkoODFHr4X7hBfY747E9jXg45zrGBVNuMIRbjCkZIV7OFJWz1LaeTLfojouGYBWjlhvYCMc8kFSLC-AYicLVVBlE","Referer":"https://localhost:7065/Compras/Edit/13","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{}', N'', CAST(N'2023-07-17T17:51:44.5591597' AS DateTime2), CAST(N'2023-07-17T17:51:44.5603009' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1002, N'Gastos', N'/', N'GET', N'{"Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Upgrade-Insecure-Requests":"1","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"none","sec-fetch-mode":"navigate","sec-fetch-user":"?1","sec-fetch-dest":"document"}', N'', N'{"Content-Type":"text/html; charset=utf-8"}', N'<!DOCTYPE html>
<html lang="es-mx">
<head>
    <meta charset="utf-8">
    <title>Gastos</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- Datatables-->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div b-gtch0rhbok id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div b-gtch0rhbok class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->
    <!-- Navbar Start -->
    <nav b-gtch0rhbok class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <h2 b-gtch0rhbok class="m-0 text-primary">
                <img b-gtch0rhbok class="img-fluid me-2" src="img/icon-1.png" alt=""
                     style="width: 45px;">Gastos
            </h2>
        </a>
        <button b-gtch0rhbok type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span b-gtch0rhbok class="navbar-toggler-icon"></span>
        </button>
        <div b-gtch0rhbok class="collapse navbar-collapse" id="navbarCollapse">
            <div b-gtch0rhbok class="navbar-nav ms-auto py-4 py-lg-0">
                    <a class="nav-item nav-link active" href="/">Home</a>
                    <a class="nav-item nav-link" href="/Periodos">Periodos</a>
                    <a class="nav-item nav-link" href="/Subcategorias">Subcategorias</a>
                    <a class="nav-item nav-link" href="/Apartados">Apartados</a>
                    <a class="nav-item nav-link" href="/Compras">Compras</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <div b-gtch0rhbok class="container">
        <main b-gtch0rhbok role="main" class="pb-3">
            
<!-- About Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="row g-5 align-items-center">
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid" src="img/about.png" alt="">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.5s">
                <div class="h-100">
                    <h1 class="display-6">Periodo</h1>
                    <p class="text-primary fs-5 mb-4">Julio 10</p>

                    <a class="btn btn-primary py-3 px-4" href="/Gastos?periodoId=47">Ver más</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->
<!-- Facts Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.1s">
                <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">15253.60</h1>
                <p class="fs-5 text-primary mb-0">Cantidad inicial</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.3s">
                <img class="img-fluid mb-4" src="img/icon-10.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">14743.46</h1>
                <p class="fs-5 text-primary mb-0">Cantidad final</p>
            </div>
            <div class="col-lg-4 col-md-6 text-center wow fadeIn" data-wow-delay="0.5s">
                <img class="img-fluid mb-4" src="img/icon-2.png" alt="">
                <h1 class="display-4" data-toggle="counter-up">510.14</h1>
                <p class="fs-5 text-primary mb-0">Total</p>
            </div>
        </div>
    </div>
</div>
<!-- Facts End -->

<!-- Service Start -->
<div class="container-xxl bg-light py-5 my-5">
    <div class="container py-5">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Items</h1>
            <p class="text-primary fs-5 mb-5">Otros items</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-7.png" alt="">
                    <h5 class="mb-3">Subcategorias</h5>
                    <p>
                        Presupuestos de entradas, apartados y gastos
                    </p>
                    <a href="/Subcategorias">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="service-item bg-white p-5">
                    <img class="img-fluid mb-4" src="img/icon-9.png" alt="">
                    <h5 class="mb-3">Apartados</h5>
                    <p>
                        Ahorros plazo fijo, ahorros e Inversiones
                    </p>
                    <a href="/Apartados">Read More <i class="fa fa-arrow-right ms-2"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Roadmap Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
            <h1 class="display-6">Periodos</h1>
            <p class="text-primary fs-5 mb-5">
                <a href="/Home/Create">Agregar nuevo</a>
            </p>
        </div>
        <div class="owl-carousel roadmap-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Marzo 25</h5>
                    <span>
                        s&#xE1;bado, 25 de marzo de 2023 / lunes, 10 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=1">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/1">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/1">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 10</h5>
                    <span>
                        lunes, 10 de abril de 2023 / martes, 25 de abril de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=2">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/2">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/2">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Abril 25</h5>
                    <span>
                        martes, 25 de abril de 2023 / mi&#xE9;rcoles, 10 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=4">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/4">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/4">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 10</h5>
                    <span>
                        mi&#xE9;rcoles, 10 de mayo de 2023 / jueves, 25 de mayo de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=33">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/33">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/33">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Mayo 25</h5>
                    <span>
                        jueves, 25 de mayo de 2023 / s&#xE1;bado, 10 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=43">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/43">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/43">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Junio 10</h5>
                    <span>
                        viernes, 9 de junio de 2023 / domingo, 25 de junio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=45">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/45">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/45">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>junio 25</h5>
                    <span>
                        domingo, 25 de junio de 2023 / lunes, 10 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=46">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/46">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/46">Borrar</a>
                    </span>

                </div>
                <div class="roadmap-item">
                    <div class="roadmap-point"><span></span></div>
                    <h5>Julio 10</h5>
                    <span>
                        lunes, 10 de julio de 2023 / martes, 25 de julio de 2023
                    </span>
                    <span>
                        <a href="/Gastos?periodoId=47">Detalles</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Edit/47">Editar</a>
                    </span>/
                    <span>
                        <a href="/Periodos/Delete/47">Borrar</a>
                    </span>

                </div>
        </div>
    </div>
</div>
<!-- Roadmap End -->


        </main>
    </div>

    <!-- Footer Start -->
    <div b-gtch0rhbok class="container-fluid bg-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
<div b-gtch0rhbok class="container-fluid copyright">
            <div b-gtch0rhbok class="container">
                <div b-gtch0rhbok class="row">
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a b-gtch0rhbok href="#">Gastos</a>, Víctor Mtz
                    </div>
                    <div b-gtch0rhbok class="col-md-6 text-center text-md-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you''d like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
   
    <!-- Back to Top -->
    <a b-gtch0rhbok href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i b-gtch0rhbok class="bi bi-arrow-up"></i>
    </a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/lib/wow/wow.min.js"></script>
    <script src="/lib/easing/easing.min.js"></script>
    <script src="/lib/waypoints/waypoints.min.js"></script>
    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="/js/main.js"></script>
    
</body>
</html>
', CAST(N'2023-07-18T17:55:02.1996745' AS DateTime2), CAST(N'2023-07-18T17:55:19.5203781' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1003, N'Gastos', N'/lib/counterup/counterup.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633ba071\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{"Content-Type":"application/javascript","Accept-Ranges":"bytes","ETag":"\"1d9aedd633ba071\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7888887' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201529' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1004, N'Gastos', N'/lib/wow/wow.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633bb6df\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{"Content-Type":"application/javascript","Accept-Ranges":"bytes","ETag":"\"1d9aedd633bb6df\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7851459' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201684' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1005, N'Gastos', N'/img/about.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd6333be28\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{"Content-Type":"image/png","Accept-Ranges":"bytes","ETag":"\"1d9aedd6333be28\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7983943' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201553' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1006, N'Gastos', N'/css/bootstrap.min.css', N'GET', N'{"Accept":"text/css,*/*;q=0.1","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd63392985\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"style"}', N'', N'{"Content-Type":"text/css","Accept-Ranges":"bytes","ETag":"\"1d9aedd63392985\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:19.8125634' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201548' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1007, N'Gastos', N'/js/main.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633ba08f\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{"Content-Type":"application/javascript","Accept-Ranges":"bytes","ETag":"\"1d9aedd633ba08f\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7939856' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201808' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1008, N'Gastos', N'/img/icon-9.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633bae71\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{"Content-Type":"image/png","Accept-Ranges":"bytes","ETag":"\"1d9aedd633bae71\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.8200366' AS DateTime2), CAST(N'2023-07-18T17:55:24.8202220' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1009, N'Gastos', N'/lib/counterup/counterup.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633ba071\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{"Content-Type":"application/javascript","Accept-Ranges":"bytes","ETag":"\"1d9aedd633ba071\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7888887' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201529' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1010, N'Gastos', N'/lib/wow/wow.min.js', N'GET', N'{"Accept":"*/*","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633bb6df\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"script"}', N'', N'{"Content-Type":"application/javascript","Accept-Ranges":"bytes","ETag":"\"1d9aedd633bb6df\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7851459' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201684' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1011, N'Gastos', N'/img/about.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd6333be28\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{"Content-Type":"image/png","Accept-Ranges":"bytes","ETag":"\"1d9aedd6333be28\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.7983943' AS DateTime2), CAST(N'2023-07-18T17:55:24.8201553' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1012, N'Gastos', N'/img/icon-9.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633bae71\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{"Content-Type":"image/png","Accept-Ranges":"bytes","ETag":"\"1d9aedd633bae71\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:24.8200366' AS DateTime2), CAST(N'2023-07-18T17:55:24.8202220' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1013, N'Gastos', N'/img/icon-10.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633baec7\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{"Content-Type":"image/png","Accept-Ranges":"bytes","ETag":"\"1d9aedd633baec7\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:32.0083101' AS DateTime2), CAST(N'2023-07-18T17:55:32.0394797' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1014, N'Gastos', N'/img/icon-7.png', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","If-Modified-Since":"Wed, 05 Jul 2023 01:09:46 GMT","If-None-Match":"\"1d9aedd633ba07a\"","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{"Content-Type":"image/png","Accept-Ranges":"bytes","ETag":"\"1d9aedd633ba07a\"","Last-Modified":"Wed, 05 Jul 2023 01:09:46 GMT"}', N'', CAST(N'2023-07-18T17:55:38.2718065' AS DateTime2), CAST(N'2023-07-18T17:55:38.2731782' AS DateTime2))
INSERT [dbo].[HttpContext] ([Id], [Application], [Path], [Method], [RequestHeader], [RequestBody], [ResponseHeader], [ResponseBody], [RequestDateRegistration], [ResponseDateRegistration]) VALUES (1015, N'Gastos', N'/img/favicon.ico', N'GET', N'{"Accept":"image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8","Host":"localhost:7065","User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.82",":method":"GET","Accept-Encoding":"gzip, deflate, br, zsdch","Accept-Language":"en-GB,en;q=0.9,en-US;q=0.8","Referer":"https://localhost:7065/","sec-ch-ua":"\"Not.A/Brand\";v=\"8\", \"Chromium\";v=\"114\", \"Microsoft Edge\";v=\"114\"","sec-ch-ua-mobile":"?0","sec-ch-ua-platform":"\"Windows\"","sec-fetch-site":"same-origin","sec-fetch-mode":"no-cors","sec-fetch-dest":"image"}', N'', N'{}', N'', CAST(N'2023-07-18T17:55:38.4413327' AS DateTime2), CAST(N'2023-07-18T17:55:38.4437769' AS DateTime2))
SET IDENTITY_INSERT [dbo].[HttpContext] OFF
GO
SET IDENTITY_INSERT [dbo].[Pago] ON 

INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (4, 13, 1, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (5, 13, 2, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-09-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (6, 13, 3, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (7, 13, 4, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (8, 13, 5, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-12-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (9, 13, 6, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-01-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (10, 13, 7, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-02-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (11, 13, 8, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-03-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (12, 13, 9, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-04-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (13, 13, 10, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-05-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (14, 13, 11, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-06-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (15, 13, 12, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-07-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (16, 13, 13, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (17, 13, 14, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-09-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (18, 13, 15, CAST(276.60 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-10-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (19, 12, 1, CAST(324.83 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (20, 12, 2, CAST(324.83 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-09-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (21, 12, 3, CAST(324.83 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (22, 12, 4, CAST(324.83 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (23, 12, 5, CAST(324.83 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-12-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (24, 12, 6, CAST(324.83 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-01-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (25, 5, 1, CAST(716.50 AS Decimal(18, 2)), CAST(N'2023-04-26' AS Date), CAST(717.00 AS Decimal(18, 2)), CAST(N'2023-04-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (26, 5, 2, CAST(716.50 AS Decimal(18, 2)), CAST(N'2023-05-19' AS Date), CAST(717.00 AS Decimal(18, 2)), CAST(N'2023-05-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (27, 5, 3, CAST(716.50 AS Decimal(18, 2)), CAST(N'2023-06-08' AS Date), CAST(717.00 AS Decimal(18, 2)), CAST(N'2023-06-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (28, 5, 4, CAST(716.50 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-07-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (29, 5, 5, CAST(716.50 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (30, 5, 6, CAST(716.50 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-09-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (31, 4, 1, CAST(499.17 AS Decimal(18, 2)), CAST(N'2023-03-10' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-03-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (32, 4, 2, CAST(499.17 AS Decimal(18, 2)), CAST(N'2023-04-10' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-04-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (33, 4, 3, CAST(499.17 AS Decimal(18, 2)), CAST(N'2023-05-10' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-05-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (34, 4, 4, CAST(499.17 AS Decimal(18, 2)), CAST(N'2023-06-10' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-06-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (35, 4, 5, CAST(499.17 AS Decimal(18, 2)), CAST(N'2023-07-13' AS Date), CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-07-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (36, 4, 6, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (37, 4, 7, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-09-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (38, 4, 8, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (39, 4, 9, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (40, 4, 10, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-12-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (41, 4, 11, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-01-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (42, 4, 12, CAST(499.17 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2024-02-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (43, 2, 1, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-09-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (44, 2, 2, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-10-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (45, 2, 3, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-11-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (46, 2, 4, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-12-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (47, 2, 5, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-01-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (48, 2, 6, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-02-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (49, 2, 7, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-03-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (50, 2, 8, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-04-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (51, 2, 9, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-05-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (52, 2, 10, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-06-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (53, 2, 11, CAST(317.00 AS Decimal(18, 2)), CAST(N'2023-07-13' AS Date), CAST(317.00 AS Decimal(18, 2)), CAST(N'2023-07-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (54, 2, 12, CAST(317.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (67, 14, 1, CAST(7282.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
INSERT [dbo].[Pago] ([Id], [CompraId], [NumeroDePago], [CantidadEsperada], [FechaDeDeposito], [CantidadDepositada], [FechaDePago], [EstaActivo]) VALUES (1002, 1014, 1, CAST(1375.00 AS Decimal(18, 2)), CAST(N'2023-07-20' AS Date), CAST(1375.00 AS Decimal(18, 2)), CAST(N'2023-08-23' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Pago] OFF
GO
SET IDENTITY_INSERT [dbo].[Periodo] ON 

INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (1, N'Marzo 25', CAST(N'2023-03-25' AS Date), CAST(N'2023-04-10' AS Date), 1, N'3026d358-c2ac-4cb5-96f5-89e94972ce98')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (2, N'Abril 10', CAST(N'2023-04-10' AS Date), CAST(N'2023-04-25' AS Date), 1, N'0a61fcea-c4f5-4b39-adcf-1b0a4dcab0f6')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (4, N'Abril 25', CAST(N'2023-04-25' AS Date), CAST(N'2023-05-10' AS Date), 1, N'2a62ab87-35d1-48bf-8cbc-5ccabb7f7e1d')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (30, N'prueba 5', CAST(N'2023-05-05' AS Date), CAST(N'2023-05-05' AS Date), 0, N'7e577380-4fdd-4f34-a31f-f342b04e9b3c')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (31, N'prueba 6', CAST(N'2023-05-05' AS Date), CAST(N'2023-05-05' AS Date), 0, N'56fbdf14-bd39-4d0a-9057-b4a623d65c12')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (32, N'rggfg', CAST(N'2023-05-04' AS Date), CAST(N'2023-05-04' AS Date), 0, N'092face5-879c-4373-8cba-1236aa08011f')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (33, N'Mayo 10', CAST(N'2023-05-10' AS Date), CAST(N'2023-05-25' AS Date), 1, N'8e5e81a7-98cd-41f0-9096-feb5ddb58915')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (34, N'preuba 2', CAST(N'2023-05-10' AS Date), CAST(N'2023-05-25' AS Date), 0, N'9ff3cf2b-8743-48ee-a9e1-29b78d0deda0')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (35, N'prueba dos', CAST(N'2023-05-13' AS Date), CAST(N'2023-05-13' AS Date), 0, N'f60edd36-c1f7-48a3-b507-aa56d8803e29')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (36, N'Prueba 3.1', CAST(N'2023-05-10' AS Date), CAST(N'2023-05-25' AS Date), 0, N'26d1ec94-e57e-44ce-8f7c-2d7fa4a0b9f2')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (39, N'periodo de prueba', CAST(N'2023-05-20' AS Date), CAST(N'2023-05-20' AS Date), 0, N'5749c229-a6b0-4e87-88be-8563568ac9ce')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (40, N'prueba2', CAST(N'2023-05-14' AS Date), CAST(N'2023-05-14' AS Date), 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (41, N'periodo de prueba', CAST(N'2023-05-20' AS Date), CAST(N'2023-05-20' AS Date), 0, N'3fa85f64-5717-4562-b3fc-2c963f66afa6')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (42, N'string', CAST(N'2023-05-20' AS Date), CAST(N'2023-05-20' AS Date), 0, N'3fa85f64-5717-4562-b3fc-2c963f66afa7')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (43, N'Mayo 25', CAST(N'2023-05-25' AS Date), CAST(N'2023-06-10' AS Date), 1, N'4b633390-5b22-4f6e-90d4-69f546c3bd96')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (44, N'Prueba 2.0', CAST(N'2023-05-30' AS Date), CAST(N'2023-06-14' AS Date), 0, N'c627d3f0-b7be-4f8f-b777-8d678fc3a360')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (45, N'Junio 10', CAST(N'2023-06-09' AS Date), CAST(N'2023-06-25' AS Date), 1, N'9c49965c-eb39-47e0-8215-49c9553a2f47')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (46, N'junio 25', CAST(N'2023-06-25' AS Date), CAST(N'2023-07-10' AS Date), 1, N'9b18c99c-273b-4fcb-9baf-cb5e78d3dc91')
INSERT [dbo].[Periodo] ([Id], [Nombre], [FechaInicial], [FechaFinal], [EstaActivo], [Guid]) VALUES (47, N'Julio 10', CAST(N'2023-07-10' AS Date), CAST(N'2023-07-25' AS Date), 1, N'a803ec2b-40cb-484b-948e-03e2acddca51')
SET IDENTITY_INSERT [dbo].[Periodo] OFF
GO
SET IDENTITY_INSERT [dbo].[Subcategoria] ON 

INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (1, 3, N'Apartados', 0, CAST(3400.00 AS Decimal(7, 2)), NULL)
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (2, 1, N'Techero', 1, CAST(12100.00 AS Decimal(7, 2)), N'62d9ac48-76ad-485c-b638-e39fb2265707')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (3, 1, N'Bbva', 1, CAST(3000.00 AS Decimal(7, 2)), N'722b5635-f98d-47b5-b81c-b6cde545b395')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (4, 3, N'Tlax Luz', 0, CAST(125.00 AS Decimal(7, 2)), N'03e54f77-6ecb-4c8e-a778-774619764ff6')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (5, 3, N'Tlax Internet y LUZ', 1, CAST(225.00 AS Decimal(7, 2)), N'1f2c645a-93ec-481e-836e-8c79cbff4b1d')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (6, 3, N'TDC Anualidad', 1, CAST(105.00 AS Decimal(7, 2)), N'80a2a4ee-2888-439c-a9da-d272cf3b15cb')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (7, 2, N'TdcPago', 1, CAST(850.00 AS Decimal(7, 2)), N'4f0d537f-52d5-4735-bb0d-83dd98c02746')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (8, 2, N'Semana 1', 1, CAST(500.00 AS Decimal(7, 2)), N'64f56e5a-b2e3-4ee1-a379-b812a104d831')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (9, 2, N'Semana 2', 1, CAST(500.00 AS Decimal(7, 2)), N'e8321fed-dfe9-4443-b335-429628ad67b0')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (10, 2, N'Seguro Bbva', 1, CAST(85.00 AS Decimal(7, 2)), N'f3fece3b-4138-4a6a-b4ad-5e3f31938c33')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (11, 2, N'Renta', 1, CAST(2800.00 AS Decimal(7, 2)), N'b8791ee9-0a24-4b6c-b630-20d77ca77c24')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (12, 2, N'Nesflis', 0, CAST(90.00 AS Decimal(7, 2)), N'c5f1a54a-fe81-4449-88a6-2b676e4d3d1e')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (13, 2, N'Natación', 1, CAST(250.00 AS Decimal(7, 2)), N'0f930f5f-2678-417d-9791-166849215d5d')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (14, 3, N'Gatos Arena', 0, CAST(300.00 AS Decimal(7, 2)), N'4c7f2876-0186-453d-989e-5a172ab5edab')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (15, 3, N'Gatos Alimento y arena', 1, CAST(500.00 AS Decimal(7, 2)), N'48905a75-3b89-4ed0-84ae-6bfb55188876')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (16, 2, N'Gas', 1, CAST(200.00 AS Decimal(7, 2)), N'1d9b50c8-fa60-44cd-b208-26e63fe83005')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (17, 2, N'Entretenimineto', 1, CAST(300.00 AS Decimal(7, 2)), N'9ddcf1d7-f933-4b61-bb35-10852c004b1d')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (19, 2, N'Doña', 1, CAST(1500.00 AS Decimal(7, 2)), N'668a7596-bccf-4c9b-a065-0e65afc6fe99')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (20, 2, N'Cel saldo', 1, CAST(75.00 AS Decimal(7, 2)), N'ad49e362-8d79-4553-9460-1cc4af3807d6')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (21, 3, N'CDMX Luz', 0, CAST(100.00 AS Decimal(7, 2)), N'7df55edc-dfc0-44bf-a9cb-6af9ac254987')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (22, 3, N'CDMX Internet y Luz', 1, CAST(275.00 AS Decimal(7, 2)), N'6b78597a-43b3-40be-8189-d25b5fa4450d')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (23, 2, N'CDMX Agua', 1, CAST(100.00 AS Decimal(7, 2)), N'77c67311-b1a0-4953-89a2-195afd006717')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (24, 2, N'Tianguis 1', 1, CAST(500.00 AS Decimal(7, 2)), N'7ae09c9d-5e3c-4d1c-99b4-13f4dbcabe76')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (25, 2, N'Tianguis 2', 1, CAST(500.00 AS Decimal(7, 2)), N'b1ffbb64-2aa7-46b3-a143-57bb1e611ad4')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (26, 2, N'Alimentacion ', 1, CAST(1200.00 AS Decimal(7, 2)), N'c8d7b936-a48a-4e58-86f0-356bc5beb780')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (27, 3, N'Titulación', 1, CAST(500.00 AS Decimal(7, 2)), N'f784d0ca-0c02-471d-acdf-039b0df76775')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (28, 3, N'Sabatico', 1, CAST(300.00 AS Decimal(7, 2)), N'4de0264b-df70-4c84-9723-9d10f83e36b4')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (29, 3, N'PC', 1, CAST(300.00 AS Decimal(7, 2)), N'9a6bfe62-cacb-4dab-8c2e-15dc796c49a4')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (30, 3, N'Ahorro vacaciones', 1, CAST(100.00 AS Decimal(7, 2)), N'c0cfe0b1-480f-47a6-90f8-58fd83525816')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (31, 3, N'Vacaciones Cuba Yo', 1, CAST(500.00 AS Decimal(7, 2)), N'cb46fa61-5a2f-4a94-b4c1-cc216916f83a')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (34, 3, N'Ahorro N', 1, CAST(200.00 AS Decimal(7, 2)), N'63ee3e74-2178-4db6-a19e-705eaba24948')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (35, 3, N'Tech, cosas', 1, CAST(100.00 AS Decimal(7, 2)), N'd3999266-8df3-42ee-93ea-c4b2f8c19983')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (36, 3, N'Apartado Tlax', 1, CAST(400.00 AS Decimal(7, 2)), N'84ed54c6-9a4e-4898-bf4f-ba6607fb0234')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (37, 3, N'Apartado Médico', 1, CAST(100.00 AS Decimal(7, 2)), N'76afd157-2243-44e6-b0c4-1e003108f058')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (38, 3, N'Camioneta', 1, CAST(100.00 AS Decimal(7, 2)), N'd1d1aa03-bc9e-4603-950f-a81a0d3f00dc')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (39, 3, N'Afore', 1, CAST(700.00 AS Decimal(7, 2)), N'b566f10e-66c8-4957-9bb2-5a71e3ab0eeb')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (40, 3, N'Ropa', 1, CAST(100.00 AS Decimal(7, 2)), N'e6ea8785-e52b-4305-ab71-c6536a736a97')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (41, 2, N'Comodin', 1, CAST(300.00 AS Decimal(7, 2)), N'fdc3d7eb-f4b3-4640-b022-24fba4477865')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (42, 3, N'Vacaciones Cuba Nancy', 1, CAST(500.00 AS Decimal(7, 2)), N'a4ec8e6f-a859-49b4-abdc-977e430bd7ae')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (43, 2, N'Preuba 1', 0, CAST(100.00 AS Decimal(7, 2)), N'87e6dfd0-9ad7-4965-a500-a4671d493593')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (44, 2, N'prueba 2', 0, CAST(1.00 AS Decimal(7, 2)), N'df9e3cf2-d003-4ee4-a925-de0ed2ea2563')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (47, 2, N'Prueba', 0, CAST(100.10 AS Decimal(7, 2)), N'25a6d55c-861b-4f6a-8909-66b8811dbdd4')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (48, 2, N'Prueba', 0, CAST(100.10 AS Decimal(7, 2)), N'930eccc2-c608-4f77-9606-1ea890919733')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (49, 2, N'Prueba', 0, CAST(100.10 AS Decimal(7, 2)), N'f8c10fc2-3df4-455d-99d6-3e350b1d39a7')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (50, 2, N'Prueba 2', 0, CAST(2.00 AS Decimal(7, 2)), N'4bbecce4-8217-41fc-833b-54b9a1b85bf6')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (51, 2, N'Gimnasio, deportes', 1, CAST(350.00 AS Decimal(7, 2)), N'b1f65e4b-7769-4183-b3ae-404cc5d78472')
INSERT [dbo].[Subcategoria] ([Id], [CategoriaId], [Nombre], [EstaActivo], [Cantidad], [Guid]) VALUES (52, 2, N'Transporte', 1, CAST(300.00 AS Decimal(7, 2)), N'11835e0a-a7c8-4511-a6f3-0310869303f3')
SET IDENTITY_INSERT [dbo].[Subcategoria] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDeApartado] ON 

INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (2, N'Bbva Apartado', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (3, N'Bbva Plazo a 28 dias', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (4, N'Bbva Inversion', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (5, N'Techero Plazo a 30', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (6, N'Techero Plazo a 60', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (7, N'Techero Plazo a 90', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (8, N'Techero Plazo a 180', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (9, N'Cetes Bondia', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (10, N'Cetes a 28', 1)
INSERT [dbo].[TipoDeApartado] ([Id], [Nombre], [EstaActivo]) VALUES (12, N'Bbva Plazo 91 dias', 1)
SET IDENTITY_INSERT [dbo].[TipoDeApartado] OFF
GO
ALTER TABLE [dbo].[Apartado]  WITH CHECK ADD  CONSTRAINT [FK_Apartado_Apartado] FOREIGN KEY([TipoDeApartadoId])
REFERENCES [dbo].[TipoDeApartado] ([Id])
GO
ALTER TABLE [dbo].[Apartado] CHECK CONSTRAINT [FK_Apartado_Apartado]
GO
ALTER TABLE [dbo].[Apartado]  WITH CHECK ADD  CONSTRAINT [FK_Apartado_Subcategoria] FOREIGN KEY([SubcategoriaId])
REFERENCES [dbo].[Subcategoria] ([Id])
GO
ALTER TABLE [dbo].[Apartado] CHECK CONSTRAINT [FK_Apartado_Subcategoria]
GO
ALTER TABLE [dbo].[DetalleDeApartado]  WITH CHECK ADD  CONSTRAINT [FK_DetalleDeApartado_Apartado] FOREIGN KEY([ApartadoId])
REFERENCES [dbo].[Apartado] ([Id])
GO
ALTER TABLE [dbo].[DetalleDeApartado] CHECK CONSTRAINT [FK_DetalleDeApartado_Apartado]
GO
ALTER TABLE [dbo].[Gasto]  WITH CHECK ADD  CONSTRAINT [FK_Gasto_Subcategoria] FOREIGN KEY([PeriodoId])
REFERENCES [dbo].[Periodo] ([Id])
GO
ALTER TABLE [dbo].[Gasto] CHECK CONSTRAINT [FK_Gasto_Subcategoria]
GO
ALTER TABLE [dbo].[Subcategoria]  WITH CHECK ADD  CONSTRAINT [FK_Subcategoria_Categoria] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Subcategoria] CHECK CONSTRAINT [FK_Subcategoria_Categoria]
GO
USE [master]
GO
ALTER DATABASE [Gastos] SET  READ_WRITE 
GO
