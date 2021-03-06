USE [ODMS]
GO
/****** Object:  StoredProcedure [dbo].[RPT_RoutePlan]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[RPT_RoutePlan] 
	
AS
BEGIN
	SELECT t6.DB_Id, t6.DB_Name, t6.CEAREA_id, t6.CEAREA_Name, t6.AREA_id, t6.AREA_Name, t6.REGION_id, t6.REGION_Name, t6.Status, t2.Name, t3.RouteName, t1.db_emp_id, t1.route_plan_id, t1.route_id, COUNT(t5.OutletId) AS NoOfOutlet, 
                  t1.day
FROM     tbld_Route_Plan_Mapping AS t1 INNER JOIN
                  tbld_distribution_employee AS t2 ON t1.db_emp_id = t2.id INNER JOIN
                  tbld_distributor_Route AS t3 ON t1.route_id = t3.RouteID INNER JOIN
                  tbld_Outlet AS t5 ON t1.route_id = t5.parentid INNER JOIN
                  tbld_db_zone_view AS t6 ON t1.db_id = t6.DB_Id
WHERE  (t5.IsActive = 1)
GROUP BY t1.id, t1.db_emp_id, t1.route_plan_id, t1.route_id, t1.day, t3.RouteName, t2.Name, t6.DB_Id, t6.DB_Name, t6.CEAREA_id, t6.CEAREA_Name, t6.AREA_id, t6.AREA_Name, t6.REGION_id, t6.REGION_Name, t6.Status
ORDER BY t1.db_emp_id
END

GO
