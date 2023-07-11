USE [TrainingDB]
GO

/****** Object:  Table [dbo].[recipe]    Script Date: 11-07-2023 10:44:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[recipe](
	[recipe_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_name] [varchar](300) NULL,
	[servings] [int] NULL,
	[ingredient] [varchar](500) NULL,
	[short_des] [varchar](300) NULL,
	[long_des] [varchar](1000) NULL,
	[first_img] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


