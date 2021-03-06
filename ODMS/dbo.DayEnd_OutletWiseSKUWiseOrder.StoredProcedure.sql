USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[DayEnd_OutletWiseSKUWiseOrder]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_OutletWiseSKUWiseOrder] @Db_id int,
@BatchDate datetime

AS
BEGIN
  DELETE FROM [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseOrder]  WHERE [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseOrder].BatchDate = @BatchDate
    AND [tblr_OutletWiseSKUWiseOrder].Distributorid = @Db_id; --Delete if Data Exist
  INSERT INTO [ODMSBI].[dbo].[tblr_OutletWiseSKUWiseOrder] ([BatchDate]
  , [OutletId]
  , [OutletCode]
  , [OutletName]
  , [Distributorid]
  , [HaveVisicooler]
  , [SKUId]
  , [SKUName]
  , [PackSize]
  , [UnitPrice]
  , [SKUVolume8oz]
  , [Order_Quentity]
  , [Confirmed_Quantity]
  , [FreeOrder_Quentity]
  , [FreeConfirmed_Quantity])
    SELECT
      @BatchDate AS BatchDate,
      A.OutletId,
      A.OutletCode,
      A.OutletName,
      A.Distributorid,
      A.HaveVisicooler,
      B.SKUId,
      B.SKUName,
      B.Pack_size AS PackSize,
      ISNULL(B.unit_sale_price, 0) AS UnitPrice,
      B.SKUVolume_8oz AS SKUVolume8oz,
      ISNULL(B.quantity_ordered, 0) AS Order_Quentity,
      ISNULL(B.quantity_confirmed, 0) AS Confirmed_Quantity,
      ISNULL(B.FreeOrder_Quentity, 0) AS FreeOrder_Quentity,
      ISNULL(B.FreeConfirmed_Quantity, 0) AS FreeConfirmed_Quantity
    FROM [ODMS].[dbo].tbld_Outlet AS A
    INNER JOIN (SELECT
      t1.outlet_id,
      t1.db_id,
      t2.sku_id AS SKUId,
      t3.SKUName,
      t2.Pack_size,
      t2.unit_sale_price,
      t3.SKUVolume_8oz,
      SUM(CASE WHEN t2.sku_order_type_id = 1 THEN t2.quantity_ordered ELSE 0 END) AS quantity_ordered,
      SUM(CASE WHEN t2.sku_order_type_id = 1 THEN t2.quantity_confirmed ELSE 0 END) AS quantity_confirmed,
      SUM(CASE WHEN t2.sku_order_type_id = 2 THEN t2.quantity_confirmed ELSE 0 END) AS FreeOrder_Quentity,
      SUM(CASE WHEN t2.sku_order_type_id = 2 THEN t2.quantity_confirmed ELSE 0 END) AS FreeConfirmed_Quantity
    FROM tblt_Order AS t1  INNER JOIN 
	tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
    LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
    WHERE t1.planned_order_date = @BatchDate AND t1.so_status <> 9 AND t1.db_id=@Db_id
    GROUP BY t1.outlet_id,
             t1.db_id,
             t2.sku_id,
             t3.SKUName,
             t2.Pack_size,
             t2.unit_sale_price,
             t3.SKUVolume_8oz) AS B
      ON A.Distributorid = B.db_id
      AND A.OutletId = B.outlet_id
	  Where A.Distributorid=@Db_id
END


GO
