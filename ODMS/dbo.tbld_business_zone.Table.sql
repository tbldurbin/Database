USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_business_zone]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_business_zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[biz_zone_name] [varchar](30) NOT NULL,
	[biz_zone_code] [varchar](30) NOT NULL,
	[biz_zone_description] [varchar](30) NOT NULL,
	[biz_zone_category_id] [int] NOT NULL,
	[parent_biz_zone_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
