USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_TradePromotionRule]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_TradePromotionRule](
	[TPRoles_type_id] [int] NOT NULL,
	[TPRoles_type_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TPRoles_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
