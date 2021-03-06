USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[DayEnd_PSRWiseSKUWiseOrder]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DayEnd_PSRWiseSKUWiseOrder]
	@Db_id int,
	@BatchDate Datetime	
AS
BEGIN
DELETE FROM [ODMSBI].[dbo].[tblr_PSRWiseSKUWiseOrder] where [BatchDate]=@BatchDate AND [DB_id]=@Db_id;
INSERT INTO [ODMSBI].[dbo].[tblr_PSRWiseSKUWiseOrder]
           ([DB_id]
           ,[BatchDate]
           ,[PSRId]
           ,[PSRName]
           ,[SKUId]
           ,[SKUName]
           ,[PackSize]
           ,[SKUVolume8oz]
           ,[UnitPrice]
           ,[Order_Quentity]
           ,[Confirmed_Quantity]
           ,[FreeOrder_Quentity]
           ,[FreeConfirmed_Quantity])
SELECT A.distributionid                    AS DB_id, 
       @BatchDate                         AS BatchDate, 
       A.id                                AS PSRId, 
       A.NAME                              AS PSRName, 
       B.sku_id                            AS SKUId, 
       B.skuname                           AS SKUName, 
       B.pack_size                         AS PackSize, 
       B.skuvolume_8oz                     AS SKUVolume8oz, 
	   Isnull(C.unit_sale_price, 0)        AS UnitPrice
	,Isnull(C.Order_Quentity, 0) AS Order_Quentity
	,Isnull(C.Confirmed_Quantity, 0) AS Confirmed_Quantity
	,Isnull(D.FreeOrder_Quentity, 0) AS FreeOrder_Quentity
	,Isnull(D.FreeConfirmed_Quantity, 0) AS FreeConfirmed_Quantity
FROM tbld_distribution_employee AS A
INNER JOIN (
	SELECT DISTINCT t1.db_id
		,t1.psr_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size,
		 t3.SKUVolume_8oz
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
	WHERE t1.planned_order_date = @BatchDate 
	) AS B ON A.DistributionId = B.db_id
	AND A.id = B.psr_id
LEFT JOIN (
	SELECT t1.db_id
		,t1.psr_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size
		,t2.unit_sale_price
		,sum(t2.quantity_ordered) AS Order_Quentity
		,sum(t2.quantity_confirmed) AS Confirmed_Quantity
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
	WHERE t1.planned_order_date = @BatchDate 
		AND t2.sku_order_type_id = 1
	GROUP BY t1.db_id
		,t1.psr_id
		,t3.SKUName
		,t2.sku_id
		,t2.Pack_size
		,t2.unit_sale_price
	) AS C ON A.DistributionId = C.db_id
	AND A.id = C.psr_id
	AND B.sku_id = C.sku_id
LEFT JOIN (
	SELECT t1.db_id
		,t1.psr_id
		,t2.sku_id
		,t3.SKUName
		,t2.Pack_size
		,sum(t2.quantity_ordered) AS FreeOrder_Quentity
		,sum(t2.quantity_confirmed) AS FreeConfirmed_Quantity
	FROM tblt_Order AS t1
	INNER JOIN tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
	LEFT JOIN tbld_SKU AS t3 ON t2.sku_id = t3.SKU_id
	WHERE t1.planned_order_date = @BatchDate 
		AND t2.sku_order_type_id = 2
	GROUP BY t1.db_id
		,t1.psr_id
		,t3.SKUName
		,t2.sku_id
		,t2.Pack_size
	) AS D ON A.DistributionId = D.db_id
	AND A.id = D.psr_id
	AND B.sku_id = D.sku_id
WHERE A.active = 1	AND A.emp_type = 2	AND A.distributionid = @Db_id
	
END

GO
