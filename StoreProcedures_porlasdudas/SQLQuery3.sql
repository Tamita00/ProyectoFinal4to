USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarDatosPersonales]    Script Date: 21/11/2023 10:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_MostrarDatosPersonales]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Mascota
	INNER JOIN Dueno ON Mascota.IdDueno = Dueno.IdDueno
	WHERE Mascota.IdMascota = @pIdMascota
END
