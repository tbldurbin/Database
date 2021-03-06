USE [ODMS]
GO
/****** Object:  Table [dbo].[user_info]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_info](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](25) NULL,
	[User_Password] [varchar](25) NULL,
	[User_role_id] [int] NOT NULL,
	[User_status] [int] NULL,
	[User_biz_role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
