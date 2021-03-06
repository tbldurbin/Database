USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_distribution_house]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbld_distribution_house](
	[DB_Id] [int] IDENTITY(1,1) NOT NULL,
	[DBName] [varchar](50) NOT NULL,
	[DBCode] [varchar](50) NULL,
	[DBDescription] [text] NULL,
	[OfficeAddress] [nvarchar](max) NULL,
	[WarehouseAddress] [text] NULL,
	[OwnerName] [varchar](50) NULL,
	[OwnerMoble] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Cluster_id] [int] NOT NULL,
	[Zone_id] [int] NOT NULL,
	[PriceBuandle_id] [int] NOT NULL,
	[DeliveryModuleStatus] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[MV] [int] NULL,
	[NMV] [int] NULL,
	[LastReplacement] [datetime] NULL,
	[Remark] [text] NULL,
 CONSTRAINT [PK_tbld_distribution_house] PRIMARY KEY CLUSTERED 
(
	[DB_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
