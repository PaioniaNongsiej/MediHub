USE [TrainingDB]
GO

/****** Object:  Table [dbo].[shipper]    Script Date: 11-07-2023 10:45:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[shipper](
	[shipper_id] [int] IDENTITY(1,1) NOT NULL,
	[shipper_name] [varchar](100) NULL,
	[description] [nvarchar](500) NULL,
	[price] [varchar](500) NULL,
	[image] [varchar](500) NULL
) ON [PRIMARY]
GO


