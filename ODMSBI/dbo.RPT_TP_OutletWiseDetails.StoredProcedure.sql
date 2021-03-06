USE [ODMSBI]
GO
/****** Object:  StoredProcedure [dbo].[RPT_TP_OutletWiseDetails]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[RPT_TP_OutletWiseDetails]
		@Start_Date Datetime,
		@End_Date Datetime,
		@dbids Varchar(MAX),
	    @Promo_id Varchar(MAX)
AS
BEGIN
SELECT D.REGION_id, D.AREA_id, D.CEAREA_id,D.REGION_Name,D.AREA_Name,  D.CEAREA_Name, D.DBCode, D.DB_Name, D.Name As PSR,  D.PSR_Code,
                  D.RouteName, D.OutletCode, D.OutletName, D.Address, D.OwnerName, D.ContactNo, D.channel_name, D.outlet_category_name, D.Outlet_grade, B.id AS TPid, B.name AS TPName,  A.planned_order_date, 
                  A.delivery_date,A.Orderid,A.so_id, E.SKUName,A.Pack_size, A.unit_sale_price, A.sku_order_type_id, SUM(A.quantity_ordered) AS quantity_ordered, SUM(A.quantity_delivered) AS quantity_delivered
FROM     ODMSBI.dbo.tblr_OrderDetails AS A INNER JOIN
                  ODMS.dbo.tblt_TradePromotion AS B ON A.promotion_id = B.id INNER JOIN
                  ODMSBI.dbo.tbld_db_psr_outlet_zone AS D ON A.outlet_id = D.OutletId
				INNER JOIN
                  ODMSBI.dbo.tbld_sku_list AS E ON A.sku_id = E.SKU_id
WHERE  (A.db_id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,','))) and A.promotion_id IN (select Value FROM dbo.FunctionStringtoIntlist(@Promo_id,',')) AND A.planned_order_date between @Start_Date and @End_Date
GROUP BY B.id, B.name, A.db_id, A.outlet_id, D.OutletName, A.planned_order_date, A.delivery_date, A.so_id, E.SKUName,A.Pack_size, A.unit_sale_price, A.sku_order_type_id,D.REGION_Name,D.AREA_Name,  D.CEAREA_Name, D.DBCode, D.DB_Name, D.Name ,  D.PSR_Code,D.REGION_id, D.AREA_id, D.CEAREA_id,A.Orderid,
                  D.RouteName, D.OutletCode, D.OutletName, D.Address, D.OwnerName, D.ContactNo, D.channel_name, D.outlet_category_name, D.Outlet_grade
ORDER BY D.REGION_id, D.AREA_id, D.CEAREA_id, A.db_id, A.planned_order_date, b.id, A.outlet_id,A.Orderid ,A.Pack_size, A.sku_order_type_id
END


GO
