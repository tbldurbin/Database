USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_TradepromotionDetails]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_TradepromotionDetails]	
@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)
	
AS
BEGIN
SELECT C.REGION_Name, C.AREA_Name, C.CEAREA_Name, C.DB_Id, C.DB_Name, C.Cluster, A.code, A.name, A.name AS Tp_name, A.description, A.start_date, A.end_date, A.is_active
FROM     tblt_TradePromotion AS A INNER JOIN
                  tblt_TradePromotionDBhouseMapping AS B ON A.id = B.promo_id INNER JOIN
                  tbld_db_zone_view AS C ON B.db_id = C.DB_Id
WHERE  (A.is_active = 1) AND (B.db_id IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ','))) AND A.start_date between @Start_Date AND @End_Date



END

GO
