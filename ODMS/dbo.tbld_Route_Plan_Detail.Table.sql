USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_Route_Plan_Detail]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbld_Route_Plan_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[route_plan_id] [int] NULL,
	[route_id] [int] NULL,
	[dbid] [int] NULL,
	[db_emp_id] [int] NULL,
	[planned_visit_date] [date] NULL,
	[delivery_date] [date] NULL,
	[no_of_outlet] [int] NULL,
 CONSTRAINT [PK_tbld_Route_Plan_Detail] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbld_Route_Plan_Detail]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_Route_Plan_Detail] ON [dbo].[tbld_Route_Plan_Detail]
(
	[planned_visit_date] ASC,
	[dbid] ASC,
	[db_emp_id] ASC,
	[route_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbld_Route_Plan_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbld_Route_Plan_Detail_tbld_Route_Plan] FOREIGN KEY([route_plan_id])
REFERENCES [dbo].[tbld_Route_Plan] ([id])
GO
ALTER TABLE [dbo].[tbld_Route_Plan_Detail] CHECK CONSTRAINT [FK_tbld_Route_Plan_Detail_tbld_Route_Plan]
GO
