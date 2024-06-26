USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearAntecedente]    Script Date: 27/11/2023 10:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CrearAntecedente]
    @pIdMascota int,
	@pLugar varchar(50),
	@pFecha date,
	@pInfo varchar(50)
AS
BEGIN
	INSERT INTO Antecedente(IdMascota, Lugar, Fecha, Info)
	VALUES (@pIdMascota, @pLugar, @pFecha, @pInfo)
END
