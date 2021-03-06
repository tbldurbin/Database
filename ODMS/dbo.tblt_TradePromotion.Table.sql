USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_TradePromotion]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[code] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[TP_type] [int] NOT NULL,
	[TPOffer_type] [int] NOT NULL,
	[promotion_unit_id] [int] NOT NULL,
	[promotion_sub_unit_id] [int] NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[expiry_date] [date] NULL,
	[create_date] [datetime2](7) NULL,
	[is_active] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
