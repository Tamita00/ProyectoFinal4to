USE [master]
GO
/****** Object:  Database [MiMascota]    Script Date: 19/4/2024 09:22:41 ******/
CREATE DATABASE [MiMascota]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiMascota', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MiMascota.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MiMascota_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MiMascota_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MiMascota] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiMascota].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiMascota] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiMascota] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiMascota] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiMascota] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiMascota] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiMascota] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiMascota] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiMascota] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiMascota] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiMascota] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiMascota] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiMascota] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiMascota] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiMascota] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiMascota] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiMascota] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiMascota] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiMascota] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiMascota] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiMascota] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiMascota] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiMascota] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiMascota] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MiMascota] SET  MULTI_USER 
GO
ALTER DATABASE [MiMascota] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiMascota] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiMascota] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiMascota] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MiMascota] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MiMascota', N'ON'
GO
ALTER DATABASE [MiMascota] SET QUERY_STORE = OFF
GO
USE [MiMascota]
GO
/****** Object:  User [alumno]    Script Date: 19/4/2024 09:22:41 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Antecedente]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Antecedente](
	[IdAntecedente] [int] IDENTITY(1,1) NOT NULL,
	[IdMascota] [int] NOT NULL,
	[Lugar] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Info] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_Antecedente] PRIMARY KEY CLUSTERED 
(
	[IdAntecedente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dueno]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dueno](
	[IdDueno] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dueno] PRIMARY KEY CLUSTERED 
(
	[IdDueno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota](
	[IdMascota] [int] IDENTITY(1,1) NOT NULL,
	[IdDueno] [int] NOT NULL,
	[TipoMascota] [varchar](50) NOT NULL,
	[Genero] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Raza] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Mascota] PRIMARY KEY CLUSTERED 
(
	[IdMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[IdMascota] [int] NOT NULL,
	[IdNota] [int] IDENTITY(1,1) NOT NULL,
	[Lugar] [varchar](8000) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Info] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_Nota] PRIMARY KEY CLUSTERED 
(
	[IdNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raza]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raza](
	[nombre] [varchar](800) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Raza] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacuna]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacuna](
	[IdVacuna] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[fecha1] [datetime] NOT NULL,
	[fecha10] [datetime] NULL,
 CONSTRAINT [PK_Vacuna] PRIMARY KEY CLUSTERED 
(
	[IdVacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VACUNAS x MASCOTAS]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VACUNAS x MASCOTAS](
	[IdVacuna] [int] NOT NULL,
	[IdMascota] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Antecedente] ON 

INSERT [dbo].[Antecedente] ([IdAntecedente], [IdMascota], [Lugar], [Fecha], [Info]) VALUES (1, 22, N'VeterinariaAmor', CAST(N'2023-11-16' AS Date), N'Castración')
INSERT [dbo].[Antecedente] ([IdAntecedente], [IdMascota], [Lugar], [Fecha], [Info]) VALUES (2, 23, N'VeterinariaAmor', CAST(N'2023-11-16' AS Date), N'Castración')
INSERT [dbo].[Antecedente] ([IdAntecedente], [IdMascota], [Lugar], [Fecha], [Info]) VALUES (4, 40, N'Veterinaria Amor', CAST(N'2023-11-14' AS Date), N'Castración')
INSERT [dbo].[Antecedente] ([IdAntecedente], [IdMascota], [Lugar], [Fecha], [Info]) VALUES (5, 43, N'Centenario', CAST(N'2023-11-07' AS Date), N'Sacar al perro')
INSERT [dbo].[Antecedente] ([IdAntecedente], [IdMascota], [Lugar], [Fecha], [Info]) VALUES (8, 50, N'Veterinaria Amor', CAST(N'2023-11-07' AS Date), N'Castración')
INSERT [dbo].[Antecedente] ([IdAntecedente], [IdMascota], [Lugar], [Fecha], [Info]) VALUES (11, 53, N'San Isidro', CAST(N'2021-10-10' AS Date), N'Castracion')
SET IDENTITY_INSERT [dbo].[Antecedente] OFF
GO
SET IDENTITY_INSERT [dbo].[Dueno] ON 

INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (1, 12345678, N'Leo', N'leo.kristal@gmail.com', N'1234')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (2, 12345678, N'Leo', N'leo.kristal@gmail.com', N'1234')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (3, 9876545, N'Luca', N'luca@gmial.com', N'1234')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (4, 47961890, N'Thiago', N'pala@gmail.com', N'6575')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (5, 72828821, N'Agos', N'agostinaBottarini090@gmail.com', N'lila1')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (6, 98867649, N'Agos', N'agostina@gmail.com', N'8765')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (7, 9876543, N'Maxi', N'maximiliano87@gmail.com', N'maxiOjo')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (8, 64564564, N'David', N'david@gamil.com', N'davidFutbol')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (9, 78327312, N'olivia', N'oliviaDiarloMatsuo@gmail.com', N'lolaa')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (10, 47980909, N'Joaco', N'JoaquinRulos@gmail.com', N'calisteña')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (11, 47980987, N'ianbajo', N'ianchiqui@gmail.com', N'ColoradoPuto')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (12, 47807159, N'Martina', N'martina@gmail.com', N'789')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (13, 12345567, N'Butler', N'sanibu@gmail.com', N'123Hola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (14, 765432179, N'Tina', N'Tinani@gmail.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (15, 64789023, N'Leonardo', N'leo@gmial.com', N'678')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (16, 12345678, N'Lila', N'lila@gmail.com', N'12345678')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (17, 12345678, N'Lila', N'lila@gmail.com', N'12345678')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (18, 9876543, N'Kyra', N'kyra@gmial.com', N'098')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (19, 98766543, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (20, 9876543, N'Kyra', N'kyra@gmial.com', N'098')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (21, 12346777, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (22, 12345678, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (23, 12345678, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (24, 12345678, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (25, 12345678, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (26, 12345678, N'Kyra', N'kyra@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (27, 12345678, N'emi', N'emi@gmail.com', N'9088')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (28, 47807159, N'tami', N'tami@gmial.com', N'1234')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (29, 8976543, N'josefa', N'josefa@gmail.com', N'puto1')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (30, 1234546, N'josefa', N'josefa@gmail.com', N'PUT')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (31, 9182736, N'josefina', N'josefina@gmail.com', N'butibu')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (32, 8753287, N'lola', N'lola@gmail.com', N'lola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (33, 8753287, N'lola', N'lola@gmail.com', N'lola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (34, 8753287, N'lola', N'lola@gmail.com', N'lola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (35, 8753287, N'lola', N'lola@gmail.com', N'lola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (36, 8753287, N'lola', N'lola@gmail.com', N'lola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (37, 8753287, N'lola', N'lola@gmail.com', N'lola')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (38, 345678, N'josefa', N'josefa@gmail.com', N'kol')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (39, 6732932, N'martin', N'martin@gmail.com', N'7866')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (40, 1234567, N'josefina', N'josefa@gmail.com', N'4566')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (41, 54335344, N'lola', N'josefa@gmail.com', N'3222')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (42, 789323, N'smartwater', N'smart@gmail.com', N'1233')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (43, 6732639, N'lola', N'lola@gmail.com', N'6766')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (44, 532535, N'josefa', N'josefa@gmail.com', N'9099')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (45, 34567890, N'josefina', N'josefa@gmail.com', N'7877')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (46, 434324, N'Octavio', N'lola@gmail.com', N'3455')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (47, 23456789, N'martin', N'smart@gmail.com', N'9099')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (48, 12345678, N'David', N'davidW@gmail.com', N'8988')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (49, 12345678, N'Scot', N'scot@gmail.com', N'8988')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (50, 12435678, N'David', N'davidW@gmail.com', N'7877')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (51, 12346578, N'Scot', N'emmaScot@gmail.com', N'5655')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (52, 12345668, N'jesi', N'jesi@gmail.com', N'7877')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (53, 9876565, N'jessi', N'jessi@gmail.com', N'8988')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (54, 12345678, N'oli', N'oli@gmail.com', N'000')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (55, 12345678, N'jesii', N'jesii@gmail.com', N'090')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (56, 47807159, N'Camila', N'camilaLoIacono@gmail.com', N'090')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (57, 65798042, N'tobias', N'tobiG@gmial.com', N'676')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (58, 98765431, N'Ramiro', N'rama@gmail.com', N'565')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (59, 123456789, N'Maximiliano', N'maxRogel@gmial.com', N'000')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (60, 667788, N'tomas', N'tom@gmail.com', N'999')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (61, 44222222, N'Leo Kristal', N'leo@kristal.com', N'12345')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (62, 1234587, N'tamai', N'tami@gmail.com', N'tami')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (63, 12345678, N'tamai', N'tami@gmail.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (64, 123456789, N'oli', N'oli@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (65, 12345678, N'oli', N'oli@gmial.com', N'098')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (66, 89, N'tamai', N'oli@gmial.com', N'89')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (67, 564, N'tamai', N'tami@gmail.com', N'687')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (68, 12345678, N'leo', N'leo@gmial.com', N'1234')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (69, 12345678, N'leo', N'leo@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (70, 12345687, N'leo', N'leo@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (71, 123456788, N'leo', N'leo@gmial.com', N'12345')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (72, 12345678, N'leo', N'leo@gmial.com', N'123')
INSERT [dbo].[Dueno] ([IdDueno], [DNI], [Nombre], [Email], [Contraseña]) VALUES (73, 2124432, N'leo', N'leo@gmial.com', N'123')
SET IDENTITY_INSERT [dbo].[Dueno] OFF
GO
SET IDENTITY_INSERT [dbo].[Mascota] ON 

INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (2, 5, N'on', N'on', N'Luca', N'American Curl', CAST(N'2023-11-02' AS Date), N'bc15h-hub-american-curl-adult-black-and-white.avif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (3, 6, N'on', N'on', N'Kiko', N'American Curl', CAST(N'2023-11-03' AS Date), N'bc15h-hub-american-curl-adult-black-and-white.avif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (4, 7, N'on', N'on', N'Poto', N'Labrador', CAST(N'2023-08-31' AS Date), N'cuantos-anaos-vive-un-labrador-negro.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (5, 8, N'on', N'on', N'Pipon', N'American Bobtail', CAST(N'2023-11-02' AS Date), N'bc14h-hub-american-bobtail-adult-black-and-white.a')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (6, 9, N'on', N'on', N'Nino', N'Caniche', CAST(N'2023-10-05' AS Date), N'enfermedades_mas_comunes_en_perros_caniches_23396_')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (7, 10, N'on', N'on', N'Martin', N'American Wirehair', CAST(N'2023-09-16' AS Date), N'bc16h-hub-american-wirehair-adult-black-and-white.')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (8, 11, N'on', N'on', N'Leia', N'SchnauzerMini', CAST(N'2014-12-14' AS Date), N'descarga.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (9, 12, N'on', N'on', N'Lila', N'BullDog Frances', CAST(N'2023-09-06' AS Date), N'006.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (10, 13, N'on', N'on', N'Kyra', N'Border Collie', CAST(N'2020-01-05' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (11, 14, N'on', N'on', N'Martina', N'BullDog Frances', CAST(N'2023-10-05' AS Date), N'006.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (12, 15, N'on', N'on', N'Lila', N'BullDog Frances', CAST(N'2023-07-06' AS Date), N'006.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (13, 16, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2022-02-01' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (14, 17, N'on', N'on', N'Lila', N'BullDog Frances', CAST(N'2023-11-01' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (15, 18, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2020-07-09' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (16, 19, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2023-07-12' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (17, 20, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2021-01-04' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (18, 21, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2021-02-02' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (19, 22, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2021-01-06' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (20, 23, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2021-02-01' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (21, 24, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2021-02-06' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (22, 25, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2023-11-15' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (23, 26, N'on', N'on', N'Butler', N'Border Collie', CAST(N'2023-11-15' AS Date), N'320px-Border_Collie_600.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (25, 27, N'on', N'on', N'emi', N'mezcla', CAST(N'2023-11-11' AS Date), N'5-razas-populares-perros-labrador-pastor-aleman.we')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (26, 28, N'on', N'on', N'emi', N'mezcla', CAST(N'2023-11-03' AS Date), N'bichon-maltes.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (27, 31, N'Perro', N'Hembra', N'lola', N'mento', CAST(N'2023-11-02' AS Date), N'como_hacer_feliz_a_tu_perro_24231_orig.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (28, 39, N'Perro', N'Macho', N'Octavio', N'Burra de mierda', CAST(N'2023-10-30' AS Date), N'maxresdefault.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (29, 40, N'Perro', N'Hembra', N'josefina', N'mento', CAST(N'2023-11-02' AS Date), N'R.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (30, 41, N'Perro', N'Hembra', N'josefa', N'Burra de mierda', CAST(N'2023-11-01' AS Date), N'OIP.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (31, 42, N'Perro', N'Hembra', N'josefa', N'Burra de mierda', CAST(N'2023-11-15' AS Date), N'14379518765_0dcce037b2_b.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (32, 42, N'Perro', N'Hembra', N'josefa', N'Burra de mierda', CAST(N'2023-11-15' AS Date), N'14379518765_0dcce037b2_b.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (33, 43, N'Perro', N'Hembra', N'lola', N'mento', CAST(N'2023-11-04' AS Date), N'58.jpg_693687776.webp')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (34, 44, N'Perro', N'Hembra', N'josefina', N'mento', CAST(N'2023-11-04' AS Date), N'OIP (1).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (35, 45, N'Perro', N'Hembra', N'josefina', N'Burra de mierda', CAST(N'2023-11-10' AS Date), N'3854520074_210cf5304a_n.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (36, 46, N'Perro', N'Hembra', N'josefina', N'border colie', CAST(N'2023-11-09' AS Date), N'collie_2.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (37, 47, N'Perro', N'Hembra', N'josefa', N'mento', CAST(N'2023-11-13' AS Date), N'87ceefc2c2d3c3d9ebad86cc8ef4eb4721d85304.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (38, 47, N'Gato', N'Macho', N'lola', N'Burra de mierda', CAST(N'2023-11-07' AS Date), N'R (1).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (39, 47, N'Perro', N'Hembra', N'Scot', N'Marcos', CAST(N'2023-11-10' AS Date), N'R.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (40, 48, N'Perro', N'Macho', N'Scot', N'Golden', CAST(N'2023-11-15' AS Date), N'R (1).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (41, 49, N'Perro', N'Hembra', N'David', N'Marcos', CAST(N'2023-11-05' AS Date), N'R.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (42, 50, N'Perro', N'Hembra', N'Scot', N'Marcos', CAST(N'2023-11-01' AS Date), N'R.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (43, 51, N'Perro', N'Hembra', N'David', N'Marcos', CAST(N'2023-11-08' AS Date), N'OIP.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (44, 52, N'Perro', N'Hembra', N'David', N'Marcos', CAST(N'2023-11-08' AS Date), N'OIP (1).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (45, 53, N'Gato', N'Hembra', N'David', N'Golden', CAST(N'2023-11-09' AS Date), N'cat_(felis_silvestris_catus)-25.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (46, 54, N'Perro', N'Hembra', N'David', N'Marcos', CAST(N'2023-11-12' AS Date), N'R (2).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (47, 55, N'Perro', N'Hembra', N'Scot', N'Marcos', CAST(N'2023-11-13' AS Date), N'Los-perros-más-pequeños-del-mundo-1.webp')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (48, 56, N'Perro', N'Hembra', N'David', N'Golden', CAST(N'2023-11-18' AS Date), N'perroGolden.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (49, 57, N'Gato', N'Macho', N'pitufa', N'Simes', CAST(N'2023-11-15' AS Date), N'gatoPitufa.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (50, 58, N'Gato', N'Macho', N'Fransisco', N'Simes', CAST(N'2023-11-01' AS Date), N'fran.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (51, 59, N'Perro', N'Hembra', N'Clara', N'Golden', CAST(N'2023-11-02' AS Date), N'R (3).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (52, 60, N'Perro', N'Hembra', N'David', N'pitbull', CAST(N'2023-11-18' AS Date), N'OIP (2).jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (53, 61, N'Perro', N'Macho', N'Ñoki', N'Calle', CAST(N'2021-03-10' AS Date), N'PerroLeo.jfif')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (54, 61, N'Gato', N'Hembra', N'Coki', N'Siames', CAST(N'2023-11-07' AS Date), N'fran.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (55, 69, N'Gato', N'Macho', N'leo', N'BullDog', CAST(N'2024-05-03' AS Date), N'OIP.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (56, 70, N'Gato', N'Macho', N'leo', N'BullDog', CAST(N'2024-04-10' AS Date), N'OIP.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (57, 72, N'Perro', N'Hembra', N'buti', N'BullDog', CAST(N'2024-04-12' AS Date), N'OIP.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (58, 73, N'Perro', N'Hembra', N'buti', N'BullDog', CAST(N'2024-04-10' AS Date), N'OIP.jpg')
INSERT [dbo].[Mascota] ([IdMascota], [IdDueno], [TipoMascota], [Genero], [Nombre], [Raza], [FechaNacimiento], [Foto]) VALUES (59, 69, N'Perro', N'Hembra', N'buti', N'BullDog', CAST(N'2024-04-30' AS Date), N'OIP.jpg')
SET IDENTITY_INSERT [dbo].[Mascota] OFF
GO
SET IDENTITY_INSERT [dbo].[Nota] ON 

INSERT [dbo].[Nota] ([IdMascota], [IdNota], [Lugar], [Fecha], [Info]) VALUES (51, 11, N'Veterinaria Amor', CAST(N'2023-11-02' AS Date), N'Castración')
INSERT [dbo].[Nota] ([IdMascota], [IdNota], [Lugar], [Fecha], [Info]) VALUES (53, 12, N'Macabi', CAST(N'2023-11-29' AS Date), N'Llevarlo')
INSERT [dbo].[Nota] ([IdMascota], [IdNota], [Lugar], [Fecha], [Info]) VALUES (53, 13, N'Macabi', CAST(N'2023-11-30' AS Date), N'Traerlo')
SET IDENTITY_INSERT [dbo].[Nota] OFF
GO
SET IDENTITY_INSERT [dbo].[Raza] ON 

INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'BullDog', 1)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Border Collie', 2)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Labrador', 3)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Golden Retriever', 4)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Bulldog Frances', 5)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Bulldog Ingles', 6)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Husky Siberiano', 7)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Beagle', 8)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Dachshund', 9)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Dogo', 10)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Pitbull', 11)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Doberman', 12)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Chihuahua', 13)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Caniche', 14)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Rottweiler', 15)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Cocker Spaniel', 16)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Schnauzer', 17)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Dalmata', 18)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Corgi', 19)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Mestizo', 20)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Pastor Australiano', 21)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Pastor Aleman', 22)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Siames', 23)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'British Shorthair', 24)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Maine Coon', 25)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Persa', 26)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Ragdoll', 27)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Esfinge', 28)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Abisinio', 29)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Burnes', 30)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Bombay', 31)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Birmano', 32)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Siberiano', 33)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Munchkin', 34)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Curl Americano', 35)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Bobtail Americano', 36)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Somali', 37)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Korat', 38)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Egipcio', 39)
INSERT [dbo].[Raza] ([nombre], [Id]) VALUES (N'Otro', 40)
SET IDENTITY_INSERT [dbo].[Raza] OFF
GO
SET IDENTITY_INSERT [dbo].[Vacuna] ON 

INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (3, N'Gripe', CAST(N'2023-11-05T00:00:00.000' AS DateTime), CAST(N'2023-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (4, N'Gripe', CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(N'2023-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (5, N'Gripe', CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(N'2023-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (6, N'Gripe', CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (11, N'Gripe', CAST(N'2023-11-06T00:00:00.000' AS DateTime), CAST(N'2023-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (12, N'Gripe', CAST(N'2023-11-06T00:00:00.000' AS DateTime), CAST(N'2023-11-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (13, N'Gripe', CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (14, N'Gripe', CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (15, N'Gripe', CAST(N'2023-11-06T00:00:00.000' AS DateTime), CAST(N'2023-10-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (16, N'Gripe', CAST(N'2023-11-07T00:00:00.000' AS DateTime), CAST(N'2023-11-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (19, N'Gripe', CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Vacuna] ([IdVacuna], [Tipo], [fecha1], [fecha10]) VALUES (21, N'CoronaVirus', CAST(N'2022-11-28T00:00:00.000' AS DateTime), CAST(N'2023-11-28T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vacuna] OFF
GO
INSERT [dbo].[VACUNAS x MASCOTAS] ([IdVacuna], [IdMascota]) VALUES (11, 37)
INSERT [dbo].[VACUNAS x MASCOTAS] ([IdVacuna], [IdMascota]) VALUES (13, 41)
INSERT [dbo].[VACUNAS x MASCOTAS] ([IdVacuna], [IdMascota]) VALUES (14, 41)
INSERT [dbo].[VACUNAS x MASCOTAS] ([IdVacuna], [IdMascota]) VALUES (15, 42)
INSERT [dbo].[VACUNAS x MASCOTAS] ([IdVacuna], [IdMascota]) VALUES (19, 50)
INSERT [dbo].[VACUNAS x MASCOTAS] ([IdVacuna], [IdMascota]) VALUES (21, 53)
GO
ALTER TABLE [dbo].[Antecedente]  WITH CHECK ADD  CONSTRAINT [FK_Antecedente_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([IdMascota])
GO
ALTER TABLE [dbo].[Antecedente] CHECK CONSTRAINT [FK_Antecedente_Mascota]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_Dueno] FOREIGN KEY([IdDueno])
REFERENCES [dbo].[Dueno] ([IdDueno])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_Dueno]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([IdMascota])
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Mascota]
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS]  WITH CHECK ADD  CONSTRAINT [FK_VACUNAS x MASCOTAS_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([IdMascota])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS] CHECK CONSTRAINT [FK_VACUNAS x MASCOTAS_Mascota]
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS]  WITH CHECK ADD  CONSTRAINT [FK_VACUNAS x MASCOTAS_Vacuna] FOREIGN KEY([IdVacuna])
REFERENCES [dbo].[Vacuna] ([IdVacuna])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS] CHECK CONSTRAINT [FK_VACUNAS x MASCOTAS_Vacuna]
GO
/****** Object:  StoredProcedure [dbo].[sp_CambiarContrasena]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CambiarContrasena]
    @pContraseña varchar(50),
	@pEmail varchar(50)
AS
BEGIN
	UPDATE Dueno SET Contraseña = @pContraseña WHERE Email = @pEmail
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CrearAntecedente]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearAntecedente]
    @pIdMascota int,
	@pLugar varchar(50),
	@pFecha date,
	@pInfo varchar(50)
AS
BEGIN
	INSERT INTO Antecedente(IdMascota, Lugar, Fecha, Info)
	VALUES (@pIdMascota, @pLugar, @pFecha, @pInfo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearDueno]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearDueno]
    @pContraseña varchar(50),
	@pDNI int,
	@pNombre varchar(50),
	@pEmail varchar(50)
AS
BEGIN
	INSERT INTO Dueno(Contraseña, DNI, Nombre, Email)
	VALUES (@pContraseña, @pDNI, @pNombre, @pEmail)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearMascota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearMascota]
    @pIdDueno int,
	@pTipoMascota varchar(50),
	@pGenero varchar(50),
	@pNombre varchar(50),
	@pRaza varchar(50),
	@pFechaNacimiento date,
	@pFoto varchar(50)
AS
BEGIN
	INSERT INTO Mascota(IdDueno, TipoMascota, Genero, Nombre, Raza, FechaNacimiento, Foto)
	VALUES (@pIdDueno, @pTipoMascota, @pGenero, @pNombre, @pRaza, @pFechaNacimiento, @pFoto)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearNota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearNota]
    @pIdMascota int,
	@pLugar varchar(50),
	@pFecha date,
	@pInfo varchar(50)
AS
BEGIN
	INSERT INTO Nota(IdMascota, Lugar, Fecha, Info)
	VALUES (@pIdMascota, @pLugar, @pFecha, @pInfo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreaVacuna]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreaVacuna]
    @pTipo varchar(50),
	@pfecha1 date,
	@pfecha10 date,
	@pIdMascota int
AS
BEGIN
	INSERT INTO Vacuna(Tipo, fecha1, fecha10)
	VALUES (@pTipo, @pfecha1, @pfecha10)


	DECLARE @IdVacuna int
	SET @IdVacuna = (SELECT top(1) IdVacuna FROM Vacuna Order By IdVacuna Desc)

	INSERT INTO [VACUNAS x MASCOTAS](IdVacuna, IdMascota)
	VALUES (@IdVacuna, @pIdMascota)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarAntecedente]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarAntecedente]
	@pIdAntecedente int
AS
BEGIN
	DELETE FROM Antecedente WHERE IdAntecedente = @pIdAntecedente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarNota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarNota]
	@pIdNota int
AS
BEGIN

	delete from Nota where IdNota = @pIdNota

END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaVacuna]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminaVacuna] 
	@pIdVacuna int
AS
BEGIN
	DELETE FROM Vacuna WHERE IdVacuna = @pIdVacuna
	
	DELETE FROM [VACUNAS x MASCOTAS] WHERE IdVacuna = @pIdVacuna
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarAntecedentes]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_MostrarAntecedentes]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Antecedente WHERE  IdMascota = @pIdMascota
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarDatosPersonales]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarDatosPersonales]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Mascota
	INNER JOIN Dueno ON Mascota.IdDueno = Dueno.IdDueno
	WHERE Mascota.IdMascota = @pIdMascota
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarDueno]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarDueno]
    @pEmail varchar(50),
	@pContrasena varchar(50)
AS
BEGIN
	SELECT * FROM Dueno WHERE Email = @pEmail AND Contraseña = @pContrasena
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarIdDueno]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarIdDueno]
AS
BEGIN
	SELECT top(1) IdDueno FROM Dueno Order By IdDueno Desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarIdMascota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MostrarIdMascota]
AS
BEGIN
	SELECT top(1) IdMascota FROM Mascota Order By IdMascota Desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarMascota]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MostrarMascota]
	@pIdMascota int
AS
BEGIN
	select * FROM Mascota WHERE IdMascota = @pIdMascota
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarMascotas]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarMascotas]
    @pIdDueno int
AS
BEGIN
	SELECT IdMascota, Nombre, Foto FROM Mascota WHERE IdDueno = @pIdDueno
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarNotas]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarNotas]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Nota WHERE IdMascota = @pIdMascota
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarRaza]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarRaza]

AS
BEGIN
	SELECT * FROM Raza;
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarVacunas]    Script Date: 19/4/2024 09:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarVacunas]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Vacuna
	INNER JOIN [VACUNAS x MASCOTAS] ON Vacuna.IdVacuna = [VACUNAS x MASCOTAS].IdVacuna
	INNER JOIN Mascota ON Mascota.IdMascota = [VACUNAS x MASCOTAS].IdMascota
	WHERE Mascota.IdMascota = @pIdMascota
END
GO
USE [master]
GO
ALTER DATABASE [MiMascota] SET  READ_WRITE 
GO
