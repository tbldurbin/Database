USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Daily_OrderDetails]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Daily_OrderDetails]	
AS
BEGIN

DECLARE @BatchDeliveryStartDate date;
DECLARE @BatchDeliveryEndDate date;

Set @BatchDeliveryStartDate =CAST((dateadd(day,-30, getdate())) as date);
Set @BatchDeliveryEndDate = CAST(GETDATE()as date);

DELETE FROM [ODMSBI].[dbo].[tblr_OrderDetails] WHERE delivery_Process_Date between @BatchDeliveryStartDate AND @BatchDeliveryEndDate ;

INSERT INTO [ODMSBI].[dbo].[tblr_OrderDetails]
           ([db_id]
           ,[psr_id]
		   ,so_id
           ,[planned_order_date]
           ,[delivery_date]
           ,[delivery_Process_Date]
           ,[Orderid]
           ,[outlet_id]
           ,[Challan_no]
           ,[sku_id]
           ,[Betch_id]
           ,[Pack_size]
           ,[unit_sale_price]
           ,[sku_order_type_id]
           ,[promotion_id]
           ,[quantity_ordered]
           ,[quantity_confirmed]
           ,[quantity_delivered]
           ,[total_sale_price])
SELECT t1.db_id, t1.psr_id,t1.so_id ,t1.planned_order_date, t1.delivery_date, t1.delivery_Process_Date, t1.Orderid, t1.outlet_id, t1.Challan_no, t2.sku_id, t2.Betch_id, t2.Pack_size, t2.unit_sale_price, 
                  t2.sku_order_type_id, t2.promotion_id, t2.quantity_ordered, t2.quantity_confirmed, t2.quantity_delivered, t2.total_sale_price
FROM     [ODMS].[dbo].tblt_Order AS t1 INNER JOIN
                  [ODMS].[dbo].tblt_Order_line AS t2 ON t1.Orderid = t2.Orderid
				  Where CAST(t1.delivery_Process_Date as date) between @BatchDeliveryStartDate AND @BatchDeliveryEndDate AND t1.so_status=3
END

GO
