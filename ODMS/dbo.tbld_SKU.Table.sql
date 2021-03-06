USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_SKU]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_SKU](
	[SKU_id] [int] IDENTITY(1,1) NOT NULL,
	[SKUName] [varchar](200) NOT NULL,
	[SKUsl] [int] NOT NULL,
	[SKUcode] [int] NOT NULL,
	[SKUdescription] [varchar](200) NOT NULL,
	[SKUtype_id] [int] NOT NULL,
	[SKUnodetype_id] [int] NOT NULL,
	[SKUStatus] [int] NOT NULL,
	[SKUcreationdate] [datetime] NOT NULL,
	[SKUlaunchdate] [datetime] NOT NULL,
	[SKUexpirydate] [datetime] NOT NULL,
	[SKUbrand_id] [int] NOT NULL,
	[SKUcategoryid] [int] NOT NULL,
	[SKUVolume_ml] [float] NOT NULL,
	[SKUVolume_8oz] [float] NOT NULL,
	[SKUName_B] [varchar](200) NOT NULL,
	[SKUContainertypeid] [int] NOT NULL,
	[SKUlpc] [int] NOT NULL,
	[SKUUnit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SKU_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
