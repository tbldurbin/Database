USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tbld_db_psr_zone]    Script Date: 27-Aug-2018 3:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_db_psr_zone](
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
	[Name] [varchar](200) NULL,
	[PSR_id] [int] NULL,
	[PSR_Code] [varchar](200) NULL,
	[DBCode] [int] NULL,
	[OfficeAddress] [varchar](200) NULL,
	[cluster] [varchar](200) NULL,
 CONSTRAINT [PK_tbld_db_psr_zone] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tbld_db_psr_zone]    Script Date: 27-Aug-2018 3:07:27 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_db_psr_zone] ON [dbo].[tbld_db_psr_zone]
(
	[PSR_id] ASC,
	[DB_Id] ASC,
	[CEAREA_id] ASC,
	[AREA_id] ASC,
	[REGION_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
