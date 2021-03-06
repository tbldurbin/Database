USE [ODMS]
GO
/****** Object:  View [dbo].[tbld_db_psr_outlet_zone_view]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbld_db_psr_outlet_zone_view]
AS
SELECT TOP (100) PERCENT D.DB_Id, D.DB_Name, D.CEAREA_id, D.CEAREA_Name, D.AREA_id, D.AREA_Name, D.REGION_id, D.REGION_Name, D.National_id, D.[National], D.Status, D.Name, D.PSR_id, D.PSR_Code, D.DBCode, D.OfficeAddress, 
                  D.cluster, B.RouteName, B.RouteID, A.OutletId, A.OutletCode, A.OutletName, A.OutletName_b, A.Location, A.Address, A.GpsLocation, A.OwnerName, A.ContactNo, A.Distributorid, A.HaveVisicooler, A.parentid, A.outlet_category_id, 
                  A.grading, A.channel, A.Latitude, A.Longitude, A.picture, A.IsActive, dbo.tbld_Outlet_channel.name AS channel_name, dbo.tbld_Outlet_category.outlet_category_name, dbo.tbld_Outlet_grade.name AS Outlet_grade
FROM     dbo.tbld_Outlet AS A INNER JOIN
                  dbo.tbld_distributor_Route AS B ON A.parentid = B.RouteID LEFT OUTER JOIN
                  dbo.tbld_Outlet_channel ON A.channel = dbo.tbld_Outlet_channel.id LEFT OUTER JOIN
                  dbo.tbld_Outlet_category ON A.outlet_category_id = dbo.tbld_Outlet_category.id LEFT OUTER JOIN
                  dbo.tbld_Outlet_grade ON A.grading = dbo.tbld_Outlet_grade.id INNER JOIN
                      (SELECT DISTINCT db_id, db_emp_id, route_plan_id, route_id
                       FROM      dbo.tbld_Route_Plan_Mapping) AS C ON B.RouteID = C.route_id LEFT OUTER JOIN
                  dbo.tbld_db_psr_zone_view AS D ON D.PSR_id = C.db_emp_id
ORDER BY A.Distributorid, B.RouteID, D.PSR_id

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[25] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 7
               Left = 313
               Bottom = 170
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_Outlet_channel"
            Begin Extent = 
               Top = 7
               Left = 555
               Bottom = 170
               Right = 749
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_Outlet_category"
            Begin Extent = 
               Top = 7
               Left = 797
               Bottom = 170
               Right = 1075
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_Outlet_grade"
            Begin Extent = 
               Top = 7
               Left = 1123
               Bottom = 170
               Right = 1317
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 175
               Left = 290
               Bottom = 338
               Right = 485
            End
            DisplayFla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_outlet_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'gs = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 42
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_outlet_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_psr_outlet_zone_view'
GO
