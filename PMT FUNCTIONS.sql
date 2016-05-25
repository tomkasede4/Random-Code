-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TOM
-- Create date: 20160525
-- Description:	REPLICATES THE EXCEL PMT FUNCTION
-- =============================================
CREATE PROCEDURE MONTHLYPAYMENT 
		@PRINCIPAL NUMERIC(18,10),@MONTHLY_RATE NUMERIC(18,10), @NUM_PAYMENTS INT, @MONTHLY NUMERIC(38,2)=0 OUTPUT
AS
BEGIN
	DECLARE @M NUMERIC(38,10)
	DECLARE @M1 NUMERIC(38,10)
	DECLARE @R1 NUMERIC (38,10)
	DECLARE @M2 NUMERIC(38,10)
	
	SET NOCOUNT ON;
	SET @MONTHLY_RATE = (@MONTHLY_RATE/1200)
	SET @R1 = (1 + @MONTHLY_RATE)
	SET @NUM_PAYMENTS = -@NUM_PAYMENTS
	SET @M1 = POWER(@R1,(@NUM_PAYMENTS))
	SET @M1 = 1-@M1
	SET @M2 = @MONTHLY_RATE/@M1
	SET @M = @PRINCIPAL * @M2
	SET @MONTHLY = @M
		
	--SELECT @M AS MONTHLYRENTAL
	--SELECT @MONTHLY AS MONTHLYRENTAL--EXCEL RETURNS TO 2 DP THUS
END
GO
