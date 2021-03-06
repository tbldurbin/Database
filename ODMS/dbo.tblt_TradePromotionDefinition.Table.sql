USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_TradePromotionDefinition]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionDefinition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[promo_id] [int] NOT NULL,
	[rule_type] [int] NOT NULL,
	[promo_line_type] [int] NOT NULL,
	[condition_type] [int] NOT NULL,
	[offer_type] [int] NOT NULL,
	[condition_sku_id] [int] NOT NULL,
	[condition_sku_Batch] [int] NOT NULL,
	[condition_sku_pack_size] [int] NOT NULL,
	[condition_sku_amount] [int] NOT NULL,
	[offer_sku_id] [int] NOT NULL,
	[offer_sku_pack_size] [int] NOT NULL,
	[offer_sku_Batch] [int] NOT NULL,
	[offer_sku_amount] [int] NOT NULL,
	[condition_bundle_qty_CS] [int] NOT NULL,
	[condition_sku_group] [int] NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblt_TradePromotionDefinition] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_TradePromotionDefinition]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_TradePromotionDefinition] ON [dbo].[tblt_TradePromotionDefinition]
(
	[promo_id] DESC,
	[condition_sku_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblt_TradePromotionDefinition]  WITH CHECK ADD  CONSTRAINT [FK_tblt_TradePromotionDefinition_tblt_TradePromotion] FOREIGN KEY([promo_id])
REFERENCES [dbo].[tblt_TradePromotion] ([id])
GO
ALTER TABLE [dbo].[tblt_TradePromotionDefinition] CHECK CONSTRAINT [FK_tblt_TradePromotionDefinition_tblt_TradePromotion]
GO
