USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tbld_sku_list]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_sku_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SKU_id] [int] NULL,
	[SKUName] [varchar](200) NULL,
	[SKUsl] [int] NULL,
	[SKUcode] [int] NULL,
	[SKUStatus] [int] NULL,
	[SKUbrand_id] [int] NULL,
	[Sub_brand] [varchar](200) NULL,
	[Brand] [varchar](200) NULL,
	[SKUcategoryid] [int] NULL,
	[sku_category_name] [varchar](200) NULL,
	[SKUtype_id] [int] NULL,
	[SKUtype] [varchar](200) NULL,
	[SKUVolume_ml] [float] NULL,
	[SKUVolume_8oz] [float] NULL,
	[SKUUnit] [int] NULL,
	[Pack_Size] [int] NULL,
 CONSTRAINT [PK_tbld_sku_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
