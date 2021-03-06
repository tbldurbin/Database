USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tbld_bundle_price_details]    Script Date: 27-Aug-2018 3:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_bundle_price_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bundle_price_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[db_lifting_price] [float] NOT NULL,
	[outlet_lifting_price] [float] NOT NULL,
	[mrp] [float] NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[end_date] [datetime2](7) NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
