USE [master]
GO
/****** Object:  Database [Bakery] ******/
CREATE DATABASE [Bakery] 
GO

USE [Bakery]
GO
/****** Object:  Table [dbo].[Orders] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Price] [money] NOT NULL,
	[ImageName] [varchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageName]) VALUES (1, N'Carrot Cake', N'A scrumptious mini-carrot cake encrusted with sliced almonds', 8.9900, N'carrot_cake.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageName]) VALUES (2, N'Lemon Tart', N'A delicious lemon tart with fresh meringue cooked to perfection', 9.9900, N'lemon_tart.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageName]) VALUES (3, N'Cupcakes', N'Delectable vanilla and chocolate cupcakes', 5.9900, N'cupcakes.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageName]) VALUES (4, N'Bread', N'Fresh baked French-style bread', 1.4900, N'bread.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageName]) VALUES (5, N'Pear Tart', N'A glazed pear tart topped with sliced almonds and a dash of cinnamon', 5.9900, N'pear_tart.jpg')
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [ImageName]) VALUES (6, N'Chocolate Cake', N'Rich chocolate frosting cover this chocolate lover’s dream.    ', 8.9900, N'chocolate_cake.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
