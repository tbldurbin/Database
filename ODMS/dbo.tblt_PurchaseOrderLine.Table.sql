USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_PurchaseOrderLine]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_PurchaseOrderLine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[POId] [int] NOT NULL,
	[BundelItem] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[BatchId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[PackSize] [int] NOT NULL,
	[ChallanQty] [int] NOT NULL,
	[ReciveQty] [int] NOT NULL,
 CONSTRAINT [PK_tblt_PurchaseOrdeLine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblt_PurchaseOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_tblt_PurchaseOrderLine_tblt_PurchaseOrder] FOREIGN KEY([POId])
REFERENCES [dbo].[tblt_PurchaseOrder] ([Id])
GO
ALTER TABLE [dbo].[tblt_PurchaseOrderLine] CHECK CONSTRAINT [FK_tblt_PurchaseOrderLine_tblt_PurchaseOrder]
GO
