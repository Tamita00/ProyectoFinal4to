USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarRaza]    Script Date: 16/4/2024 10:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_MostrarRaza]

AS
BEGIN
	SELECT * FROM Raza;
	
END
