USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_Outlet_new]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Outlet_new](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutletCode] [varchar](50) NULL,
	[OutletName] [varchar](200) NULL,
	[OutletName_b] [varchar](200) NULL,
	[Location] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[GpsLocation] [varchar](max) NULL,
	[OwnerName] [varchar](100) NULL,
	[ContactNo] [varchar](50) NULL,
	[Distributorid] [int] NOT NULL,
	[HaveVisicooler] [int] NOT NULL,
	[parentid] [int] NOT NULL,
	[outlet_category_id] [int] NOT NULL,
	[grading] [int] NOT NULL,
	[channel] [int] NOT NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[picture] [varchar](200) NULL,
	[IsActive] [int] NOT NULL,
	[verify_status] [int] NOT NULL,
	[verifydate] [datetime] NOT NULL,
	[verify_by] [int] NOT NULL,
	[psr_id] [int] NOT NULL,
	[createdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
