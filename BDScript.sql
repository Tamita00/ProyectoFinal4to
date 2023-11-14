USE [master]
GO
/****** Object:  Database [MiMascota]    Script Date: 9/11/2023 09:09:28 ******/
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
/****** Object:  User [alumno]    Script Date: 9/11/2023 09:09:29 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Antecedente]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  Table [dbo].[Dueno]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dueno](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dueno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  Table [dbo].[Nota]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  Table [dbo].[Vacuna]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacuna](
	[IdVacuna] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[FechaDosis] [date] NOT NULL,
	[FechaCaducidad] [date] NOT NULL,
	[Fecha2Dosis] [date] NULL,
	[Fecha2Caducidad] [date] NULL,
	[Fecha3Dosis] [date] NULL,
	[Fecha3Caducidad] [date] NULL,
 CONSTRAINT [PK_Vacuna] PRIMARY KEY CLUSTERED 
(
	[IdVacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VACUNAS x MASCOTAS]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VACUNAS x MASCOTAS](
	[IdVacuna] [int] NOT NULL,
	[IdMascota] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dueno] ON 

INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (1, 12345678, N'Leo', N'leo.kristal@gmail.com', N'1234')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (2, 12345678, N'Leo', N'leo.kristal@gmail.com', N'1234')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (3, 9876545, N'Luca', N'luca@gmial.com', N'1234')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (4, 47961890, N'Thiago', N'pala@gmail.com', N'6575')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (5, 72828821, N'Agos', N'agostinaBottarini090@gmail.com', N'lila1')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (6, 98867649, N'Agos', N'agostina@gmail.com', N'8765')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (7, 9876543, N'Maxi', N'maximiliano87@gmail.com', N'maxiOjo')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (8, 64564564, N'David', N'david@gamil.com', N'davidFutbol')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (9, 78327312, N'olivia', N'oliviaDiarloMatsuo@gmail.com', N'lolaa')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (10, 47980909, N'Joaco', N'JoaquinRulos@gmail.com', N'calisteña')
INSERT [dbo].[Dueno] ([Id], [DNI], [Nombre], [Email], [Contraseña]) VALUES (11, 47980987, N'ianbajo', N'ianchiqui@gmail.com', N'ColoradoPuto')
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
SET IDENTITY_INSERT [dbo].[Mascota] OFF
GO
ALTER TABLE [dbo].[Antecedente]  WITH CHECK ADD  CONSTRAINT [FK_Antecedente_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([IdMascota])
GO
ALTER TABLE [dbo].[Antecedente] CHECK CONSTRAINT [FK_Antecedente_Mascota]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_Dueno] FOREIGN KEY([IdDueno])
REFERENCES [dbo].[Dueno] ([Id])
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
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS] CHECK CONSTRAINT [FK_VACUNAS x MASCOTAS_Mascota]
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS]  WITH CHECK ADD  CONSTRAINT [FK_VACUNAS x MASCOTAS_Vacuna] FOREIGN KEY([IdVacuna])
REFERENCES [dbo].[Vacuna] ([IdVacuna])
GO
ALTER TABLE [dbo].[VACUNAS x MASCOTAS] CHECK CONSTRAINT [FK_VACUNAS x MASCOTAS_Vacuna]
GO
/****** Object:  StoredProcedure [dbo].[sp_CambiarContrasena]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearAntecedente]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearDueno]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearMascota]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CrearNota]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearNota]
    @pLugar varchar(50),
	@pInfo varchar(50),
	@pFecha date
AS
BEGIN
	INSERT INTO Nota(Lugar, Fecha, Info)
	VALUES (@pLugar, @pFecha, @pInfo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearVacuna]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CrearVacuna]
    @pTipo varchar(50),
	@pFechaDosis date,
	@pFechaCaducidad date
AS
BEGIN
	INSERT INTO Vacuna(Tipo, FechaDosis, FechaCaducidad)
	VALUES (@pTipo, @pFechaDosis, @pFechaCaducidad)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarAntecedentes]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MostrarDatosPersonales]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarDatosPersonales]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Mascota
	INNER JOIN Dueno ON Mascota.IdDueno = Dueno.Id
	WHERE Mascota.IdMascota = @pIdMascota
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarDueno]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MostrarIdDueno]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarIdDueno]
AS
BEGIN
	SELECT top(1) Id FROM Dueno Order By Id Desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarIdMascota]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MostrarMascotas]    Script Date: 9/11/2023 09:09:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_MostrarNotas]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarNotas]
    @pIdMascota int,
	@FechaAhora date
AS
BEGIN
	SELECT * FROM Nota WHERE IdMascota = @pIdMascota AND Fecha = @FechaAhora
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarVacunaEspecifica]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarVacunaEspecifica]
    @pIdMascota int,
	@pIdVacuna int
AS
BEGIN
	SELECT * FROM Vacuna
	INNER JOIN [VACUNAS x MASCOTAS] ON Vacuna.IdVacuna = [VACUNAS x MASCOTAS].IdVacuna
	INNER JOIN Mascota ON Mascota.IdMascota = [VACUNAS x MASCOTAS].IdMascota
	WHERE Mascota.IdMascota = @pIdMascota AND Vacuna.IdVacuna = @pIdVacuna
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarVacunas]    Script Date: 9/11/2023 09:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarVacunas]
    @pIdMascota int
AS
BEGIN
	SELECT Nombre FROM Vacuna
	INNER JOIN [VACUNAS x MASCOTAS] ON Vacuna.IdVacuna = [VACUNAS x MASCOTAS].IdVacuna
	INNER JOIN Mascota ON Mascota.IdMascota = [VACUNAS x MASCOTAS].IdMascota
	WHERE Mascota.IdMascota = @pIdMascota
END

GO
USE [master]
GO
ALTER DATABASE [MiMascota] SET  READ_WRITE 
GO
