USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_SKU_unit]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU_unit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [varchar](30) NOT NULL,
	[unit_short_name] [varchar](30) NOT NULL,
	[unit_code] [varchar](30) NOT NULL,
	[unit_description] [varchar](30) NOT NULL,
	[qty] [int] NOT NULL,
	[height] [float] NOT NULL,
	[width] [float] NOT NULL,
	[length] [float] NOT NULL,
	[weight] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unit_name] UNIQUE NONCLUSTERED 
(
	[unit_name] ASC,
	[unit_short_name] ASC,
	[unit_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
