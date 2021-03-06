USE [ODMS]
GO
/****** Object:  Table [dbo].[tblm_visit_detail]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblm_visit_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[psr_id] [int] NULL,
	[route_id] [int] NULL,
	[outlet_id] [int] NULL,
	[visit_type] [int] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[lat] [varchar](50) NULL,
	[lon] [varchar](50) NULL,
	[remark] [varchar](50) NULL,
 CONSTRAINT [PK_tblm_visit_detail_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblm_visit_detail]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [IX_tblm_visit_detail] ON [dbo].[tblm_visit_detail]
(
	[date] DESC,
	[psr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
