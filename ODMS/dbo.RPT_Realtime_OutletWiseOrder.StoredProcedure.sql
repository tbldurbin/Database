USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[RPT_Realtime_OutletWiseOrder]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Realtime_OutletWiseOrder]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX)
AS
BEGIN
SELECT t4.REGION_Name, t4.AREA_Name, t4.CEAREA_Name,  t4.DB_Id, t4.DB_Name, t4.DBCode,t4.Cluster, t4.OfficeAddress,t4.PSR_id,T4.Name As PSR_Name,t5.RouteID,t5.RouteName,t4.OutletCode, t4.OutletName, 
                  t1.outlet_id, t2.sku_id,t6.SKUName, t2.Betch_id, t2.Pack_size, t2.unit_sale_price, t2.sku_order_type_id, sum(t2.quantity_ordered) AS quantity_ordered, sum(t2.quantity_confirmed) As quantity_confirmed, Sum(t2.quantity_ordered*t2.unit_sale_price)As OrderAmount,t4.REGION_id,t4.AREA_id, t4.CEAREA_id
FROM     tblt_Order AS t1 INNER JOIN
                  tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid Inner JOIN
                  tbld_db_psr_outlet_zone_view AS t4 ON t1.outlet_id = t4.OutletId left JOIN
                  tbld_distributor_Route AS t5 ON t5.RouteID = t4.parentid Inner join 
				  tbld_SKU As t6 on t2.sku_id=t6.SKU_id
				  Where t4.Distributorid IN
                      (SELECT Value
                       FROM      dbo.FunctionStringtoIntlist(@dbids, ',')) and  planned_order_date between @Start_Date AND  @End_Date and t4.IsActive=1
GROUP BY t1.outlet_id, t2.sku_id,t6.SKUName,t4.DB_Id, t4.DB_Name,T4.Name, t4.CEAREA_id, t4.CEAREA_Name, t4.AREA_id, t4.AREA_Name, t4.REGION_id, t4.REGION_Name, t4.National_id, t4.[National], t4.Status, t4.Cluster, t4.DBCode, t4.OfficeAddress,t4.OutletName,t2.Betch_id, t2.Pack_size, t2.unit_sale_price, t2.sku_order_type_id,t4.OutletCode,t5.RouteID,t5.RouteName,t4.PSR_id
Order by  t4.REGION_id,t4.AREA_id, t4.CEAREA_id,t4.DB_Id,t4.PSR_id



END

GO
