USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarNotas]    Script Date: 22/11/2023 10:15:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_MostrarNotas]
    @pIdMascota int
AS
BEGIN
	SELECT * FROM Nota WHERE IdMascota = @pIdMascota
END
