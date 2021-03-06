USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tblr_OutletWiseBuyer]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_OutletWiseBuyer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [date] NULL,
	[BatchDeliveryDate] [date] NULL,
	[DB_id] [int] NULL,
	[Orderid] [int] NULL,
	[outlet_id] [int] NULL,
	[sku_id] [int] NULL,
 CONSTRAINT [PK_tblr_OutletWiseBuyer_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_tblr_OutletWiseBuyer]    Script Date: 27-Aug-2018 3:07:27 PM ******/
CREATE CLUSTERED INDEX [IX_tblr_OutletWiseBuyer] ON [dbo].[tblr_OutletWiseBuyer]
(
	[BatchDate] DESC,
	[BatchDeliveryDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
