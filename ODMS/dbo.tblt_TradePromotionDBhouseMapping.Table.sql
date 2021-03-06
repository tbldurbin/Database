USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_TradePromotionDBhouseMapping]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionDBhouseMapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[promo_id] [int] NOT NULL,
	[db_id] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tblt_TradePromotionDBhouseMapping_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tblt_TradePromotionDBhouseMapping]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tblt_TradePromotionDBhouseMapping] ON [dbo].[tblt_TradePromotionDBhouseMapping]
(
	[promo_id] DESC,
	[db_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
