USE [ODMS]
GO
/****** Object:  Table [dbo].[tbl_MainMenu]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_MainMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MainMenuName] [varchar](50) NULL,
	[Controller] [varchar](50) NULL,
	[Action] [varchar](50) NULL,
	[sl] [int] NULL,
 CONSTRAINT [PK_tblMainMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
