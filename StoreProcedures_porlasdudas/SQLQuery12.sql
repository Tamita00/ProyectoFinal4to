USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearNota]    Script Date: 23/11/2023 08:23:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CrearNota]
    @pIdMascota int,
	@pLugar varchar(50),
	@pFecha date,
	@pInfo varchar(50)
AS
BEGIN
	INSERT INTO Nota(IdMascota, Lugar, Fecha, Info)
	VALUES (@pIdMascota, @pLugar, @pFecha, @pInfo)
END
