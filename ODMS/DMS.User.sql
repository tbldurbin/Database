USE [ODMS]
GO
/****** Object:  User [DMS]    Script Date: 27-Aug-2018 3:06:20 PM ******/
CREATE USER [DMS] FOR LOGIN [DMS] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DMS]
GO
