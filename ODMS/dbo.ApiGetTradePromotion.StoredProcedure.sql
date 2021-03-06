USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[ApiGetTradePromotion]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ApiGetTradePromotion]
	@dbid int
	As
BEGIN
SELECT A.id, A.name, A.code, A.description, A.TP_type, A.TPOffer_type, A.promotion_unit_id, A.promotion_sub_unit_id, CONVERT(date,A.start_date)AS start_date , CONVERT(date,A.end_date) As end_date
FROM     tblt_TradePromotion AS A INNER JOIN
                  tblt_TradePromotionDBhouseMapping As B ON A.id = B.promo_id
WHERE  (A.start_date <= CAST(GETDATE() AS DATE)) AND (A.end_date >= CAST(GETDATE() AS DATE)) AND (A.is_active = 1) AND B.db_id=@dbid AND B.status=1
END

GO
