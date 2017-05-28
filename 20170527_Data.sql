USE [KalyanProperty]
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
SET IDENTITY_INSERT [dbo].[Country] ON 

GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (1, N'India', 1)
GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (2, N'US', 1)
GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (3, N'England', 1)
GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (4, N'England', 1)
GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (5, N'India', 1)
GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (6, N'America', 1)
GO
INSERT [dbo].[Country] ([Id], [Name], [IsActive]) VALUES (7, N'London', 1)
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (1, N'Maharashtra', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (2, N'Gujrat', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (3, N'Karnatak', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (4, N'Tamilnadu', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (5, N'Andhra Pradesh', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (6, N'Uttar Pradhesh', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (7, N'Bengal', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (8, N'Bihar', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (9, N'Himachal Pradesh', 1, 1)
GO
INSERT [dbo].[State] ([Id], [Name], [IsActive], [CountryId]) VALUES (10, N'Haryana', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[State] OFF
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
SET IDENTITY_INSERT [dbo].[City] OFF
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
SET IDENTITY_INSERT [dbo].[PropertyRequest] ON 

GO
INSERT [dbo].[PropertyRequest] ([PropertyRequestId], [FullName], [Email], [PhoneNumber], [FromPrice], [ContactType], [PropertyRequestContractTypeId], [PropertyDescription], [ToPrice], [CreatedDate], [IsAgree], [PropertyRequestTypeId], [PropertyRequestAreaId]) VALUES (1, N'Aasd@asd.asd', N'Aasd@asd.asd', N'123124213', 2, NULL, 1, N'Aasd@asd.asd', 3, CAST(N'2017-05-28 13:37:26.343' AS DateTime), 1, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[PropertyRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Phone], [DateOfBirth], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (2, NULL, NULL, NULL, CAST(N'2017-05-23 00:55:19.177' AS DateTime), N'harshalsbhagat@gmail.com', 0, N'AJHjEe4ZtvQr99PCdFy2lcf8Wad4qjmHvFEQcvrOQDQwSvMkAowsAmr51SPguvqSCg==', N'5f75c99e-d3c2-4b1f-acd2-a2e895e047fb', NULL, 0, 0, NULL, 1, 0, N'harshalsbhagat@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
