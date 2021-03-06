USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[DB_User_check]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[DB_User_check]
	@UserName varchar(50),
	@Password varchar(50)
AS
	SELECT A.id, A.Name, A.User_role_id, A.DistributionId, A.login_user_id, A.active, B.user_role_code, tbld_distribution_house.Zone_id, tbld_business_zone.biz_zone_category_id
FROM     tbld_distribution_employee AS A INNER JOIN
                  user_role AS B ON A.User_role_id = B.user_role_id INNER JOIN
                  tbld_distribution_house ON A.DistributionId = tbld_distribution_house.DB_Id INNER JOIN
                  tbld_business_zone ON tbld_distribution_house.Zone_id = tbld_business_zone.id INNER JOIN
                  tbld_business_zone_hierarchy ON tbld_business_zone.biz_zone_category_id = tbld_business_zone_hierarchy.id
WHERE  (A.login_user_id = @UserName) AND (A.login_user_password = @Password) AND B.isOnlineLogin=1
GO
