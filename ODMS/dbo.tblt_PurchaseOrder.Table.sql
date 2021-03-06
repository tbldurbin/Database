USE [ODMS]
GO
/****** Object:  Table [dbo].[tblt_PurchaseOrder]    Script Date: 27-Aug-2018 3:06:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblt_PurchaseOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChallanNo] [int] NOT NULL,
	[DbId] [int] NOT NULL,
	[ChallanDate] [date] NULL,
	[ReceivedDate] [date] NULL,
	[Timestamp] [datetime] NULL CONSTRAINT [DF_tblt_PurchaseOrder_Timestamp]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblt_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
