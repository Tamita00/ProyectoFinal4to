USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaVacuna]    Script Date: 28/11/2023 08:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_EliminaVacuna] 
	@pIdVacuna int
AS
BEGIN
	DELETE FROM Vacuna WHERE IdVacuna = @pIdVacuna
	
	DELETE FROM [VACUNAS x MASCOTAS] WHERE IdVacuna = @pIdVacuna
END
