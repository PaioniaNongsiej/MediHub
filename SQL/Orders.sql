USE [TrainingDB]
GO

/****** Object:  Table [dbo].[PrOrder]    Script Date: 11-07-2023 10:35:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PrOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[cart_id] [int] NULL,
	[qty] [int] NULL,
	[payment_method] [varchar](max) NULL,
	[shipping_method] [varchar](max) NULL,
	[order_total] [int] NULL,
	[status] [varchar](max) NULL,
	[order_date] [varchar](max) NULL,
	[user_id] [int] NULL,
	[name] [varchar](200) NULL,
	[mobile] [varchar](200) NULL,
	[address] [varchar](200) NULL,
	[pincode] [varchar](200) NULL,
	[orderexpected_date] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


