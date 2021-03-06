USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tblr_OutletWiseSKUWiseOrder]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblr_OutletWiseSKUWiseOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BatchDate] [date] NULL,
	[OutletId] [int] NULL,
	[OutletCode] [int] NULL,
	[OutletName] [varchar](50) NULL,
	[Distributorid] [int] NULL,
	[HaveVisicooler] [int] NULL,
	[SKUId] [int] NULL,
	[SKUName] [varchar](50) NULL,
	[PackSize] [int] NULL,
	[UnitPrice] [float] NULL,
	[SKUVolume8oz] [money] NULL,
	[Order_Quentity] [money] NULL,
	[Confirmed_Quantity] [money] NULL,
	[FreeOrder_Quentity] [money] NULL,
	[FreeConfirmed_Quantity] [money] NULL,
 CONSTRAINT [PK_tblr_OutletWiseSKUWiseOrder] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tblr_OutletWiseSKUWiseOrder]    Script Date: 27-Aug-2018 3:07:27 PM ******/
CREATE CLUSTERED INDEX [Indx_tblr_OutletWiseSKUWiseOrder] ON [dbo].[tblr_OutletWiseSKUWiseOrder]
(
	[BatchDate] DESC,
	[OutletId] ASC,
	[Distributorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
