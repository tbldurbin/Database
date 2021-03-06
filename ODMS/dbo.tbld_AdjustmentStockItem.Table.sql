USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_AdjustmentStockItem]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_AdjustmentStockItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[AdjustmentStockID] [int] NOT NULL,
	[SKUID] [int] NOT NULL,
	[BatchNo] [int] NULL,
	[PreviousQty] [int] NOT NULL,
	[CurrentQty] [int] NOT NULL,
	[AdjustedQty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbld_AdjustmentStockItem]  WITH CHECK ADD  CONSTRAINT [FK_tbld_AdjustmentStockItem_tbld_AdjustmentStock] FOREIGN KEY([AdjustmentStockID])
REFERENCES [dbo].[tbld_AdjustmentStock] ([id])
GO
ALTER TABLE [dbo].[tbld_AdjustmentStockItem] CHECK CONSTRAINT [FK_tbld_AdjustmentStockItem_tbld_AdjustmentStock]
GO
