USE [ODMSBI]
GO
/****** Object:  Table [dbo].[tblr_PSRWiseMonthTGT]    Script Date: 27-Aug-2018 3:07:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblr_PSRWiseMonthTGT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[target_id] [int] NULL,
	[db_id] [int] NULL,
	[psr_id] [int] NULL,
	[TotalTGTCS] [money] NULL,
	[TotalTGTVolume8oz] [money] NULL,
	[TGTOrder] [money] NULL,
	[TGTConfirmed] [money] NULL,
	[TGTDelivered] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
