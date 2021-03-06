USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tblr_OrderDetails]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NULL,
	[psr_id] [int] NULL,
	[so_id] [varchar](200) NULL,
	[planned_order_date] [datetime2](7) NULL,
	[delivery_date] [datetime2](7) NULL,
	[delivery_Process_Date] [datetime2](7) NULL,
	[Orderid] [int] NULL,
	[outlet_id] [int] NULL,
	[Challan_no] [int] NULL,
	[sku_id] [int] NULL,
	[Betch_id] [int] NULL,
	[Pack_size] [int] NULL,
	[unit_sale_price] [money] NULL,
	[sku_order_type_id] [int] NULL,
	[promotion_id] [int] NULL,
	[quantity_ordered] [int] NULL,
	[quantity_confirmed] [int] NULL,
	[quantity_delivered] [int] NULL,
	[total_sale_price] [money] NULL,
 CONSTRAINT [PK_tblr_OrderDetails] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tblr_OrderDetails]    Script Date: 27-Aug-2018 3:07:27 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_OrderDetails] ON [dbo].[tblr_OrderDetails]
(
	[planned_order_date] DESC,
	[delivery_date] DESC,
	[Orderid] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
