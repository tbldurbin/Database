USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_Outlet]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_Outlet]	
	
AS
BEGIN

TRUNCATE TABLE [ODMSBI].[dbo].[tbld_Outlet];
INSERT INTO [ODMSBI].[dbo].[tbld_Outlet]
           ([OutletId]
           ,[OutletCode]
           ,[OutletName]
           ,[OutletName_b]
           ,[Location]
           ,[Address]
           ,[GpsLocation]
           ,[OwnerName]
           ,[ContactNo]
           ,[Distributorid]
           ,[HaveVisicooler]
           ,[parentid]
           ,[outlet_category_id]
           ,[grading]
           ,[channel]
           ,[Latitude]
           ,[Longitude]
           ,[picture]
           ,[IsActive]
           ,[createdate])
SELECT  [OutletId]
      ,[OutletCode]
      ,[OutletName]
      ,[OutletName_b]
      ,[Location]
      ,[Address]
      ,[GpsLocation]
      ,[OwnerName]
      ,[ContactNo]
      ,[Distributorid]
      ,[HaveVisicooler]
      ,[parentid]
      ,[outlet_category_id]
      ,[grading]
      ,[channel]
      ,[Latitude]
      ,[Longitude]
      ,[picture]
      ,[IsActive]
      ,[createdate]
  FROM [ODMS].[dbo].[tbld_Outlet]
END

GO
