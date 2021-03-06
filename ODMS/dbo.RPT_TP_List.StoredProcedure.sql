USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[RPT_TP_List]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_TP_List]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)

AS
BEGIN
	SELECT DISTINCT
  (t1.id),
  t1.[name]

FROM [ODMS].[dbo].[tblt_TradePromotion] AS t1
INNER JOIN [ODMS].[dbo].tblt_TradePromotionDBhouseMapping AS t2
  ON t1.id = t2.promo_id
WHERE (t1.start_date BETWEEN @Start_Date AND @End_Date
AND is_active = 1
AND t2.db_id IN (SELECT Value FROM dbo.FunctionStringtoIntlist(@dbids, ',')))
OR (end_date BETWEEN @Start_Date AND @End_Date
AND is_active = 1
AND t2.db_id IN (SELECT Value FROM dbo.FunctionStringtoIntlist(@dbids, ',')))
END

GO
