USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_distribution_employee]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distribution_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_code] [varchar](30) NULL,
	[Name] [varchar](256) NULL,
	[Emp_address] [varchar](255) NULL,
	[User_role_id] [int] NULL,
	[DistributionId] [int] NULL,
	[login_user_id] [varchar](255) NULL,
	[login_user_password] [varchar](255) NULL,
	[contact_no] [varchar](255) NULL,
	[joining_date] [date] NULL,
	[designation] [varchar](255) NULL,
	[Emp_Type] [int] NULL,
	[d_o_b] [datetime2](7) NULL,
	[email] [varchar](255) NULL,
	[emergency_contact_person] [varchar](255) NULL,
	[emergency_contact_number] [varchar](255) NULL,
	[educational_qualification] [varchar](255) NULL,
	[image] [varchar](100) NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_tbld_distribution_employee] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [Indx_tbld_distribution_employee]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tbld_distribution_employee] ON [dbo].[tbld_distribution_employee]
(
	[DistributionId] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
