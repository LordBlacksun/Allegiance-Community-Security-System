USE CSSStats
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tigereye
-- Create date: August 31, 2008
-- Description:	This file is transcribed by Tigereye from the AllegSkill implementation written by Sgt_Baker. 
--              This function is transcribed from CAllegSkill.cs, line 176 "public double InvErf(double x)
-- =============================================
CREATE FUNCTION [dbo].AS_GetInvErf (@x FLOAT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @Y FLOAT;
		SET @Y = @x + ((PI() * Power(@x, 3)) / 12.0) +
            ((7 * Power(PI(), 2) * Power(@x, 5)) / 480.0) +
            ((127 * Power(PI(), 3) * Power(@x, 7)) / 40320.0) +
            ((4369 * Power(PI(), 4) * Power(@x, 9)) / 5806080.0) +
            ((34807 * Power(PI(), 5) * Power(@x, 11)) / 182476800.0);
	
	RETURN 0.5 * Sqrt(PI()) * @Y;
END
