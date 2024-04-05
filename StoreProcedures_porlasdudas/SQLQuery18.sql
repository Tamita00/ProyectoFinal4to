USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreaVacuna]    Script Date: 28/11/2023 07:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CreaVacuna]
    @pTipo varchar(50),
	@pfecha1 date,
	@pfecha10 date
AS
BEGIN
	INSERT INTO Vacuna(Tipo, fecha1, fecha10)
	VALUES (@pTipo, @pfecha1, @pfecha10)
END
