USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_Challan_line]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_Challan_line](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[challan_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[Order_qty] [int] NOT NULL,
	[Extra_qty] [int] NOT NULL,
	[Free_qty] [int] NOT NULL,
	[Total_qty] [int] NOT NULL,
	[Confirm_qty] [int] NOT NULL,
	[Confirm_Free_qty] [int] NOT NULL,
	[Return_qty] [float] NOT NULL,
	[Order_qty_price] [float] NOT NULL,
	[Extra_qty_price] [float] NOT NULL,
	[Total_qty_price] [float] NOT NULL,
	[Confirm_qty_price] [float] NOT NULL,
 CONSTRAINT [PK_tblt_Challan_line] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_Challan_line]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_Challan_line] ON [dbo].[tblt_Challan_line]
(
	[challan_id] DESC,
	[sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblt_Challan_line]  WITH CHECK ADD  CONSTRAINT [FK_tblt_Challan_line_tblt_Challan] FOREIGN KEY([challan_id])
REFERENCES [dbo].[tblt_Challan] ([id])
GO
ALTER TABLE [dbo].[tblt_Challan_line] CHECK CONSTRAINT [FK_tblt_Challan_line_tblt_Challan]
GO
