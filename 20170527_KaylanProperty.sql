USE [KalyanProperty]
GO
/****** Object:  Table [dbo].[AgentInfo]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentInfo](
	[id] [int] NOT NULL,
	[PropertyDetailId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[IsActive] [bit] NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nchar](10) NULL,
	[State] [nchar](10) NULL,
 CONSTRAINT [PK_dbo.AgentInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[Id] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Amenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[DistrictId] [int] NULL,
 CONSTRAINT [PK_dbo.Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[ContractType]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Conmmertial] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Rent] [nvarchar](50) NULL,
	[Sale] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.ContractType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[District]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CityId] [int] NULL,
 CONSTRAINT [PK_dbo.District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Feature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginPl]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[PropertyDetail]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[Images] [nvarchar](50) NULL,
	[Approved] [varchar](1) NULL,
	[Featured] [varchar](1) NULL,
	[Area] [nvarchar](50) NULL,
	[country] [nchar](10) NULL,
	[State] [nvarchar](50) NULL,
	[agent] [bit] NULL,
	[city] [nchar](10) NULL,
	[DistrictId] [nchar](10) NULL,
	[ToPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.PropertyDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyImage]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[PropertyDetailId] [int] NOT NULL,
	[PropertyImage] [varbinary](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ImagePath] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PropertyImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyRequest]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[PropertyRequestArea]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[PropertyRequestContractType]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[PropertyRequestPrice]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[PropertyRequestType]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[PropertyType]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[UserClaims]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[UserLogins]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/28/2017 1:39:28 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 5/28/2017 1:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NOT NULL,
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
ALTER TABLE [dbo].[AgentInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AgentInfo_dbo.PropertyDetail_PropertyDetailId] FOREIGN KEY([PropertyDetailId])
REFERENCES [dbo].[PropertyDetail] ([Id])
GO
ALTER TABLE [dbo].[AgentInfo] CHECK CONSTRAINT [FK_dbo.AgentInfo_dbo.PropertyDetail_PropertyDetailId]
GO
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Amenity_dbo.Feature_FeatureId] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_dbo.Amenity_dbo.Feature_FeatureId]
GO
ALTER TABLE [dbo].[Amenity]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Amenity_dbo.Service_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Amenity] CHECK CONSTRAINT [FK_dbo.Amenity_dbo.Service_ServiceId]
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Area_dbo.District_DistrictId] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_dbo.Area_dbo.District_DistrictId]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_dbo.City_dbo.State_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_dbo.City_dbo.State_StateId]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_dbo.District_dbo.City_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_dbo.District_dbo.City_CityId]
GO
ALTER TABLE [dbo].[PropertyDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyDetail_dbo.Amenity_AmenitiesID] FOREIGN KEY([AmenitiesID])
REFERENCES [dbo].[Amenity] ([Id])
GO
ALTER TABLE [dbo].[PropertyDetail] CHECK CONSTRAINT [FK_dbo.PropertyDetail_dbo.Amenity_AmenitiesID]
GO
ALTER TABLE [dbo].[PropertyImage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId] FOREIGN KEY([PropertyDetailId])
REFERENCES [dbo].[PropertyDetail] ([Id])
GO
ALTER TABLE [dbo].[PropertyImage] CHECK CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyDetail_PropertyDetailId]
GO
ALTER TABLE [dbo].[PropertyImage]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyType_PropertyTypeId] FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[PropertyType] ([Id])
GO
ALTER TABLE [dbo].[PropertyImage] CHECK CONSTRAINT [FK_dbo.PropertyImage_dbo.PropertyType_PropertyTypeId]
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
