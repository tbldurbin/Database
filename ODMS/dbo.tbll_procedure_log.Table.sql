USE [ODMS]
GO
/****** Object:  Table [dbo].[tbll_procedure_log]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbll_procedure_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dbid] [int] NULL,
	[procedure_name] [varchar](50) NOT NULL,
	[start_time] [datetime2](7) NULL,
	[end_time] [datetime2](7) NULL,
 CONSTRAINT [PK_tbll_procedure_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
