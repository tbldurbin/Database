USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_SKU_Brand]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU_Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[element_name] [varchar](50) NOT NULL,
	[element_code] [varchar](50) NOT NULL,
	[element_description] [varchar](50) NOT NULL,
	[element_category_id] [int] NOT NULL,
	[parent_element_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
