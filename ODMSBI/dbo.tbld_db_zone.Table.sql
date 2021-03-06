USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tbld_db_zone]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_db_zone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[National_id] [int] NULL,
	[National] [varchar](50) NULL,
	[REGION_id] [int] NULL,
	[REGION_Name] [varchar](200) NULL,
	[AREA_id] [int] NULL,
	[AREA_Name] [varchar](200) NULL,
	[CEAREA_id] [int] NULL,
	[CEAREA_Name] [varchar](200) NULL,
	[DB_Id] [int] NULL,
	[DB_Name] [varchar](200) NULL,
	[Status] [int] NULL,
	[PriceBuandle_id] [int] NULL,
	[DBCode] [varchar](200) NULL,
	[OfficeAddress] [varchar](200) NULL,
	[cluster] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
