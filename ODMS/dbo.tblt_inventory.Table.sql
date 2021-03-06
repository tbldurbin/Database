USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_inventory]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dbId] [int] NOT NULL,
	[skuId] [int] NOT NULL,
	[packSize] [int] NOT NULL,
	[BundleItemid] [int] NOT NULL,
	[batchNo] [int] NOT NULL,
	[qtyPs] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
