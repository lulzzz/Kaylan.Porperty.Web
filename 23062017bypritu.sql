USE [KalyanProperty]
GO
/****** Object:  Table [dbo].[LoginPl]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginPl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[LoginId] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.LoginPl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (1, N'India', 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
/****** Object:  Table [dbo].[ContractType]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ContractType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContractType] ON
INSERT [dbo].[ContractType] ([Id], [Name], [IsActive]) VALUES (1, N'For Sale', 1)
INSERT [dbo].[ContractType] ([Id], [Name], [IsActive]) VALUES (2, N'For Rent', 1)
SET IDENTITY_INSERT [dbo].[ContractType] OFF
/****** Object:  Table [dbo].[Contact]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nchar](10) NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[PropertyType]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PropertyType] ON
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (2, N'Apartment', 1)
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (3, N'Family House', 1)
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (4, N'Cottage', 1)
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (5, N'Single Home', 1)
SET IDENTITY_INSERT [dbo].[PropertyType] OFF
/****** Object:  Table [dbo].[PropertyRequestType]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyRequestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyRequestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestType] ON
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (1, N'All Property Types', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (2, N'Apartment or Flat', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (3, N'Building', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (4, N'Commercial (Bar or Restaurant)', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (5, N'Commercial (Hotel)', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (6, N'Commercial (Office)', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (7, N'Commercial (Shop or Warehouse)', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (8, N'Compound', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (9, N'House', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (10, N'Labour Accommodation', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (11, N'Land', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (12, N'Penthouse', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (13, N'Studio', 1)
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (14, N'Villa', 1)
SET IDENTITY_INSERT [dbo].[PropertyRequestType] OFF
/****** Object:  Table [dbo].[PropertyRequestPrice]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyRequestPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyRequestPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestPrice] ON
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (1, N'10Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (2, N'20Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (3, N'30Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (4, N'40Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (5, N'50Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (6, N'60Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (7, N'70Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (8, N'80Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (9, N'90Lacs', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (10, N'1Cr', 1)
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (11, N'1.1Cr', 1)
SET IDENTITY_INSERT [dbo].[PropertyRequestPrice] OFF
/****** Object:  Table [dbo].[PropertyRequestContractType]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyRequestContractType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyRequestContractType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestContractType] ON
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (1, N'Sale', 1)
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (2, N'Rent', 1)
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (3, N'Short Term Rent', 1)
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (4, N'Serviced', 1)
SET IDENTITY_INSERT [dbo].[PropertyRequestContractType] OFF
/****** Object:  Table [dbo].[PropertyRequestArea]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyRequestArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyRequestArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestArea] ON
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (1, N'All Area', 1)
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (2, N'Khadakpada', 1)
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (3, N'Durgadi', 1)
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (4, N'Shivaji Chowk', 1)
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (5, N'Godrej Hill', 1)
SET IDENTITY_INSERT [dbo].[PropertyRequestArea] OFF
/****** Object:  Table [dbo].[PropertyDetail]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContractType] [nvarchar](50) NULL,
	[FromPrice] [nvarchar](50) NULL,
	[Bedroom] [nvarchar](50) NULL,
	[Bathroom] [nvarchar](50) NULL,
	[Parking] [nvarchar](50) NULL,
	[Date] [datetime] NOT NULL,
	[PropertyName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PropertyDescription] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Comments] [nvarchar](50) NULL,
	[Approved] [bit] NOT NULL,
	[IsActive] [bit] NULL,
	[AreaId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[ToPrice] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[PropertyAmenityMappingId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PropertyDetail] ON
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (1, N'Rent', N'1000000', N'1', N'1', N'3', CAST(0x0000A78C00ADA95A AS DateTime), N'Property 01', NULL, N'asdasd', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'asdasdsad', 1, 0, 1, 0, 1, 5, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (6, N'Sale', N'2000000', N'2', N'2', N'2', CAST(0x0000A78C00B4F139 AS DateTime), N'Property 02', NULL, N'ASAdAD', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'ASasASasASAsaSasAS', 1, 0, 2, 0, 1, 1, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (7, N'Rent', N'3000000', N'3', N'3', N'1', CAST(0x0000A78C00B5CE13 AS DateTime), N'Property 03', NULL, N'asdsad', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'asdsadsad', 1, 0, 1, 0, 1, 1, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (8, N'For Rent', NULL, N'1', N'1', NULL, CAST(0x0000A791010BB259 AS DateTime), N'Property 04', NULL, N'New Added', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'harshalsbhagat@gmail.comharshalsbhagat@gmail.com', 0, 0, 1, 0, 1, 5, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (9, N'For Sale', N'0', N'2', N'2', N'2', CAST(0x0000A791010E3051 AS DateTime), N'Property 05', NULL, N'Property 05 Property 05 Property 05', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'asasfdsafdasgdsagdsgdsag', 1, 0, 1, 0, 1, 5, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (10, N'For Sale', N'0', N'2', N'2', N'2', CAST(0x0000A791010E725B AS DateTime), N'Property 06', NULL, N'Property 06 Property 06 Property 06', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'Property 06Property 06Property 06Property 06', 1, 0, 1, 0, 1, 5, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (11, N'For Sale', N'0', N'2', N'2', N'2', CAST(0x0000A791010EA932 AS DateTime), N'Property 07', NULL, N'Property 07 Property 07 Property 07', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'Property 07 Property 07 Property 07', 1, 0, 1, 0, 1, 5, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (12, N'For Sale', N'123123213', N'3', N'3', N'2', CAST(0x0000A79101104E4A AS DateTime), N'Property 09', NULL, N'Property 09Property 09Property 09', N'harshal bhagat', N'harshalsbhagat@gmail.com', N'9921000041', N'Property 09Property 09Property 09', 1, 0, 2, 0, 1, 5, NULL, 1, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (27, N'For Sale', N'1', N'3', N'+5', N'2', CAST(0x0000A79500D82566 AS DateTime), N'Niwas', NULL, N'dfdklfjsdlk', N'pritu', N'pritu@gmail.com', N'87597895698', N'dsfsdfs', 0, 0, 1, 0, 1, 1, NULL, 2, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (28, N'For Sale', N'1', N'3', N'+5', N'2', CAST(0x0000A79500D83D19 AS DateTime), N'Niwas', NULL, N'dfdklfjsdlk', N'pritu', N'pritu@gmail.com', N'87597895698', N'dsfsdfs', 0, 0, 1, 0, 1, 1, NULL, 2, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (29, N'For Sale', N'120000', N'1', N'2', N'2', CAST(0x0000A79700BED790 AS DateTime), N'nirmal house', NULL, N'large', N'arun gavali', N'arun@gmail.com', N'9561764332', N'good luck', 1, 0, 2, 1, 1, 1, NULL, 2, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (30, N'For Sale', N'5000000', N'4', N'2', N'2', CAST(0x0000A79700E1276F AS DateTime), N'Banglo', NULL, N'test', N'M.S.Dhoni', N'Dhoni@gmail.com', N'7777777777', N'won', 1, 0, 8, 1, 1, 1, NULL, 2, 0)
INSERT [dbo].[PropertyDetail] ([Id], [ContractType], [FromPrice], [Bedroom], [Bathroom], [Parking], [Date], [PropertyName], [Address], [PropertyDescription], [FullName], [Email], [Phone], [Comments], [Approved], [IsActive], [AreaId], [CountryId], [StateId], [CityId], [ToPrice], [UserId], [PropertyAmenityMappingId]) VALUES (31, N'For Sale', N'300000', N'1', N'1', N'2', CAST(0x0000A798011F8FB1 AS DateTime), N'Pritu House', NULL, N'Sweet Home,Covered by trees near by Birla college.', N'Swati Desai', N'desai@gmail.com', N'8759856982', N'Please let us know if of interest.', 1, 0, 1, 1, 1, 1, NULL, 2, 0)
SET IDENTITY_INSERT [dbo].[PropertyDetail] OFF
/****** Object:  Table [dbo].[Userenquiery]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Userenquiery](
	[Userenquieryid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[MobileNumber] [varchar](50) NULL,
	[PropertyDetailId] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Userenquiery] PRIMARY KEY CLUSTERED 
(
	[Userenquieryid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Userenquiery] ON
INSERT [dbo].[Userenquiery] ([Userenquieryid], [Name], [Email], [MobileNumber], [PropertyDetailId], [Date]) VALUES (1, N'Riya', N'riya@gmailcom', N'147852369', 27, CAST(0xF63C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Userenquiery] OFF
/****** Object:  Table [dbo].[Amenity]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Amenity](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Amenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (1, N'In Town', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (2, N'House Keeping', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (3, N'Security', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (4, N'Elevator', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (5, N'Swimming Pool', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (6, N'Balcony', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (7, N'Gymnasium', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (8, N'Covered Parking', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (9, N'Jacuzzi', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (10, N'Laundary Room', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (11, N'Fully Furnished', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (12, N'Telephone', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (13, N'Satellite Channels', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (14, N'Internet', 1)
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (15, N'Home Electrics', 1)
/****** Object:  Table [dbo].[Users]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[profileimage] [varchar](500) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Gender], [DateOfBirth], [IsActive], [IsApproved], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [profileimage]) VALUES (1, N'Petter', N'Parker', N'9921000041', N'Male', CAST(0x0000A78601792D1E AS DateTime), 0, 0, N'peter.parker@gmail.com', 0, N'ABk6tfxRLCrvEt+/YpMmCO+d/u6h7xgVmRAFKkiC+B7jFHlII2ACl1UH/eFmnMJFkw==', N'9f09cad2-bc2a-4ea1-8608-de8d338f393c', NULL, 0, 0, NULL, 1, 0, N'peter.parker@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Gender], [DateOfBirth], [IsActive], [IsApproved], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [profileimage]) VALUES (2, N'Tom', N'Cruse', N'9921000041', N'Male', CAST(0x0000A786017A4C89 AS DateTime), 0, 0, N'Tom.Cruse@gamil.com', 0, N'AOXJzDL5hXLqd3vHSK9jJO4cj+YsK/MfbQOWmXSZ8rU55gv+7Uw4c79cFd34upMu0A==', N'922e4ff3-8dd7-47ee-9324-3d645b7b64a0', NULL, 0, 0, NULL, 1, 0, N'Tom.Cruse@gamil.com', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Gender], [DateOfBirth], [IsActive], [IsApproved], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [profileimage]) VALUES (3, N'Steve', N'Rogers', N'9921000041', N'Male', CAST(0x0000A78C00BD0F95 AS DateTime), 0, 0, N'Steve.Rogers@gmail.com', 0, N'AD3oVlOHAO+2fC8bm/nq/3bO+fvbBG0v6um/gaL3B3hJc0g8WiqjaqaoFNpEPrEJdQ==', N'ba5d9539-531a-461a-8807-74cffcf8181e', NULL, 0, 0, NULL, 1, 0, N'Steve.Rogers@gmail.com', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Gender], [DateOfBirth], [IsActive], [IsApproved], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [profileimage]) VALUES (4, N'Riya', N'Desai', N'1236547898', N'Female', CAST(0x0000A79A00FC43E9 AS DateTime), 0, 0, N'riy@gmail.com', 0, N'AK2pdRA+UQxNL9zd0ExUwgfjA+Dp4OAZa7d8vw8Pi4mqpLRoNR1FjRz16vTV2eWDWw==', N'332c5e8d-9c81-4926-8a20-2bfa7d12ab3d', NULL, 0, 0, NULL, 1, 0, N'riy@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserRoles]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (4, 2)
/****** Object:  Table [dbo].[UserLogins]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[State] ON
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (1, N'Maharashtra', 1, 1)
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  Table [dbo].[PropertyAmenityMapping]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyAmenityMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AmenityId] [int] NOT NULL,
	[PropertyDetailId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyAmenityMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PropertyAmenityMapping] ON
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (1, 1, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (2, 2, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (3, 3, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (4, 4, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (5, 5, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (6, 6, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (7, 7, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (8, 8, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (9, 9, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (10, 10, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (11, 11, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (12, 12, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (13, 13, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (14, 14, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (15, 15, 6)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (16, 1, 7)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (17, 4, 7)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (18, 7, 7)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (19, 1, 8)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (20, 4, 8)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (21, 7, 8)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (22, 10, 8)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (23, 13, 8)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (24, 1, 9)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (25, 4, 9)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (26, 1, 10)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (27, 4, 10)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (28, 1, 11)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (29, 4, 11)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (30, 1, 12)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (31, 4, 12)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (32, 7, 12)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (33, 4, 27)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (34, 8, 27)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (35, 10, 27)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (36, 4, 28)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (37, 8, 28)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (38, 10, 28)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (39, 1, 29)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (40, 4, 29)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (41, 1, 30)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (42, 5, 30)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (43, 12, 30)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (44, 14, 30)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (45, 1, 31)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (46, 7, 31)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (47, 8, 31)
INSERT [dbo].[PropertyAmenityMapping] ([Id], [AmenityId], [PropertyDetailId]) VALUES (48, 10, 31)
SET IDENTITY_INSERT [dbo].[PropertyAmenityMapping] OFF
/****** Object:  Table [dbo].[PropertyRequest]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyRequest](
	[PropertyRequestId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[FromPrice] [int] NOT NULL,
	[ContactType] [nvarchar](50) NULL,
	[PropertyRequestContractTypeId] [int] NOT NULL,
	[PropertyDescription] [nvarchar](50) NULL,
	[ToPrice] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsAgree] [bit] NOT NULL,
	[PropertyRequestTypeId] [int] NOT NULL,
	[PropertyRequestAreaId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyRequest] PRIMARY KEY CLUSTERED 
(
	[PropertyRequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PropertyRequest] ON
INSERT [dbo].[PropertyRequest] ([PropertyRequestId], [FullName], [Email], [PhoneNumber], [FromPrice], [ContactType], [PropertyRequestContractTypeId], [PropertyDescription], [ToPrice], [CreatedDate], [IsAgree], [PropertyRequestTypeId], [PropertyRequestAreaId]) VALUES (1, N'Aasd@asd.asd', N'Aasd@asd.asd', N'123124213', 2, NULL, 1, N'Aasd@asd.asd', 3, CAST(0x0000A78100E0842F AS DateTime), 1, 2, 2)
INSERT [dbo].[PropertyRequest] ([PropertyRequestId], [FullName], [Email], [PhoneNumber], [FromPrice], [ContactType], [PropertyRequestContractTypeId], [PropertyDescription], [ToPrice], [CreatedDate], [IsAgree], [PropertyRequestTypeId], [PropertyRequestAreaId]) VALUES (2, N'Hello H', N'Sasd@asdasd.coma', N'99921000041', 1, N'Email', 1, N'sadasd', 2, CAST(0x0000A78B01697DF1 AS DateTime), 0, 3, 2)
SET IDENTITY_INSERT [dbo].[PropertyRequest] OFF
/****** Object:  Table [dbo].[PropertyImage]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[PropertyDetailId] [int] NOT NULL,
	[dfg] [nchar](10) NULL,
 CONSTRAINT [PK_dbo.PropertyImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyImage] ON
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (1, N'~/Images/Server/636324948517108760_360_icon.png', 1, 1, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (2, N'~/Images/Server/636324948550255644_0844.image_0E59001C.png', 1, 1, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (3, N'~/Images/Server/636324948583518610_6750-2560x1600.jpg', 1, 1, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (4, N'~/Images/Server/636324965255289390_360_icon.png', 1, 6, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (5, N'~/Images/Server/636324965259125804_0844.image_0E59001C.png', 1, 6, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (6, N'~/Images/Server/636324965261897059_6750-2560x1600.jpg', 1, 6, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (7, N'~/Images/Server/636324967137026151_360_icon.png', 1, 7, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (8, N'~/Images/Server/636324967141396773_0844.image_0E59001C.png', 1, 7, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (9, N'~/Images/Server/636324967145038974_6750-2560x1600.jpg', 1, 7, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (10, N'~/Images/Server/636329474779925762_720-NLS_Wine-Bar-o.jpg', 1, 8, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (11, N'~/Images/Server/636329474783538334_1454656180Agra-Residential-Property.jpg', 1, 8, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (12, N'~/Images/Server/636329474786670592_download (1).jpg', 1, 8, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (13, N'~/Images/Server/636329480209470249_download.jpg', 1, 9, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (14, N'~/Images/Server/636329480213202892_property_projects_in_goa.jpg', 1, 9, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (15, N'~/Images/Server/636329480217385231_property-04.jpg', 1, 9, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (16, N'~/Images/Server/636329480788226706_THERIVER-Ledcor-Properties-Residential-Calgary-2-v2.jpg', 1, 10, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (17, N'~/Images/Server/636329480791689153_pune-properties2.jpg', 1, 10, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (18, N'~/Images/Server/636329480794519023_property-04.jpg', 1, 10, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (19, N'~/Images/Server/636329481267514652_1454656180Agra-Residential-Property.jpg', 1, 11, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (20, N'~/Images/Server/636329481267624721_download (1).jpg', 1, 11, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (21, N'~/Images/Server/636329481267724787_download.jpg', 1, 11, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (22, N'~/Images/Server/636329484848318067_THERIVER-Ledcor-Properties-Residential-Calgary-2-v2.jpg', 1, 12, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (23, N'~/Images/Server/636329484851930630_pune-properties2.jpg', 1, 12, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (24, N'~/Images/Server/636329484855403121_property-04.jpg', 1, 12, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (25, N'~/Images/Server/636332818178274847_Chrysanthemum.jpg', 1, 27, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (26, N'~/Images/Server/636332818178294848_Hydrangeas.jpg', 1, 27, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (27, N'~/Images/Server/636332818178314849_Koala.jpg', 1, 27, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (28, N'~/Images/Server/636332818380406408_Lighthouse.jpg', 1, 28, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (29, N'~/Images/Server/636332818380416409_Tulips.jpg', 1, 28, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (30, N'~/Images/Server/636332818380436410_xxxxxxxxxxxxxx.jpg', 1, 28, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (31, N'~/Images/Server/636334490900751528_Tulips.jpg', 1, 29, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (32, N'~/Images/Server/636334490900771529_Penguins.jpg', 1, 29, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (33, N'~/Images/Server/636334490900781529_Lighthouse.jpg', 1, 29, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (34, N'~/Images/Server/636334565856443119_Chrysanthemum.jpg', 1, 30, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (35, N'~/Images/Server/636334565856463120_Koala.jpg', 1, 30, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (36, N'~/Images/Server/636334565856483121_Lighthouse.jpg', 1, 30, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (37, N'~/Images/Server/636335566187160308_Desert.jpg', 1, 31, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (38, N'~/Images/Server/636335566187190309_Koala.jpg', 1, 31, NULL)
INSERT [dbo].[PropertyImage] ([Id], [ImagePath], [IsActive], [PropertyDetailId], [dfg]) VALUES (39, N'~/Images/Server/636335566187210311_Tulips.jpg', 1, 31, NULL)
SET IDENTITY_INSERT [dbo].[PropertyImage] OFF
/****** Object:  Table [dbo].[City]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (1, N'Mumbai', 1, 1)
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (2, N'Pune', 1, 1)
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (3, N'Nagpur', 1, 1)
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (4, N'Navi Mumbai', 1, 1)
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (5, N'Akola', 1, 1)
SET IDENTITY_INSERT [dbo].[City] OFF
/****** Object:  Table [dbo].[Area]    Script Date: 06/23/2017 17:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (1, N'Andheri', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (2, N'Bandra', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (3, N'Borivali', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (4, N'Dahisar', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (5, N'Goregaon', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (6, N'Jogeshwari', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (7, N'Juhu', 1, 1)
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (8, N'Kandivali', 1, 1)
SET IDENTITY_INSERT [dbo].[Area] OFF
/****** Object:  Default [DF__ContractT__IsAct__07020F21]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[ContractType] ADD  DEFAULT ((0)) FOR [IsActive]
GO
/****** Object:  Default [DF_Userenquiery_Date]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[Userenquiery] ADD  CONSTRAINT [DF_Userenquiery_Date]  DEFAULT (getdate()) FOR [Date]
GO
/****** Object:  ForeignKey [FK_dbo.Area_dbo.City_CityId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Area_dbo.City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_dbo.Area_dbo.City_CityId]
GO
/****** Object:  ForeignKey [FK_dbo.City_dbo.State_StateId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_dbo.City_dbo.State_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_dbo.City_dbo.State_StateId]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyAmenityMapping_dbo.Amenity_AmenityId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyAmenityMapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.Amenity_AmenityId] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[PropertyAmenityMapping] CHECK CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.Amenity_AmenityId]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyAmenityMapping_dbo.PropertyDetail_PropertyDetailId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyAmenityMapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.PropertyDetail_PropertyDetailId] FOREIGN KEY([PropertyDetailId])
REFERENCES [dbo].[PropertyDetail] ([Id])
GO
ALTER TABLE [dbo].[PropertyAmenityMapping] CHECK CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.PropertyDetail_PropertyDetailId]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyImage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId] FOREIGN KEY([PropertyDetailId])
REFERENCES [dbo].[PropertyDetail] ([Id])
GO
ALTER TABLE [dbo].[PropertyImage] CHECK CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyRequest_dbo.PropertyRequestArea_PropertyRequestAreaId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestArea_PropertyRequestAreaId] FOREIGN KEY([PropertyRequestAreaId])
REFERENCES [dbo].[PropertyRequestArea] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestArea_PropertyRequestAreaId]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyRequest_dbo.PropertyRequestContractType_PropertyRequestContractTypeId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestContractType_PropertyRequestContractTypeId] FOREIGN KEY([PropertyRequestContractTypeId])
REFERENCES [dbo].[PropertyRequestContractType] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestContractType_PropertyRequestContractTypeId]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_FromPrice]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_FromPrice] FOREIGN KEY([FromPrice])
REFERENCES [dbo].[PropertyRequestPrice] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_FromPrice]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_ToPrice]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_ToPrice] FOREIGN KEY([ToPrice])
REFERENCES [dbo].[PropertyRequestPrice] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_ToPrice]
GO
/****** Object:  ForeignKey [FK_dbo.PropertyRequest_dbo.PropertyRequestType_PropertyRequestTypeId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestType_PropertyRequestTypeId] FOREIGN KEY([PropertyRequestTypeId])
REFERENCES [dbo].[PropertyRequestType] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestType_PropertyRequestTypeId]
GO
/****** Object:  ForeignKey [FK_dbo.State_dbo.Country_CountryId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_dbo.State_dbo.Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_dbo.State_dbo.Country_CountryId]
GO
/****** Object:  ForeignKey [FK_dbo.UserClaims_dbo.Users_UserId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.UserLogins_dbo.Users_UserId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.UserRoles_dbo.Roles_RoleId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.UserRoles_dbo.Users_UserId]    Script Date: 06/23/2017 17:43:18 ******/
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId]
GO
