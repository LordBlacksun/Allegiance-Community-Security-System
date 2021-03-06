USE CSSStats
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tigereye
-- Create date: October 29th, 2008
-- Description:	Calculates the AllegSkill rank based on the specified Mu and Sigma values
-- =============================================
-- DROP FUNCTION [dbo].[AS_GetRank]
CREATE FUNCTION [dbo].[AS_GetRank]
(
	@Mu FLOAT,
	@Sigma FLOAT
)
RETURNS FLOAT
AS
BEGIN
	DECLARE @Result FLOAT;
		SET @Result = (@Mu - (3.0 * @Sigma)) * (3.0 / 5.0);
	
	IF (@Result < 0.0) SET @Result = 0.0
	
	RETURN @Result;
END
GO
