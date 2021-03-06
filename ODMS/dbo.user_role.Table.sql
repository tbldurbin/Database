USE [ODMS]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_role](
	[user_role_id] [int] IDENTITY(1,1) NOT NULL,
	[user_role_name] [varchar](25) NOT NULL,
	[user_role_code] [varchar](25) NOT NULL,
	[user_role_status] [int] NULL,
	[isOnlineLogin] [int] NULL,
	[isReportView] [int] NULL,
	[isCreate] [int] NULL,
	[isEdit] [int] NULL,
	[isDelete] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
