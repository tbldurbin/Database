USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[RPT_ChallanVsDelivery]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_ChallanVsDelivery]
	-- Add the parameters for the stored procedure here
	@Challan_no int
AS
BEGIN
SELECT t4.SKUName,t1.sku_id, t1.batch_id,t1.Pack_size, t1.Total_qty AS Total_qty,ISNULL(A.Total_delivered,0) AS Total_delivered, t2.outlet_id,t6.OutletName,ISNULL(B.Total_delivered,0) As Delivery,ISNULL(C.Total_delivered,0) As FreeDelivery
FROM     tblt_Challan_line AS t1 
INNER JOIN tblt_Order AS t2 ON t2.Challan_no= t1.challan_id
INNER JOIN tbld_Outlet AS t6 on t2.outlet_id=t6.OutletId 
Right JOIN tbld_SKU AS t4 ON t1.sku_id = t4.SKU_id 

LEFT JOIN (SELECT y1.outlet_id,y2.sku_id ,SUM(y2.quantity_delivered) AS Total_delivered 
FROM  tblt_Order AS y1
INNER JOIN tblt_Order_line AS y2 ON y2.Orderid = y1.Orderid 
WHERE y1.Challan_no=@Challan_no AND y1.so_status!=9 AND y2.sku_order_type_id=1
GROUP BY y1.outlet_id, y2.sku_id		  
			) as B  ON t1.sku_id= B.sku_id AND B.outlet_id=t2.outlet_id

LEFT JOIN (SELECT y1.outlet_id,y2.sku_id ,SUM(y2.quantity_delivered) AS Total_delivered 
FROM  tblt_Order AS y1
INNER JOIN tblt_Order_line AS y2 ON y2.Orderid = y1.Orderid 
WHERE y1.Challan_no=@Challan_no AND y1.so_status!=9 AND y2.sku_order_type_id=2
GROUP BY y1.outlet_id,y2.sku_id		  
			) as C  ON t1.sku_id= C.sku_id AND C.outlet_id=t2.outlet_id

LEFT JOIN ( SELECT x2.sku_id, x2.Betch_id,SUM(x2.quantity_delivered) AS Total_delivered 
			FROM  tblt_Order AS x1
			INNER JOIN tblt_Order_line AS x2 ON x2.Orderid = x1.Orderid 
			WHERE x1.Challan_no=@Challan_no AND x1.so_status!=9
			GROUP BY x1.db_id, x2.sku_id, x2.Betch_id				  			  
			) as A  ON t1.sku_id= A.sku_id 
						

WHERE  (t1.challan_id = @Challan_no) 
group by t1.sku_id,t2.outlet_id, t1.batch_id,t1.Pack_size, t1.Total_qty ,t6.OutletName,t4.SKUName,A.Total_delivered,B.Total_delivered,C.Total_delivered
order by t1.sku_id,t2.outlet_id
END

GO
