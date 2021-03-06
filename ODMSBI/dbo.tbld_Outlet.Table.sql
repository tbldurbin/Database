USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tbld_Outlet]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbld_Outlet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutletId] [int] NOT NULL,
	[OutletCode] [varchar](50) NULL,
	[OutletName] [varchar](200) NULL,
	[OutletName_b] [varchar](200) NULL,
	[Location] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[GpsLocation] [varchar](max) NULL,
	[OwnerName] [varchar](100) NULL,
	[ContactNo] [varchar](50) NULL,
	[Distributorid] [int] NULL,
	[HaveVisicooler] [int] NULL,
	[parentid] [int] NULL,
	[outlet_category_id] [int] NULL,
	[grading] [int] NULL,
	[channel] [int] NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[picture] [varchar](200) NULL,
	[IsActive] [int] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK_tbld_Outlet] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_tbld_Outlet]    Script Date: 27-Aug-2018 3:07:27 PM ******/
CREATE CLUSTERED INDEX [IX_tbld_Outlet] ON [dbo].[tbld_Outlet]
(
	[Distributorid] ASC,
	[OutletId] ASC,
	[parentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
