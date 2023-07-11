USE [TrainingDB]
GO

/****** Object:  Table [dbo].[profile]    Script Date: 11-07-2023 10:38:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](max) NULL,
	[mobile_no] [int] NULL,
	[picture] [varchar](max) NULL,
	[country] [varchar](max) NULL,
	[building] [varchar](max) NULL,
	[area] [varchar](max) NULL,
	[landmark] [varchar](max) NULL,
	[pincode] [int] NULL,
	[town_city] [varchar](max) NULL,
	[state] [varchar](max) NULL,
	[Usertype] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


