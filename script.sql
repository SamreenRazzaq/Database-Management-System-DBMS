USE [Test_2021-CE-13]
GO
/****** Object:  Table [dbo].[Table_1 (Lab1)]    Script Date: 9/4/2023 10:52:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1 (Lab1)](
	[ID] [int] NULL,
	[Name] [nchar](10) NULL,
	[CNIC] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Table_1 (Lab1)] ([ID], [Name], [CNIC]) VALUES (1, N'ABC       ', 35201)
INSERT [dbo].[Table_1 (Lab1)] ([ID], [Name], [CNIC]) VALUES (2, N'DEF       ', 35202)
INSERT [dbo].[Table_1 (Lab1)] ([ID], [Name], [CNIC]) VALUES (3, N'IJK       ', 35203)
GO
