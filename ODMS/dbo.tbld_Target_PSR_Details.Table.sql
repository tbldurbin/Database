USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_Target_PSR_Details]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Target_PSR_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NOT NULL,
	[db_id] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[Pack_size] [int] NOT NULL,
	[qtyinCS] [float] NOT NULL,
	[qtyinPS] [float] NOT NULL,
	[total_Qty] [float] NOT NULL,
 CONSTRAINT [PK_tbld_Target_PSR_Details] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbld_Target_PSR_Details]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_Target_PSR_Details] ON [dbo].[tbld_Target_PSR_Details]
(
	[target_id] DESC,
	[db_id] ASC,
	[psr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
