USE [ODMS]
GO
/****** Object:  Table [dbo].[tbl_Manu_Role_mapping]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Manu_Role_mapping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Roleid] [int] NOT NULL,
	[MainMenuid] [int] NOT NULL,
	[SubMenuid] [int] NOT NULL,
	[SubMenuSecondid] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Manu_Role_mapping] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Indx_tbl_Manu_Role_mapping]    Script Date: 27-Aug-2018 3:06:21 PM ******/
CREATE CLUSTERED INDEX [Indx_tbl_Manu_Role_mapping] ON [dbo].[tbl_Manu_Role_mapping]
(
	[Roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
