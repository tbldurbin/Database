USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[Schedule_Weekly_tbld_Route_Plan_Mapping]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Schedule_Weekly_tbld_Route_Plan_Mapping]

AS
BEGIN

TRUNCATE TABLE [ODMSBI].[dbo].[tbld_Route_Plan_Mapping];

INSERT INTO [ODMSBI].[dbo].[tbld_Route_Plan_Mapping]
           ([db_id]
           ,[db_emp_id]
           ,[route_plan_id]
           ,[route_id]
           ,[day])
SELECT [db_id]
      ,[db_emp_id]
      ,[route_plan_id]
      ,[route_id]
      ,[day]
  FROM [ODMS].[dbo].[tbld_Route_Plan_Mapping]
END

GO
