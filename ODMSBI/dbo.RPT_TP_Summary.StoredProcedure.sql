USE [ODMSBI]
GO
/****** Object:  StoredProcedure [dbo].[RPT_TP_Summary]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_TP_Summary]
		@Start_Date Datetime,
		@End_Date Datetime,
		@dbids Varchar(MAX),
	    @Promo_id Varchar(MAX)
AS
BEGIN
SELECT @Start_Date AS StartDate,@End_Date AS EndDate ,  F.REGION_Name, F.AREA_Name, F.CEAREA_Name, F.DB_Name, F.DBCode, F.OfficeAddress, F.cluster,C.db_id, 
       C.id                                 AS Promo_id, 
       C.NAME, 
       Stuff((SELECT ';' + B.condition_sku 
              FROM   (SELECT DISTINCT ( t1.condition_sku_id ), 
                                      t2.skuname AS condition_sku, 
                                      promo_id 
                      FROM   odms.dbo.tblt_tradepromotiondefinition AS t1 
                             LEFT JOIN ODMSBI.dbo.tbld_sku_list AS t2 
                                    ON t1.condition_sku_id = t2.sku_id 
                             
                      WHERE  t1.promo_line_type = 1) AS B 
              WHERE  C.id = B.promo_id 
              FOR xml path ('')), 1, 1, '') AS SKUList, 
			  Stuff((SELECT ';' + B.condition_sku 
              FROM   (SELECT DISTINCT ( t1.offer_sku_id ), 
                                      t2.skuname AS condition_sku, 
                                      promo_id 
                      FROM   odms.dbo.tblt_tradepromotiondefinition AS t1 
                             LEFT JOIN ODMSBI.dbo.tbld_sku_list AS t2 
                                    ON t1.offer_sku_id = t2.sku_id                             
                      WHERE  t1.promo_line_type = 2) AS B 
              WHERE  C.id = B.promo_id 
              FOR xml path ('')), 1, 1, '') AS FreeSKU,
       ISNULL(D.quantity_ordered,0) As quantity_ordered, 
	    ISNULL(D.quantity_delivered,0) As quantity_delivered,ISNULL(E.Free_quantity_ordered,0) As Free_quantity_ordered,ISNULL(E.Free_Amount_ordered,0)Free_Amount_ordered,ISNULL(E.Free_quantity_delivered,0) As Free_quantity_delivered
      ,ISNULL(E.Free_Amount_delivered,0) As Free_Amount_delivered
FROM   (SELECT A.db_id, 
               B.id, 
               B.NAME 
        FROM   ODMS.dbo.tblt_tradepromotiondbhousemapping AS A 
               INNER JOIN ODMS.dbo.tblt_tradepromotion AS B 
                       ON A.promo_id = B.id) AS C 
       LEFT JOIN (SELECT B.id                                    AS promo_id, 
                         A.db_id, 
                         Sum(CAST(A.quantity_ordered As float) / A.pack_size)   AS 
                         quantity_ordered, 
                         Sum(CAST(A.quantity_delivered As float) / A.pack_size) AS 
                         quantity_delivered 
                  FROM   odmsbi.dbo.tblr_orderdetails AS A 
                         INNER JOIN ODMS.dbo.tblt_tradepromotion AS B 
                                 ON A.promotion_id = B.id 
                  WHERE  A.sku_order_type_id = 1  and A.planned_order_date between @Start_Date and @End_Date
                  GROUP  BY B.id, 
                            B.NAME, 
                            A.db_id) AS D 
              ON C.db_id = D.db_id 
                 AND C.id = D.promo_id 
				 LEFT JOIN (SELECT B.id                                                   AS promo_id, 
       A.db_id, 
       Sum(Cast(A.quantity_ordered AS FLOAT) /A.pack_size)   AS 
       Free_quantity_ordered, 
	    Sum(Cast(A.quantity_ordered AS FLOAT) *D.db_lifting_price)   AS 
       Free_Amount_ordered, 
       Sum(Cast(A.quantity_delivered AS FLOAT) / A.pack_size) AS 
       Free_quantity_delivered ,
	   
       Sum(Cast(A.quantity_delivered AS FLOAT)  *D.db_lifting_price) AS 
       Free_Amount_delivered
FROM   ODMSBI.dbo.tblr_orderdetails AS A 
       INNER JOIN ODMS.dbo.tblt_tradepromotion AS B ON A.promotion_id = B.id 
	   Inner join ODMSBI.dbo.tbld_db_zone As C On A.db_id=C.DB_Id
	   Inner join ODMSBI.dbo.tbld_bundle_price_details As D on C.PriceBuandle_id=D.bundle_price_id AND A.sku_id=D.sku_id AND A.Betch_id=D.batch_id
	   
WHERE  A.sku_order_type_id = 2 and A.planned_order_date between @Start_Date and @End_Date
GROUP  BY B.id,           
          A.db_id ) AS E
              ON C.db_id = E.db_id 
                 AND C.id = E.promo_id 
				 Inner join ODMSBI.dbo.tbld_db_zone AS F ON F.DB_Id=C.db_id
WHERE  C.db_id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))  AND C.id IN (select Value FROM dbo.FunctionStringtoIntlist(@Promo_id,','))
GROUP  BY C.db_id, 
          C.id, 
          C.NAME, 
          D.quantity_ordered, 
          D.quantity_delivered,
		  E.Free_quantity_ordered,E.Free_Amount_ordered,E.Free_quantity_delivered,E.Free_Amount_delivered,F.REGION_Name, F.AREA_Name, F.CEAREA_Name, F.DB_Name, F.DBCode, F.OfficeAddress, F.cluster

END


GO
