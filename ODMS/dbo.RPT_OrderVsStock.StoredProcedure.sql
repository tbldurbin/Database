USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[RPT_OrderVsStock]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_OrderVsStock] 	
	@DBID int
AS
BEGIN
	SELECT t2.db_id,t2.psr_id,t7.Name as PsrName,t5.skuId,t5.qtyPs As stockQty,A.quantity_ordered as orderQty,t4.SKUName, t1.sku_id, t1.Betch_id,t1.Pack_size,t6.OutletId,t6.OutletName,SUM(t1.quantity_ordered) AS quantity_ordered
FROM     tblt_Order AS t2 
INNER JOIN tblt_Order_line AS t1 ON t2.Orderid = t1.Orderid 
INNER JOIN tbld_Outlet AS t6 on t2.Orderid=t6.OutletId 
INNER JOIN tbld_SKU AS t4 ON t1.sku_id = t4.SKU_id 
INNER JOIN tbld_distribution_employee AS t7 ON t7.id=t2.psr_id
LEFT JOIN ( SELECT x1.db_id, x2.sku_id, x2.Betch_id,SUM(x2.quantity_ordered) AS quantity_ordered 
			FROM  tblt_Order AS x1
			INNER JOIN tblt_Order_line AS x2 ON x2.Orderid = x1.Orderid 
			WHERE x1.db_id=@DBID AND x1.so_status=1
			GROUP BY x1.db_id, x2.sku_id, x2.Betch_id				  			  
			) as A  ON t1.sku_id= A.sku_id AND t2.db_id=A.db_id AND A.Betch_id=t1.Betch_id
LEFT JOIN tblt_inventory as t5 ON t1.sku_id= t5.skuId AND t2.db_id=t5.dbId AND t1.Betch_id=t5.batchNo 
WHERE t2.db_id=@DBID AND t2.so_status=1
GROUP BY t2.db_id,t2.psr_id,t7.Name,t1.sku_id, t1.Betch_id,  t1.Pack_size, t4.SKUName,t5.skuId,t5.qtyPs,t6.OutletId,t6.OutletName,A.quantity_ordered
ORDER BY t2.db_id,t1.sku_id, t1.Betch_id
END

GO
