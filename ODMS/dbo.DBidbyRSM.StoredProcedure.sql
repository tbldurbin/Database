USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[DBidbyRSM]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DBidbyRSM]

AS
BEGIN
	
	SELECT [DB_Id],[REGION_id]
       FROM [MSTORE].[dbo].[tbld_db_zone_view] where   [Status]=1
END

GO
