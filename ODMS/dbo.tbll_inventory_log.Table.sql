USE [ODMS]
GO
/****** Object:  Table [dbo].[tbll_inventory_log]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbll_inventory_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NULL,
	[sku_id] [int] NULL,
	[batch_id] [int] NULL,
	[price] [float] NULL,
	[tx_qty_ps] [int] NULL,
	[tx_type] [int] NULL,
	[tx_System_date] [date] NULL,
	[tx_date] [datetime2](7) NULL CONSTRAINT [DF_tbll_inventory_log_tx_date]  DEFAULT (getdate()),
	[tx_challan] [int] NULL,
 CONSTRAINT [PK_tbll_inventory_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
