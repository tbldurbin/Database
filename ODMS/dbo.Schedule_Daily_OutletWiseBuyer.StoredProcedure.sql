USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Daily_OutletWiseBuyer]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Daily_OutletWiseBuyer]

AS
BEGIN
DECLARE @BatchDeliveryDate date;

Set @BatchDeliveryDate = CAST(GETDATE()as date);
	

INSERT INTO [ODMSBI].[dbo].[tblr_OutletWiseBuyer]
           ([BatchDate]
           ,[BatchDeliveryDate]
           ,[DB_id]
           ,[Orderid]
           ,[outlet_id]
           ,[sku_id])
		    SELECT  A.planned_order_date As BatchDate,A.delivery_date As BatchDeliveryDate,A.db_id, A.Orderid,A.outlet_id,B.sku_id 
From [ODMS].[dbo].tblt_Order As A 
INNER JOIN [ODMS].[dbo].tblt_Order_line AS B ON A.Orderid = B.Orderid 
where B.sku_order_type_id=1 AND B.lpec=1 AND  CAST(A.delivery_Process_Date as date) = @BatchDeliveryDate  AND A.so_status=3
END

GO
