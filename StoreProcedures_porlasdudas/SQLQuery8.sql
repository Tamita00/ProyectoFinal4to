USE [MiMascota]
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarIdDueno]    Script Date: 22/11/2023 09:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_MostrarIdDueno]
AS
BEGIN
	SELECT top(1) IdDueno FROM Dueno Order By IdDueno Desc
END
