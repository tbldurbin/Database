USE [ODMS]
GO
/****** Object:  Table [dbo].[tbld_distribution_employee_Type]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbld_distribution_employee_Type](
	[EmpTypeid] [int] IDENTITY(1,1) NOT NULL,
	[EmpType] [varchar](50) NULL,
 CONSTRAINT [PK_tbld_distribution_employee_Type] PRIMARY KEY CLUSTERED 
(
	[EmpTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
