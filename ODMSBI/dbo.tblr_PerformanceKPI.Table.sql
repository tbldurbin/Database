USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tblr_PerformanceKPI]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_PerformanceKPI](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DB_id] [varchar](100) NOT NULL,
	[BatchDate] [datetime] NOT NULL,
	[PerformerId] [varchar](100) NOT NULL,
	[PerformerName] [varchar](200) NOT NULL,
	[PerformerType] [int] NOT NULL,
	[SalesScheduleCall] [money] NOT NULL,
	[SalesMemo] [money] NOT NULL,
	[TotalLineSold] [money] NOT NULL,
	[TotalSoldInVolume] [money] NULL,
	[TotalSoldInCase] [money] NULL,
	[TotalSoldInValue] [money] NOT NULL,
	[TotalOrderedInVolume] [money] NULL,
	[TotalOrderedInCase] [money] NOT NULL,
	[TotalOrderedInValue] [money] NOT NULL,
 CONSTRAINT [PK_tblr_PerformanceKPI_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblr_PerformanceKPI]    Script Date: 27-Aug-2018 3:07:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblr_PerformanceKPI] ON [dbo].[tblr_PerformanceKPI]
(
	[BatchDate] DESC,
	[PerformerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
