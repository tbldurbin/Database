USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_distributor_Route]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distributor_Route](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[RouteCode] [varchar](100) NOT NULL,
	[RouteName] [varchar](200) NOT NULL,
	[RouteType] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [int] NOT NULL,
	[DistributorID] [int] NOT NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_tbld_distributor_Route] PRIMARY KEY NONCLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tbld_distributor_Route]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_distributor_Route] ON [dbo].[tbld_distributor_Route]
(
	[RouteID] ASC,
	[DistributorID] ASC,
	[RouteType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
