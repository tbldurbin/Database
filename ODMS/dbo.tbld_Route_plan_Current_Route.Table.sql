USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_Route_plan_Current_Route]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Route_plan_Current_Route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[db_id] [int] NOT NULL,
	[db_emp_id] [int] NOT NULL,
	[route_plan_id] [int] NOT NULL,
	[route_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
