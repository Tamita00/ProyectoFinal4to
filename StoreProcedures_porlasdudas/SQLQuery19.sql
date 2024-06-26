USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreaVacuna]    Script Date: 28/11/2023 07:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CreaVacuna]
    @pTipo varchar(50),
	@pfecha1 date,
	@pfecha10 date,
	@pIdMascota int
AS
BEGIN
	INSERT INTO Vacuna(Tipo, fecha1, fecha10)
	VALUES (@pTipo, @pfecha1, @pfecha10)


	DECLARE @IdVacuna int
	SET @IdVacuna = (SELECT top(1) IdVacuna FROM Vacuna Order By IdVacuna Desc)

	INSERT INTO [VACUNAS x MASCOTAS](IdVacuna, IdMascota)
	VALUES (@IdVacuna, @pIdMascota)
END
