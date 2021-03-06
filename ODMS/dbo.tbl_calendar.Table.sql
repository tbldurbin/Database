USE [ODMS]
GO
/****** Object:  Table [dbo].[tbl_calendar]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_calendar](
	[id] [int] NOT NULL,
	[Date] [date] NULL,
	[ShortDate] [varchar](20) NULL,
	[DayNo] [int] NULL,
	[Weekdays] [varchar](20) NULL,
	[Month] [varchar](20) NULL,
	[MonthNo] [int] NULL,
	[Year] [int] NULL,
	[isHolyday] [int] NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_calendar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
