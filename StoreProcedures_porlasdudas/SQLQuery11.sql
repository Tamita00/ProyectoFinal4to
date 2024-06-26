USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarVacunas]    Script Date: 28/11/2023 08:16:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_MostrarVacunas]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Vacuna
	INNER JOIN [VACUNAS x MASCOTAS] ON Vacuna.IdVacuna = [VACUNAS x MASCOTAS].IdVacuna
	INNER JOIN Mascota ON Mascota.IdMascota = [VACUNAS x MASCOTAS].IdMascota
	WHERE Mascota.IdMascota = @pIdMascota
END