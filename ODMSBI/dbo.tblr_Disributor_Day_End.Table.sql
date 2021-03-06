USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tblr_Disributor_Day_End]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_Disributor_Day_End](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dbid] [int] NOT NULL,
	[BatchDate] [datetime] NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
