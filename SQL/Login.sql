USE [TrainingDB]
GO

/****** Object:  Table [dbo].[AdminReglogin]    Script Date: 11-07-2023 10:27:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AdminReglogin](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](100) NULL,
	[lastname] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](10) NULL,
	[password] [varchar](30) NULL,
	[confirm] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


