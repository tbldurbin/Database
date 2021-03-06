USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_OrderType]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblt_OrderType](
	[OrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrderTypeName] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblt_OrderType] PRIMARY KEY CLUSTERED 
(
	[OrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
