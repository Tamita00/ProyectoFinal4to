USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarNotas]    Script Date: 27/11/2023 10:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_MostrarNotas]
    @pIdMascota int,
	@FechaAhora date
AS
BEGIN
	SELECT * FROM Nota WHERE IdMascota = @pIdMascota
END
