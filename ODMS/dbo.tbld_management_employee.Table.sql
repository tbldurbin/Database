USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_management_employee]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_management_employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sales_emp_code] [varchar](30) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[sales_emp_address] [varchar](30) NOT NULL,
	[sales_role_id] [int] NOT NULL,
	[sales_manager_id] [int] NOT NULL,
	[login_user_id] [int] NOT NULL,
	[biz_zone_id] [int] NOT NULL,
	[email] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
