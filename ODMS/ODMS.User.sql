USE [ODMS]
GO
/****** Object:  User [ODMS]    Script Date: 27-Aug-2018 3:06:20 PM ******/
CREATE USER [ODMS] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ODMS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ODMS]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ODMS]
GO
