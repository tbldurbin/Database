USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[DBWisezone]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DBWisezone]

AS
BEGIN
SELECT dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name, REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National], 
                  dbo.tbld_distribution_house.Status
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id
END

GO
