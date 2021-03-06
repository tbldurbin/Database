USE [ODMSBI]
GO
/****** Object:  StoredProcedure [dbo].[RPT_Delivery_PSRWiseSKUWiseDelivery]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Delivery_PSRWiseSKUWiseDelivery]
	@Start_Date Datetime,
	@End_Date Datetime,
	@dbids Varchar(MAX),
	@skuids Varchar(MAX)
AS
BEGIN
	SELECT A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name, B.PSRId, B.PSRName, B.SKUId, B.SKUName, B.PackSize, 
                  B.SKUVolume8oz, B.UnitPrice, SUM(B.Delivered_Quentity)AS Delivered_Quentity, SUM(B.FreeDelivered_Quentity)AS FreeDelivered_Quentity
FROM     tbld_db_zone AS A INNER JOIN
                  tblr_PSRWiseSKUWiseDelivery AS B ON A.DB_Id = B.DB_id
				  where A.Status=1 and  (B.BatchDate between @Start_Date AND @End_Date) AND A.DB_Id IN (select Value FROM dbo.FunctionStringtoIntlist(@dbids,',')) AND B.SKUId IN (select Value FROM dbo.FunctionStringtoIntlist(@skuids,','))
				  GROUP BY A.DB_Id, A.DB_Name, A.CEAREA_id, A.CEAREA_Name, A.AREA_id, A.AREA_Name, A.REGION_id, A.REGION_Name,B.PSRId, B.PSRName, B.SKUId, B.SKUName, B.PackSize, 
                  B.SKUVolume8oz, B.UnitPrice

END


GO
