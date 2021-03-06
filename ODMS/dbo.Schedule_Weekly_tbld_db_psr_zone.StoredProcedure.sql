USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_db_psr_zone]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_db_psr_zone]
AS
	BEGIN
	TRUNCATE TABLE [ODMSBI].[dbo].[tbld_db_psr_zone];

INSERT INTO [ODMSBI].[dbo].[tbld_db_psr_zone]([National_id]
      ,[National]
      ,[REGION_id]
      ,[REGION_Name]
      ,[AREA_id]
      ,[AREA_Name]
      ,[CEAREA_id]
      ,[CEAREA_Name]
      ,[DB_Id]
      ,[DB_Name]
      ,[Status]
      ,[PriceBuandle_id]
      ,[Name]
      ,[PSR_id]
      ,[PSR_Code]
      ,[DBCode]
      ,[OfficeAddress]
      ,[cluster])
           
SELECT dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National],REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name,    dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name,
                  dbo.tbld_distribution_house.Status, dbo.tbld_distribution_house.PriceBuandle_id, dbo.tbld_distribution_employee.Name, dbo.tbld_distribution_employee.id AS PSR_id, dbo.tbld_distribution_employee.Emp_code AS PSR_Code, 
                  dbo.tbld_distribution_house.DBCode, dbo.tbld_distribution_house.OfficeAddress, dbo.tbld_cluster.name AS cluster
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id INNER JOIN
                  dbo.tbld_distribution_employee ON dbo.tbld_distribution_house.DB_Id = dbo.tbld_distribution_employee.DistributionId INNER JOIN
                  dbo.tbld_cluster ON dbo.tbld_distribution_house.Cluster_id = dbo.tbld_cluster.id
WHERE  (dbo.tbld_distribution_employee.Emp_Type = 2)
END
GO
