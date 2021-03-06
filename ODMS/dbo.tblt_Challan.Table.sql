USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_Challan]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_Challan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[challan_number] [varchar](50) NOT NULL,
	[db_id] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[psr_Name] [varchar](50) NULL,
	[route_id] [int] NOT NULL,
	[route_Name] [varchar](50) NULL,
	[challan_status] [int] NOT NULL,
	[No_of_memo] [int] NOT NULL,
	[No_of_Outlet] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NOT NULL,
	[Create_date_time] [datetime] NOT NULL,
	[System_date] [date] NOT NULL,
	[grand_total_CS] [float] NOT NULL,
	[delivery_grand_total_CS] [float] NOT NULL,
	[grand_total] [float] NOT NULL,
	[delivery_grand_total] [float] NOT NULL,
	[challantype] [int] NULL,
 CONSTRAINT [PK_tblt_Challan] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tblt_Challan]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_Challan] ON [dbo].[tblt_Challan]
(
	[order_date] DESC,
	[db_id] ASC,
	[challan_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
