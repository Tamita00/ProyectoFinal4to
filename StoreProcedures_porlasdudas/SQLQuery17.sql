USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaVacuna]    Script Date: 27/11/2023 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_EliminaVacuna] 
	@pIdVacuna int
AS
BEGIN
	DELETE FROM Vacuna WHERE IdVacuna = @pIdVacuna
END
