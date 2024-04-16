USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearDueno]    Script Date: 12/4/2024 11:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarRaza]
@RazaReci varchar(8000)
AS
BEGIN
	SELECT * FROM Raza;
	
END
