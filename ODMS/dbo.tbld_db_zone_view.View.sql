USE [ODMS]
GO
/****** Object:  View [dbo].[tbld_db_zone_view]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbld_db_zone_view]
AS
SELECT dbo.tbld_distribution_house.DB_Id, dbo.tbld_distribution_house.DBName AS DB_Name, dbo.tbld_distribution_house.Zone_id AS CEAREA_id, CEAREA.biz_zone_name AS CEAREA_Name, AREA.id AS AREA_id, 
                  AREA.biz_zone_name AS AREA_Name, REGION.id AS REGION_id, REGION.biz_zone_name AS REGION_Name, dbo.tbld_business_zone.id AS National_id, dbo.tbld_business_zone.biz_zone_name AS [National], 
                  dbo.tbld_distribution_house.Status, dbo.tbld_cluster.name AS Cluster, dbo.tbld_distribution_house.DBCode, dbo.tbld_distribution_house.OfficeAddress, dbo.tbld_distribution_house.PriceBuandle_id
FROM     dbo.tbld_distribution_house INNER JOIN
                  dbo.tbld_business_zone AS CEAREA ON dbo.tbld_distribution_house.Zone_id = CEAREA.id INNER JOIN
                  dbo.tbld_business_zone AS AREA ON CEAREA.parent_biz_zone_id = AREA.id INNER JOIN
                  dbo.tbld_business_zone AS REGION ON AREA.parent_biz_zone_id = REGION.id INNER JOIN
                  dbo.tbld_business_zone ON REGION.parent_biz_zone_id = dbo.tbld_business_zone.id INNER JOIN
                  dbo.tbld_cluster ON dbo.tbld_distribution_house.Cluster_id = dbo.tbld_cluster.id

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[36] 2[28] 3) )"
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
         Begin Table = "tbld_distribution_house"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "CEAREA"
            Begin Extent = 
               Top = 7
               Left = 336
               Bottom = 170
               Right = 572
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AREA"
            Begin Extent = 
               Top = 7
               Left = 620
               Bottom = 170
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "REGION"
            Begin Extent = 
               Top = 7
               Left = 904
               Bottom = 170
               Right = 1140
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tbld_business_zone"
            Begin Extent = 
               Top = 191
               Left = 1064
               Bottom = 354
               Right = 1300
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbld_cluster"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1200
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Width = 1200
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
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_zone_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tbld_db_zone_view'
GO
