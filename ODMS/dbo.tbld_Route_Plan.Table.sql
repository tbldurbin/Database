USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_Route_Plan]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_Route_Plan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[route_plan_name] [varchar](250) NULL,
	[route_plan_code] [varchar](250) NULL,
	[route_plan_description] [varchar](250) NULL,
	[db_id] [int] NOT NULL,
	[db_emp_id] [int] NOT NULL,
	[creation_date] [date] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[Modify_date] [date] NOT NULL,
	[created_by] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
