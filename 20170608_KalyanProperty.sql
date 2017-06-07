USE [KalyanProperty]
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Area]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 6/7/2017 11:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.ContractType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginPl]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyAmenityMapping]    Script Date: 6/7/2017 11:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyAmenityMapping](
	[Id] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
	[PropertyDetailId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyAmenityMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyDetail]    Script Date: 6/7/2017 11:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContractType] [nvarchar](50) NULL,
	[FromPrice] [nvarchar](50) NULL,
	[Bedroom] [int] NULL,
	[Bathroom] [int] NULL,
	[Parking] [int] NULL,
	[AmenitiesID] [int] NULL,
	[Date] [datetime] NULL,
	[PropertyName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PropertyDescription] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Comments] [nvarchar](50) NULL,
	[Approved] [bit] NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyImage]    Script Date: 6/7/2017 11:59:59 PM ******/
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
 CONSTRAINT [PK_dbo.PropertyImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyRequest]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyRequestArea]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyRequestContractType]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyRequestPrice]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyRequestType]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyType]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/7/2017 11:59:59 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/7/2017 11:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (1, N'In Town', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (2, N'House Keeping', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (3, N'Security', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (4, N'Elevator', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (5, N'Swimming Pool', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (6, N'Balcony', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (7, N'Gymnasium', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (8, N'Covered Parking', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (9, N'Jacuzzi', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (10, N'Laundary Room', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (11, N'Fully Furnished', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (12, N'Telephone', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (13, N'Satellite Channels', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (14, N'Internet', 1)
GO
INSERT [dbo].[Amenity] ([Id], [Name], [IsActive]) VALUES (15, N'Home Electrics', 1)
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (1, N'Andheri', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (2, N'Bandra', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (3, N'Borivali', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (4, N'Dahisar', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (5, N'Goregaon', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (6, N'Jogeshwari', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (7, N'Juhu', 1, 1)
GO
INSERT [dbo].[Area] ([Id], [Name], [IsActive], [CityId]) VALUES (8, N'Kandivali', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

GO
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (1, N'Mumbai', 1, 1)
GO
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (2, N'Pune', 1, 1)
GO
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (3, N'Nagpur', 1, 1)
GO
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (4, N'Navi Mumbai', 1, 1)
GO
INSERT [dbo].[City] ([Id], [Name], [IsActive], [StateId]) VALUES (5, N'Akola', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractType] ON 

GO
INSERT [dbo].[ContractType] ([Id], [Name], [IsActive]) VALUES (1, N'For Sale', 1)
GO
INSERT [dbo].[ContractType] ([Id], [Name], [IsActive]) VALUES (2, N'For Rent', 1)
GO
SET IDENTITY_INSERT [dbo].[ContractType] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (1, N'India', 1)
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequest] ON 

GO
INSERT [dbo].[PropertyRequest] ([PropertyRequestId], [FullName], [Email], [PhoneNumber], [FromPrice], [ContactType], [PropertyRequestContractTypeId], [PropertyDescription], [ToPrice], [CreatedDate], [IsAgree], [PropertyRequestTypeId], [PropertyRequestAreaId]) VALUES (1, N'Aasd@asd.asd', N'Aasd@asd.asd', N'123124213', 2, NULL, 1, N'Aasd@asd.asd', 3, CAST(N'2017-05-28 13:37:26.343' AS DateTime), 1, 2, 2)
GO
INSERT [dbo].[PropertyRequest] ([PropertyRequestId], [FullName], [Email], [PhoneNumber], [FromPrice], [ContactType], [PropertyRequestContractTypeId], [PropertyDescription], [ToPrice], [CreatedDate], [IsAgree], [PropertyRequestTypeId], [PropertyRequestAreaId]) VALUES (2, N'Hello H', N'Sasd@asdasd.coma', N'99921000041', 1, N'Email', 1, N'sadasd', 2, CAST(N'2017-06-07 21:56:09.123' AS DateTime), 0, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[PropertyRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestArea] ON 

GO
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (1, N'All Area', 1)
GO
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (2, N'Khadakpada', 1)
GO
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (3, N'Durgadi', 1)
GO
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (4, N'Shivaji Chowk', 1)
GO
INSERT [dbo].[PropertyRequestArea] ([Id], [Name], [IsActive]) VALUES (5, N'Godrej Hill', 1)
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestArea] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestContractType] ON 

GO
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (1, N'Sale', 1)
GO
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (2, N'Rent', 1)
GO
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (3, N'Short Term Rent', 1)
GO
INSERT [dbo].[PropertyRequestContractType] ([Id], [Name], [IsActive]) VALUES (4, N'Serviced', 1)
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestContractType] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestPrice] ON 

GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (1, N'10Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (2, N'20Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (3, N'30Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (4, N'40Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (5, N'50Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (6, N'60Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (7, N'70Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (8, N'80Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (9, N'90Lacs', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (10, N'1Cr', 1)
GO
INSERT [dbo].[PropertyRequestPrice] ([Id], [Price], [IsActive]) VALUES (11, N'1.1Cr', 1)
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestType] ON 

GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (1, N'All Property Types', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (2, N'Apartment or Flat', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (3, N'Building', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (4, N'Commercial (Bar or Restaurant)', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (5, N'Commercial (Hotel)', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (6, N'Commercial (Office)', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (7, N'Commercial (Shop or Warehouse)', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (8, N'Compound', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (9, N'House', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (10, N'Labour Accommodation', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (11, N'Land', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (12, N'Penthouse', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (13, N'Studio', 1)
GO
INSERT [dbo].[PropertyRequestType] ([Id], [Name], [IsActive]) VALUES (14, N'Villa', 1)
GO
SET IDENTITY_INSERT [dbo].[PropertyRequestType] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyType] ON 

GO
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (2, N'Apartment', 1)
GO
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (3, N'Family House', 1)
GO
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (4, N'Cottage', 1)
GO
INSERT [dbo].[PropertyType] ([Id], [Name], [IsActive]) VALUES (5, N'Single Home', 1)
GO
SET IDENTITY_INSERT [dbo].[PropertyType] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Customer')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (1, N'Maharashtra', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[State] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (1, 1)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Gender], [DateOfBirth], [IsActive], [IsApproved], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (1, N'Petter', N'Parker', N'9921000041', N'Male', CAST(N'2017-06-02 22:53:15.407' AS DateTime), 0, 0, N'peter.parker@gmail.com', 0, N'ABk6tfxRLCrvEt+/YpMmCO+d/u6h7xgVmRAFKkiC+B7jFHlII2ACl1UH/eFmnMJFkw==', N'9f09cad2-bc2a-4ea1-8608-de8d338f393c', NULL, 0, 0, NULL, 1, 0, N'peter.parker@gmail.com')
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [Gender], [DateOfBirth], [IsActive], [IsApproved], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (2, N'Tom', N'Cruse', N'9921000041', N'Male', CAST(N'2017-06-02 22:57:20.670' AS DateTime), 0, 0, N'Tom.Cruse@gamil.com', 0, N'AOXJzDL5hXLqd3vHSK9jJO4cj+YsK/MfbQOWmXSZ8rU55gv+7Uw4c79cFd34upMu0A==', N'922e4ff3-8dd7-47ee-9324-3d645b7b64a0', NULL, 0, 0, NULL, 1, 0, N'Tom.Cruse@gamil.com')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Area_dbo.City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_dbo.Area_dbo.City_CityId]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_dbo.City_dbo.State_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_dbo.City_dbo.State_StateId]
GO
ALTER TABLE [dbo].[PropertyAmenityMapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.Amenity_AmenityId] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[PropertyAmenityMapping] CHECK CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.Amenity_AmenityId]
GO
ALTER TABLE [dbo].[PropertyAmenityMapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.PropertyDetail_PropertyDetailId] FOREIGN KEY([PropertyDetailId])
REFERENCES [dbo].[PropertyDetail] ([Id])
GO
ALTER TABLE [dbo].[PropertyAmenityMapping] CHECK CONSTRAINT [FK_dbo.PropertyAmenityMapping_dbo.PropertyDetail_PropertyDetailId]
GO
ALTER TABLE [dbo].[PropertyImage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId] FOREIGN KEY([PropertyDetailId])
REFERENCES [dbo].[PropertyDetail] ([Id])
GO
ALTER TABLE [dbo].[PropertyImage] CHECK CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId]
GO
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestArea_PropertyRequestAreaId] FOREIGN KEY([PropertyRequestAreaId])
REFERENCES [dbo].[PropertyRequestArea] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestArea_PropertyRequestAreaId]
GO
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestContractType_PropertyRequestContractTypeId] FOREIGN KEY([PropertyRequestContractTypeId])
REFERENCES [dbo].[PropertyRequestContractType] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestContractType_PropertyRequestContractTypeId]
GO
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_FromPrice] FOREIGN KEY([FromPrice])
REFERENCES [dbo].[PropertyRequestPrice] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_FromPrice]
GO
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_ToPrice] FOREIGN KEY([ToPrice])
REFERENCES [dbo].[PropertyRequestPrice] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestPrice_ToPrice]
GO
ALTER TABLE [dbo].[PropertyRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestType_PropertyRequestTypeId] FOREIGN KEY([PropertyRequestTypeId])
REFERENCES [dbo].[PropertyRequestType] ([Id])
GO
ALTER TABLE [dbo].[PropertyRequest] CHECK CONSTRAINT [FK_dbo.PropertyRequest_dbo.PropertyRequestType_PropertyRequestTypeId]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_dbo.State_dbo.Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_dbo.State_dbo.Country_CountryId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo.UserClaims_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_dbo.UserLogins_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId]
GO
