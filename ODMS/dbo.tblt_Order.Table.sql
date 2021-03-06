USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_Order]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_Order](
	[Orderid] [int] IDENTITY(1,1) NOT NULL,
	[so_id] [varchar](255) NOT NULL,
	[local_so_id] [varchar](50) NOT NULL,
	[route_id] [int] NOT NULL,
	[outlet_id] [int] NOT NULL,
	[Challan_no] [int] NOT NULL,
	[planned_order_date] [datetime2](7) NOT NULL,
	[order_date_time] [datetime2](7) NOT NULL,
	[shipping_date] [datetime2](7) NOT NULL,
	[delivery_date] [datetime2](7) NOT NULL,
	[db_id] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[so_status] [int] NOT NULL,
	[total_order] [float] NULL,
	[total_confirmed] [float] NULL,
	[total_delivered] [float] NULL,
	[sales_order_type_id] [int] NULL,
	[manual_discount] [float] NULL,
	[isProcess] [int] NOT NULL CONSTRAINT [DF_tblt_Order_isProcess]  DEFAULT ((0)),
	[delivery_Process_Date] [datetime2](7) NULL,
 CONSTRAINT [PK_tblt_Order] PRIMARY KEY CLUSTERED 
(
	[Orderid] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tblt_Order]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE NONCLUSTERED INDEX [Indx_tblt_Order] ON [dbo].[tblt_Order]
(
	[planned_order_date] DESC,
	[delivery_date] DESC,
	[db_id] ASC,
	[psr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
