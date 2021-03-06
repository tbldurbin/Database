USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[User_check]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_check]
	@UserName varchar(50),
	@Password varchar(50)
AS
	SELECT A.*,B.user_role_code,C.first_name,C.biz_zone_id FROM user_info AS A
	INNER JOIN user_role AS B ON A.User_role_id=b.user_role_id
	INNER JOIN tbld_management_employee AS C ON C.login_user_id=A.User_id
	WHERE A.User_Name=@UserName AND A.User_Password=@Password AND B.isOnlineLogin=1
GO
