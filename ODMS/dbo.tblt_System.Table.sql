USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_System]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_System](
	[SystemId] [int] IDENTITY(1,1) NOT NULL,
	[DBid] [int] NOT NULL,
	[CurrentDate] [date] NOT NULL,
	[PreviousDate] [date] NOT NULL,
	[NextDate] [date] NOT NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tblt_System] PRIMARY KEY CLUSTERED 
(
	[SystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
