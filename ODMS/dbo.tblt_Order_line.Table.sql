USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_Order_line]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_Order_line](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Orderid] [int] NOT NULL,
	[Bundelitmeid] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[Betch_id] [int] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[unit_sale_price] [float] NOT NULL,
	[sku_order_type_id] [int] NOT NULL,
	[promotion_id] [int] NOT NULL,
	[lpec] [int] NOT NULL,
	[quantity_ordered] [int] NOT NULL,
	[quantity_confirmed] [int] NOT NULL,
	[quantity_delivered] [int] NOT NULL,
	[total_sale_price] [float] NOT NULL,
	[total_discount_amount] [float] NOT NULL,
	[total_billed_amount] [float] NOT NULL,
 CONSTRAINT [PK_tblt_Order_line_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_Order_line]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_Order_line] ON [dbo].[tblt_Order_line]
(
	[Orderid] DESC,
	[id] ASC,
	[sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblt_Order_line]  WITH NOCHECK ADD  CONSTRAINT [FK_tblt_Order_line_tblt_Order] FOREIGN KEY([Orderid])
REFERENCES [dbo].[tblt_Order] ([Orderid])
GO
ALTER TABLE [dbo].[tblt_Order_line] NOCHECK CONSTRAINT [FK_tblt_Order_line_tblt_Order]
GO
