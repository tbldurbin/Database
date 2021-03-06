USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_AdjustmentStock]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_AdjustmentStock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dbid] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL CONSTRAINT [DF_tbld_AdjustmentStock_date]  DEFAULT (getdate()),
	[Syatemdate] [datetime2](7) NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_tbld_AdjustmentStock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
