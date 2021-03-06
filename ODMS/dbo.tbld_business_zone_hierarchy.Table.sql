USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_business_zone_hierarchy]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_business_zone_hierarchy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[biz_zone_category_name] [varchar](30) NOT NULL,
	[biz_zone_category_code] [varchar](30) NOT NULL,
	[biz_zone_category_description] [varchar](30) NOT NULL,
	[parent_category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [biz_zone_category_name] UNIQUE NONCLUSTERED 
(
	[biz_zone_category_name] ASC,
	[biz_zone_category_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
