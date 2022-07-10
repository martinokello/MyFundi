USE [myfundi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09/07/2022 20:58:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Town] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certifications]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certifications](
	[CertificationId] [int] IDENTITY(1,1) NOT NULL,
	[CertificationName] [nvarchar](max) NULL,
	[CertificationDescription] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Certifications] PRIMARY KEY CLUSTERED 
(
	[CertificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientFundiContracts]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientFundiContracts](
	[ClientFundiContractId] [int] IDENTITY(1,1) NOT NULL,
	[ClientUserId] [uniqueidentifier] NOT NULL,
	[FundiUserId] [uniqueidentifier] NOT NULL,
	[ContractualDescription] [nvarchar](max) NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsSignedOffByClient] [bit] NOT NULL,
	[NotesForNotice] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[AgreedCost] [decimal](18, 2) NOT NULL,
	[NumberOfDaysToComplete] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ClientFundiContracts] PRIMARY KEY CLUSTERED 
(
	[ClientFundiContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProfiles]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProfiles](
	[ClientProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AddressId] [int] NOT NULL,
	[ProfileSummary] [nvarchar](max) NULL,
	[ProfileImageUrl] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClientProfiles] PRIMARY KEY CLUSTERED 
(
	[ClientProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[CompanyPhoneNUmber] [nvarchar](max) NULL,
	[LocationId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FundiProfileAndReviewRatings]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FundiProfileAndReviewRatings](
	[FundiRatingAndReviewId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Rating] [int] NOT NULL,
	[Review] [nvarchar](max) NULL,
	[FundiProfileId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[WorkCategoryType] [nvarchar](max) NULL,
 CONSTRAINT [PK_FundiProfileAndReviewRatings] PRIMARY KEY CLUSTERED 
(
	[FundiRatingAndReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FundiProfileCertifications]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FundiProfileCertifications](
	[FundiProfileCertificationId] [int] IDENTITY(1,1) NOT NULL,
	[FundiProfileId] [int] NOT NULL,
	[CertificationId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_FundiProfileCertifications] PRIMARY KEY CLUSTERED 
(
	[FundiProfileCertificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FundiProfileCourses]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FundiProfileCourses](
	[FundiProfileCourseTakenId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[FundiProfileId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_FundiProfileCourses] PRIMARY KEY CLUSTERED 
(
	[FundiProfileCourseTakenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FundiProfiles]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FundiProfiles](
	[FundiProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ProfileSummary] [nvarchar](max) NULL,
	[ProfileImageUrl] [nvarchar](max) NULL,
	[Skills] [nvarchar](max) NULL,
	[UsedPowerTools] [nvarchar](max) NULL,
	[FundiProfileCvUrl] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_FundiProfiles] PRIMARY KEY CLUSTERED 
(
	[FundiProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FundiWorkCategories]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FundiWorkCategories](
	[FundiWorkCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[FundiProfileId] [int] NOT NULL,
	[WorkCategoryId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_FundiWorkCategories] PRIMARY KEY CLUSTERED 
(
	[FundiWorkCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceName] [nvarchar](max) NULL,
	[NetCost] [decimal](18, 2) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[PercentTaxAppliable] [decimal](18, 2) NOT NULL,
	[HasFullyPaid] [bit] NOT NULL,
	[GrossCost] [decimal](18, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[ItemCost] [decimal](18, 2) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobDescription] [nvarchar](max) NULL,
	[LocationId] [int] NOT NULL,
	[ClientProfileId] [int] NOT NULL,
	[ClientUserId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[HasCompleted] [bit] NOT NULL,
	[ClientFundiContractId] [int] NULL,
	[AssignedFundiProfileId] [int] NULL,
	[AssignedFundiUserId] [uniqueidentifier] NULL,
	[HasBeenAssignedFundi] [bit] NOT NULL,
	[WorkCategoryIds] [nvarchar](max) NULL,
	[JobName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](max) NULL,
	[AddressId] [int] NOT NULL,
	[LocationName] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[Latitude] [real] NULL,
	[Longitude] [real] NULL,
	[IsGeocoded] [bit] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](450) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Username] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](450) NULL,
	[MobileNumber] [nvarchar](max) NULL,
	[Token] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[LastLogInTime] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkCategories]    Script Date: 09/07/2022 20:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCategories](
	[WorkCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[WorkCategoryType] [nvarchar](max) NULL,
	[WorkCategoryDescription] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_WorkCategories] PRIMARY KEY CLUSTERED 
(
	[WorkCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220118151044_dbInit', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220119152511_scalingEntities', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220119180035_extendDB', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220122225437_fundiProfileAddressIdAdded', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220123184631_FK_FundiProfiles_Users_UserId', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220616181420_ratingsReviewsTable', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220621152107_addFundiWorkCatColOnFundiRatingTable', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220628150856_x2', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220629120706_FundiClientContractJobTables', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220702121742_alterTableJob', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220702162345_fundiclientRelationshipsUpdate', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703095030_alterJobcolsIdstoNullable', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703124538_JobAssociationsToWorkCatIds', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220703171943_addColJobNameToJob', N'3.1.22')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220707103553_addLatLongIsGeocodedToLocationTable', N'3.1.22')
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([AddressId], [AddressLine1], [AddressLine2], [Country], [Town], [PostCode], [PhoneNumber], [DateCreated], [DateUpdated]) VALUES (1, N'MartinLayooInc Software Ltd.', N'Unit 3, 2 St. Johns Terrace', N'United Kingdom', N'London', N'W10', N'07809773365', CAST(N'2022-01-18T15:18:32.7181353' AS DateTime2), CAST(N'2022-01-18T15:18:32.7182443' AS DateTime2))
GO
INSERT [dbo].[Addresses] ([AddressId], [AddressLine1], [AddressLine2], [Country], [Town], [PostCode], [PhoneNumber], [DateCreated], [DateUpdated]) VALUES (2, N'Flat 3', N'13D Lanhill Road', N'UK', N'London ', N'W9', NULL, CAST(N'2022-07-09T18:50:00.8488803' AS DateTime2), CAST(N'2022-07-09T18:50:00.8488812' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Certifications] ON 
GO
INSERT [dbo].[Certifications] ([CertificationId], [CertificationName], [CertificationDescription], [DateCreated], [DateUpdated]) VALUES (1, N'Power Drills', N'Power Drills Usage', CAST(N'2022-01-23T13:37:57.7302271' AS DateTime2), CAST(N'2022-01-23T13:37:57.7302345' AS DateTime2))
GO
INSERT [dbo].[Certifications] ([CertificationId], [CertificationName], [CertificationDescription], [DateCreated], [DateUpdated]) VALUES (2, N'JBC Loader', N'JBC Loader Truck Usage', CAST(N'2022-01-23T13:40:19.2417035' AS DateTime2), CAST(N'2022-01-23T13:40:19.2417092' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Certifications] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientProfiles] ON 
GO
INSERT [dbo].[ClientProfiles] ([ClientProfileId], [UserId], [AddressId], [ProfileSummary], [ProfileImageUrl], [DateCreated], [DateUpdated]) VALUES (2, N'2614b3e3-944e-4015-9aae-08da547eb15a', 1, N'I am a well rounded and friendly individual. Full of trust, I offer my Jobs to good handy men, who should be able to tell me anything in trust. My thoughts are that the Fundi would know better since it is their skills and profession.

Give me a well done, job, and I am happy and will refer you to other jobs especially within my community. I always rate efficiency, and honesty as the 2 most important things, let alone friendly Fundis.', N'', CAST(N'2022-07-01T14:37:15.8127390' AS DateTime2), CAST(N'2022-07-01T14:37:15.8127570' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ClientProfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 
GO
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [CompanyPhoneNUmber], [LocationId], [DateCreated], [DateUpdated]) VALUES (1, N'MartinLayooInc Software', N'07809773365', 1, CAST(N'2022-01-18T15:18:32.9526558' AS DateTime2), CAST(N'2022-01-18T15:18:32.9527653' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 
GO
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [DateCreated], [DateUpdated]) VALUES (1, N'Health And Safety', N'Health And Safety on building sites and when working with heavy machinery', CAST(N'2022-01-23T13:56:46.7203024' AS DateTime2), CAST(N'2022-01-23T13:56:46.7203210' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[FundiProfileAndReviewRatings] ON 
GO
INSERT [dbo].[FundiProfileAndReviewRatings] ([FundiRatingAndReviewId], [UserId], [Rating], [Review], [FundiProfileId], [DateCreated], [DateUpdated], [WorkCategoryType]) VALUES (1, N'6b045821-b9b7-4d56-9459-08d9da95ccf7', 5, N'Admin is a seriously experienced Electrician. He works across small to huge infrastructure projects. His knowledge of complex circuitry is amazing. Wired my 2 storey property in half a day. It would normally take 2 days. Great chap', 7, CAST(N'2022-06-21T17:45:06.0773347' AS DateTime2), CAST(N'2022-06-21T17:45:06.0773388' AS DateTime2), N'Electrician')
GO
INSERT [dbo].[FundiProfileAndReviewRatings] ([FundiRatingAndReviewId], [UserId], [Rating], [Review], [FundiProfileId], [DateCreated], [DateUpdated], [WorkCategoryType]) VALUES (2, N'6b045821-b9b7-4d56-9459-08d9da95ccf7', 5, N'Joseph Lee is a great electician and very experienced. He manages a team very well, and can work across singularly. A very friendly chap with good knowledge of systems.', 8, CAST(N'2022-06-21T17:47:04.6315628' AS DateTime2), CAST(N'2022-06-21T17:47:04.6315667' AS DateTime2), N'Electrician')
GO
INSERT [dbo].[FundiProfileAndReviewRatings] ([FundiRatingAndReviewId], [UserId], [Rating], [Review], [FundiProfileId], [DateCreated], [DateUpdated], [WorkCategoryType]) VALUES (3, N'6b045821-b9b7-4d56-9459-08d9da95ccf7', 5, N'Admin loves capentry, as his artistic taste comes to life buidling Beds, Chairs, and Warddrobes, without fear. His approach is practical, and appears to measure by eye, and often gets it alright first time. Great Chap he is.', 7, CAST(N'2022-06-21T17:48:46.6279045' AS DateTime2), CAST(N'2022-06-21T17:48:46.6279072' AS DateTime2), N'Carpenter')
GO
INSERT [dbo].[FundiProfileAndReviewRatings] ([FundiRatingAndReviewId], [UserId], [Rating], [Review], [FundiProfileId], [DateCreated], [DateUpdated], [WorkCategoryType]) VALUES (4, N'2614b3e3-944e-4015-9aae-08da547eb15a', 4, N'I thiought I had got myself as Teacher of a Secondary school, in a mess. I needed 45 chairs and Desks built pretty fast, for students were due final examinations in a week''s time. Fundi Admin, took the role on, and with much pestimism in my thoughts, he said he could deliver everything in 4 days. I was surprised, and gave him the role. He actually delivered very good furniture within 3 days. 

A likable man, very amiable, and would recommend his expert experience to those who want furniture built at an affordable price.', 7, CAST(N'2022-06-22T19:44:50.5026556' AS DateTime2), CAST(N'2022-06-22T19:44:50.5026580' AS DateTime2), N'Carpenter')
GO
INSERT [dbo].[FundiProfileAndReviewRatings] ([FundiRatingAndReviewId], [UserId], [Rating], [Review], [FundiProfileId], [DateCreated], [DateUpdated], [WorkCategoryType]) VALUES (5, N'2614b3e3-944e-4015-9aae-08da547eb15a', 5, N'Exceptionally talented man. Works as an Electrician, who having fixed my Cooker and Washing Machine, he effectively went on to build a kitchen ladder for me, quite quickly without charging any more money for the ladder.

Very honest fella.', 8, CAST(N'2022-06-22T19:49:33.8206615' AS DateTime2), CAST(N'2022-06-22T19:49:33.8206638' AS DateTime2), N'Electrician')
GO
SET IDENTITY_INSERT [dbo].[FundiProfileAndReviewRatings] OFF
GO
SET IDENTITY_INSERT [dbo].[FundiProfileCertifications] ON 
GO
INSERT [dbo].[FundiProfileCertifications] ([FundiProfileCertificationId], [FundiProfileId], [CertificationId], [DateCreated], [DateUpdated]) VALUES (7, 7, 1, CAST(N'2022-01-23T22:46:52.6892022' AS DateTime2), CAST(N'2022-01-23T22:46:52.6892045' AS DateTime2))
GO
INSERT [dbo].[FundiProfileCertifications] ([FundiProfileCertificationId], [FundiProfileId], [CertificationId], [DateCreated], [DateUpdated]) VALUES (8, 7, 2, CAST(N'2022-01-23T22:47:46.2420164' AS DateTime2), CAST(N'2022-01-23T22:47:46.2420197' AS DateTime2))
GO
INSERT [dbo].[FundiProfileCertifications] ([FundiProfileCertificationId], [FundiProfileId], [CertificationId], [DateCreated], [DateUpdated]) VALUES (9, 8, 1, CAST(N'2022-01-24T09:54:09.1861563' AS DateTime2), CAST(N'2022-01-24T09:54:09.1861580' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[FundiProfileCertifications] OFF
GO
SET IDENTITY_INSERT [dbo].[FundiProfileCourses] ON 
GO
INSERT [dbo].[FundiProfileCourses] ([FundiProfileCourseTakenId], [CourseId], [FundiProfileId], [DateCreated], [DateUpdated]) VALUES (1, 1, 7, CAST(N'2022-01-23T20:10:35.3620880' AS DateTime2), CAST(N'2022-01-23T20:10:35.3620905' AS DateTime2))
GO
INSERT [dbo].[FundiProfileCourses] ([FundiProfileCourseTakenId], [CourseId], [FundiProfileId], [DateCreated], [DateUpdated]) VALUES (2, 1, 8, CAST(N'2022-01-24T09:36:59.9056434' AS DateTime2), CAST(N'2022-01-24T09:36:59.9056457' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[FundiProfileCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[FundiProfiles] ON 
GO
INSERT [dbo].[FundiProfiles] ([FundiProfileId], [UserId], [ProfileSummary], [ProfileImageUrl], [Skills], [UsedPowerTools], [FundiProfileCvUrl], [DateCreated], [DateUpdated], [AddressId]) VALUES (7, N'6b045821-b9b7-4d56-9459-08d9da95ccf7', N'This Is My Profile Summary', N'', N'These are my skills', N'JCB Driver, Heavy Crane Driver, Heavy Vehicle Driver. Power Drills Usage', N'', CAST(N'2022-01-23T18:52:45.2286492' AS DateTime2), CAST(N'2022-01-23T18:52:45.2286555' AS DateTime2), 1)
GO
INSERT [dbo].[FundiProfiles] ([FundiProfileId], [UserId], [ProfileSummary], [ProfileImageUrl], [Skills], [UsedPowerTools], [FundiProfileCvUrl], [DateCreated], [DateUpdated], [AddressId]) VALUES (8, N'7c07db16-5795-4f98-945b-08d9da95ccf7', N'I am a skilled Electrician with over 25 years experience working of large infrastructure Profiles as the Lead Electrician.', N'', N'Power Tools, Full Circuitry fittings across different building floors, and fitting main board, and different electrical devices.', N'Power Drill, All electric accessories', N'', CAST(N'2022-01-24T09:33:02.9456609' AS DateTime2), CAST(N'2022-01-24T09:33:02.9456661' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[FundiProfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[FundiWorkCategories] ON 
GO
INSERT [dbo].[FundiWorkCategories] ([FundiWorkCategoryId], [FundiProfileId], [WorkCategoryId], [DateCreated], [DateUpdated]) VALUES (1, 7, 1, CAST(N'2022-01-23T20:09:18.2090925' AS DateTime2), CAST(N'2022-01-23T20:09:18.2090943' AS DateTime2))
GO
INSERT [dbo].[FundiWorkCategories] ([FundiWorkCategoryId], [FundiProfileId], [WorkCategoryId], [DateCreated], [DateUpdated]) VALUES (2, 7, 2, CAST(N'2022-01-23T20:09:47.7875488' AS DateTime2), CAST(N'2022-01-23T20:09:47.7875506' AS DateTime2))
GO
INSERT [dbo].[FundiWorkCategories] ([FundiWorkCategoryId], [FundiProfileId], [WorkCategoryId], [DateCreated], [DateUpdated]) VALUES (4, 8, 1, CAST(N'2022-01-24T09:36:16.5718857' AS DateTime2), CAST(N'2022-01-24T09:36:16.5718881' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[FundiWorkCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 
GO
INSERT [dbo].[Locations] ([LocationId], [Country], [AddressId], [LocationName], [DateCreated], [DateUpdated], [Latitude], [Longitude], [IsGeocoded]) VALUES (1, N'United Kingdom', 1, N'3, 2 St John''s Terrace, London W10 4SB, UK', CAST(N'2022-01-18T15:18:32.8895635' AS DateTime2), CAST(N'2022-07-07T23:16:57.0947793' AS DateTime2), 51.52733, -0.2152936, 1)
GO
INSERT [dbo].[Locations] ([LocationId], [Country], [AddressId], [LocationName], [DateCreated], [DateUpdated], [Latitude], [Longitude], [IsGeocoded]) VALUES (40, NULL, 2, N'3, 13 Lanhill Rd, London W9, UK', CAST(N'2022-07-09T18:52:11.3651260' AS DateTime2), CAST(N'2022-07-09T18:52:11.3651275' AS DateTime2), 51.52658, -0.1963439, 1)
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'30e19029-655d-4ab8-76e4-08d9da95ca07', N'Administrator')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'f8b38eb6-0f4f-48d8-76e5-08d9da95ca07', N'Fundi')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'58cd64bb-a61c-4942-76e6-08d9da95ca07', N'Client')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'4f58c7b5-e5f2-4ccd-76e7-08d9da95ca07', N'Guest')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'7a1c47a6-6837-45be-16d1-08d9da95d90d', N'6b045821-b9b7-4d56-9459-08d9da95ccf7', N'30e19029-655d-4ab8-76e4-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'a021bc24-443b-4b39-3e68-08d9dacd087d', N'6b045821-b9b7-4d56-9459-08d9da95ccf7', N'f8b38eb6-0f4f-48d8-76e5-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'21b47098-f882-4008-3e69-08d9dacd087d', N'6b045821-b9b7-4d56-9459-08d9da95ccf7', N'58cd64bb-a61c-4942-76e6-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'7eb64b2a-9629-4d17-3e6a-08d9dacd087d', N'6b045821-b9b7-4d56-9459-08d9da95ccf7', N'4f58c7b5-e5f2-4ccd-76e7-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'd991eb4f-6199-4d3d-16d2-08d9da95d90d', N'7c07db16-5795-4f98-945b-08d9da95ccf7', N'f8b38eb6-0f4f-48d8-76e5-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'44c2cf91-b7bf-4fd3-16d3-08d9da95d90d', N'06c8cc00-2931-4d0b-945c-08d9da95ccf7', N'58cd64bb-a61c-4942-76e6-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'b3574e5a-a826-4e73-4726-08d9dac959de', N'41151b1a-930d-4c10-1b1a-08d9dac959d5', N'58cd64bb-a61c-4942-76e6-08d9da95ca07')
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [UserId], [RoleId]) VALUES (N'6053741f-efec-48ed-4467-08da547eb162', N'2614b3e3-944e-4015-9aae-08da547eb15a', N'58cd64bb-a61c-4942-76e6-08d9da95ca07')
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Username], [Password], [Email], [MobileNumber], [Token], [CompanyId], [CreateTime], [LastLogInTime], [IsActive], [IsLockedOut]) VALUES (N'6b045821-b9b7-4d56-9459-08d9da95ccf7', N'Administrator', N'Administrator', N'administrator@martinlayooinc.com', N'3YFoEKPCH7RRX7LG30XMxw==', N'administrator@martinlayooinc.com', N'07809773365', N'lNQGWQ/eqt6iWU4iG0A2mgNMt/OKY4HTMQf31+9z0iQSXkpqP8Pj98VLLFJiNAYUpAvFVXQqKGlf+dm7iuYumKw9GxQfdNDBoTFaMrxDDplrGTKc4utsP2cz02zERfX69pI9b6k21Z2sTXcLigeG65IPYc+k5wYQd1afeA06EWNMufFwyQCEAL5MdJPWfCVoUDyphBCyHJ+iSA+II2jgICDzU19HiVeql2KEtt4HcxZeroDY/XzFWei5nErTq5dpFeZJ8dkqnRn+LDceM2OcR70l7/8ABiWYl7IPoMOoW8C9glq7ECtOLOTrXYSTDsH9nqMtyMYSpqSorem9iDa07eE4NQUBoXlOLxrr/cPVXe+hegFqAlLsWH6EG/Mh+JQG2bCkf5wjNp87/b9Whv6AMFRSw6d78Cq49I4TZdH51SioXmICNqMm3z8VUhul+nfjm1LuF/P92N9YqTn05d8a9aUiYjOHwcVi6Co/ZxpB4i8wSWwt9mQq08koqXCOE2LX66O1y5PFqvRZWrihgJ8YWvNuJESHA5X0ZiBJUEN81Jx4cqRzAf7PjGD7UqRACJTONlEjIUOfhNmZ/jMFe9rkmF8PHDCUEQ4FYS2dQV1itjXHDk1m3WVhXHRybYmYjOXE//tvQLuwKm7jo8xymbxzbY+HtFPA6TssDkygKzWvJcQQkIjbHY7lPSmXU+pC+/MNzNMfgeLFSh/jLUzkuDvLWUM8VBB02f3iLpEgQHF42SdJbOlcjJU3EZV3fKtQZSfqe2bLxFqco6Bq7UVvV8a4KilsVCB36r8Fxp/0olFpfbBuoz3A2uyHCWCQaAunnmjEtmvv/i8946AgOSzUHsIW/IkLQ3A46naH85/mwWNOZL82vojqDhwpeT2VSswO523Rm4AC5IQEjhz2yXwnC4MHrvHZJzTIF/FjUkZMzvNnBVjE+Jo8dIAIk/qS3xz94O8VDEChH6h1Jg63wu6teYNlUuF+p54JzhQ7dv5bSADipFDlFe/9owXQaGa66OnLj3psWdwwmX8q1NOhljB7yMdMnOMtqyrYRwQR/ZXgCdgePVN7l9YYPQhOjScDE5Froj+PCYb162B/ur4jRn4oF6XMZsjsxC/8sw9RMvTQHSsUKISGt2HzhXo5kHxk7iNBnvCZg7ihCS8R8+c3MkTbgom74wWxKD0c4d5u6ijzRxPozYM=', 1, CAST(N'2022-01-18T15:18:32.9957765' AS DateTime2), CAST(N'2022-07-01T17:34:36.9232690' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Username], [Password], [Email], [MobileNumber], [Token], [CompanyId], [CreateTime], [LastLogInTime], [IsActive], [IsLockedOut]) VALUES (N'7c07db16-5795-4f98-945b-08d9da95ccf7', N'Josepth', N'Lee', N'joseph.lee@martinlayooinc.com', N'/qoGLh0s7Ii3+H6ftcrqrA==', N'joseph.lee@martinlayooinc.com', N'7059568686', N'lNQGWQ/eqt6iWU4iG0A2mgNMt/OKY4HTMQf31+9z0iQSXkpqP8Pj98VLLFJiNAYUpAvFVXQqKGlf+dm7iuYumKw9GxQfdNDBoTFaMrxDDpmPB6xPsjJmL9WuuM81acC+8IxqXGjfFdolCzNI8mato5IPYc+k5wYQd1afeA06EWNMufFwyQCEAL5MdJPWfCVoUDyphBCyHJ+iSA+II2jgICDzU19HiVeql2KEtt4HcxYDyA7gz2WfczfjSX4PdJs0f4O/Sqkwob7ApVl1TysLAHdhxcAKrj9dyGY22/nR2yRUUsOne/AquPSOE2XR+dUoqF5iAjajJt8/FVIbpfp345tS7hfz/djfWKk59OXfGvWlImIzh8HFYugqP2caQeIvbC4MdDp/lHo9wOw48bqqQyDy4Qo4Wzk9VdGkdI5iVPR2coVtdcbYX1mStDuwV8iIcxUAASq5YiH4yS20xVtsqSroky7oHmt8OGS/z4P7CTKfeMqLIe7PUXChSGltUwZracdaotybBM6Erc2In5JyxB2buAlqT45nSRfb3wCrpfPSzdj8NtfpitIZrnbbMG/lXincs7lmK2pL5LYcZi2ZAKa/JVEya8LLfFe47xtFo+4Dz8HVHP9sqY5Fcr0bpCctgWonBZ/GB563hOIZXiORzi+TBw3D/hSTWqgKX0Yu8BSQtAuP0HXhrqhysBUujhMQK3v/uk/icsyO1DMB+sDeqHgSymo2pIHwlRwLRDqc+RnCuZS005CR3GEfsdY9dMHMx04XiWfRTBRpo8Ad6YfpMrODhklmpVZp7ku2r9Lws4oPBkczNV95iDEhDa8mc/L9aRmAIiRRKacswMTGn4qc4RG8CLvyHc939LnNZ4DY3Fo=', 0, CAST(N'2022-01-18T15:20:26.0482510' AS DateTime2), CAST(N'2022-07-08T14:10:19.8618910' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Username], [Password], [Email], [MobileNumber], [Token], [CompanyId], [CreateTime], [LastLogInTime], [IsActive], [IsLockedOut]) VALUES (N'06c8cc00-2931-4d0b-945c-08d9da95ccf7', N'Leon', N'Okello', N'leon.okello@martinlayooinc.com', N'/qoGLh0s7Ii3+H6ftcrqrA==', N'leon.okello@martinlayooinc.com', N'7459568686', N'lNQGWQ/eqt6iWU4iG0A2mgNMt/OKY4HTMQf31+9z0iQSXkpqP8Pj98VLLFJiNAYUpAvFVXQqKGlf+dm7iuYumKw9GxQfdNDBoTFaMrxDDplvXA+/mRbZXUDRAnfm8N+PXUjooC2yJeGpLsseC9u09pIPYc+k5wYQd1afeA06EWNMufFwyQCEAL5MdJPWfCVoUDyphBCyHJ+iSA+II2jgICDzU19HiVeql2KEtt4HcxbUktdedM209AqiSWSETbHcxPiQBOdOHaw2PlecDVnyZ0OvCfIRkPUio4qzYYAA14RjiWZjJ28RD/boDFO6shyjvUD/CFQDn4uZPF9NLiQPcAnL6qdswG1OhkDyIOTcB6cScvCul8/hIfMNp5G67wzVtwMaYkoccIHJQjfCWLjOsJwYNJF8igi3N93+RwlE0PGFnoQr9N0DkbRPlQcNnx9mmRNU4GaxoJjCYaG+AXm+hL38FdpwhDO4nY6pi2qm/P3+822oeI1fGp9vvLAmedF5043lw9ocMMDs4q5+zf/IuOFwG0QUDfsOo//hjCQki74HIay+0TxP2Fk4+jGh7+xbJsYzP5UU8mdIXA6AmkC2nwez3kUk6QF9054QW8DCbXrkA2XyJ7s0d1BNILDZ2YBRxx2HBboJ11vmbL8ljQahkd/uo5CTHpVwoEn7aObNePgG3Rn97QOsTwuGUGqLVdJd7HZ9l4bVxfojHdP0cFfcN6y9YSIljpFM/c/i3cWhTbaQu3uhtO577btsgb3Q4Hy5xwMi3KADpgfvogMM8TAsHym68ZknBUmWZfG9mNOeTFJY4OeKWxllrieJcStEeXQVno1g1/sgOppJ/t66oR6uEzQdiPfaSLwaVFPFKI/61Tk=', 0, CAST(N'2022-01-18T15:24:09.8847573' AS DateTime2), CAST(N'2022-01-18T22:59:34.3709159' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Username], [Password], [Email], [MobileNumber], [Token], [CompanyId], [CreateTime], [LastLogInTime], [IsActive], [IsLockedOut]) VALUES (N'41151b1a-930d-4c10-1b1a-08d9dac959d5', N'Alison', N'Mbuga', N'alison.mbuga@martinlayooinc.com', N'/qoGLh0s7Ii3+H6ftcrqrA==', N'alison.mbuga@martinlayooinc.com', N'05035835761', N'lNQGWQ/eqt6iWU4iG0A2mgNMt/OKY4HTMQf31+9z0iQSXkpqP8Pj98VLLFJiNAYUpAvFVXQqKGlf+dm7iuYumKw9GxQfdNDBoTFaMrxDDpkrWy+/Yjeh5PWyMmYdZnvKJb1Mwrc+IzCOs82G3+zpk5IPYc+k5wYQd1afeA06EWNMufFwyQCEAL5MdJPWfCVoUDyphBCyHJ+iSA+II2jgICDzU19HiVeql2KEtt4HcxYzoZoAPX/kBqCIr7YtyqgxS9iSVUt49FdD+q4mRvAo8CKWbjXLC6/6CeRbRX1KM0EyNLNK9fzfF5Ypn2aXi9loKS8p87MnQ0ZKjvUa1jYwpNX8odfNU3csOx5eraDRopf7TcxCSiPWe0D0U8klvn/i4qetCZPXg93LzVBkVMAx2fClqdZLEk37xPbN4FgwnBf3ZHHDXeOcnaOXKDUjTjoN+P4fQC9/EuLrhKfIEEguFjRzpKH/dgoK3RslgVHYNypOmblAV2cusN1n0iTe0NYrXO0VsawlWtGtJ5cx4QAWiHxRreR0lTZw2DQGeguaLNE+oolDn597QNxdJZNfxcp2Tz/2K8QpwO4YBKGQAcK33MkAXrHjMEeUljK7+NfNR5Etbzo+KPmZRQpI9K0Crd58Y3+7kqUynAEFTmD6XNaqrcxIA3n5tTtmslW5ZyzQUNF5ZX24jr/M/19c/pVbyBQaAiZ5nbYvgdNZ0lFUKTq2fBE/7aY+WU/avf1eneyAdh+7IBcF/IKongt0PN7PFup09SayRWXVi68ZOM8jCt5oIs5StJZ2h5TxNwjpwOxdC0xa9Uv/2lDhfZx26kP4mXaheqYRCl8X4aQYTmNumyEiJ+wvu6SZC5LWiqUx6zASgHg=', 0, CAST(N'2022-01-18T21:27:37.9896325' AS DateTime2), CAST(N'2022-01-21T19:45:47.8399723' AS DateTime2), 1, 0)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Username], [Password], [Email], [MobileNumber], [Token], [CompanyId], [CreateTime], [LastLogInTime], [IsActive], [IsLockedOut]) VALUES (N'2614b3e3-944e-4015-9aae-08da547eb15a', N'Martel', N'Lindo', N'mart42uk@hotmail.com', N'/qoGLh0s7Ii3+H6ftcrqrA==', N'mart42uk@hotmail.com', N'07809773364', N'lNQGWQ/eqt6iWU4iG0A2mgNMt/OKY4HTMQf31+9z0iQSXkpqP8Pj98VLLFJiNAYUpAvFVXQqKGlf+dm7iuYumKw9GxQfdNDBoTFaMrxDDpn5pvFVts+jDrDg4/G6wy0BWycipY9BpxkTqjJCaa8zYddCgUUbrxNsOiXfu/jFfw4TfMaQW59WYBRs0tL99xt5lRh4uhbhGI7EITYVsuNR4UQPrEBnme/gjjZtVjEpAr4Drd9aJYul7XxQsmsviljHyhq9mAOFABYOzOmDfWyJhrbMd8Ec0TgMy7MJ9AucnA18F7BXpe5SOLs1BGBafAyYULTxfAr5oc69xycYVh+z8qNNhbN4lkMGhfnXSgHBPperen0E/MymLm7atg37fenn6saCeT3ogSK021PZgrRkRXat0cD1WhPsR0Rhb++x4KFiyYYcd4vZ3Bp+8iZsYQz0KtqPaRekxiMOpRv9q3mmYULucSiolh7aXGeRkPT4LPI9dGHj+3sc2kbN6WBp4aD9TEJEg3ZRVCYivLHFtK77P2yMiQOecnV3da8aHW8IsF6DLGYj5MJ5Y8V0MDeqBccnmYBEmP/8Ch30hpNYRqmIpEvI4OA0Z70YhmUSlGQ7tRXZsehK0hd+NiYdZgmyzsxAsIFWcbs6NKfB8aG76C5WmAmG9etgf7q+I0Z+KBelzGbn8g1OWFK3ch7smFaK+Ryfr+GCydgtKfd7YshiQrvhoaii1XqMWJ1RqdUwXI2AMLk2OU0N7hD2BwfMRb8QRIrn1M3okNPNa8zXiZvZsGIa1LmCqezd36YNz8sWY7qUk+84doZ+uBMBISXbDM9AJGehY6PAlGWwUhzSDSYhc7Furg==', 0, CAST(N'2022-06-22T19:40:34.4294697' AS DateTime2), CAST(N'2022-07-09T19:08:47.7291585' AS DateTime2), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[WorkCategories] ON 
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (1, N'Electrician', N'Dealing with Electric elements of Building and Infrastructure Projects', CAST(N'2022-01-23T13:50:28.2254776' AS DateTime2), CAST(N'2022-01-23T13:50:28.2254824' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (2, N'Carpenter', N'Dealing with Wood and fixing problems related to wood work.', CAST(N'2022-01-23T13:51:35.1039438' AS DateTime2), CAST(N'2022-01-23T13:51:35.1039511' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (3, N'Metal Work', N'Working with metals and alloys, with great finishes of metal joins. Welding and ensuring that the molten metal holds together fully. Filing metals for great finishes. ', CAST(N'2022-07-01T16:14:28.5001609' AS DateTime2), CAST(N'2022-07-01T16:14:28.5001619' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (4, N'Plumbing', N'Being able to confidently put together pipe works, for both sewage and domestic water works in both renovated and new buildings. Hands on and confident applying the required skills', CAST(N'2022-07-01T16:16:37.7993191' AS DateTime2), CAST(N'2022-07-01T16:16:37.7993201' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (5, N'Gardening', N'Gardening has become popular as people need their gardens exquisite looking. This gives a depth of character to any properties. Cutting edges, cutting lawns, and providing an array of beautiful flowers around is great these days. You can register as a gardener with this in mind ', CAST(N'2022-07-01T17:38:05.3049046' AS DateTime2), CAST(N'2022-07-01T17:38:05.3049056' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (6, N'Brick Layer', N'Laying bricks in straight lines, and with fine finishings. Mix 9f concrete and sand should be good to ensure adhesive mix content. ', CAST(N'2022-07-09T19:10:22.9559297' AS DateTime2), CAST(N'2022-07-09T19:10:22.9559307' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (7, N'Plasterer', N'Effective plastering of walls and ceilings, with great finishings. Care not to damage existing finishes. ', CAST(N'2022-07-09T19:12:03.9416488' AS DateTime2), CAST(N'2022-07-09T19:12:03.9416493' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (8, N'Painters', N'Able to quickly paint and double over the initial work, ensuring the paint work completion is as expected. Able to work unsupervised, and effectively. ', CAST(N'2022-07-09T19:13:52.9853648' AS DateTime2), CAST(N'2022-07-09T19:13:52.9853663' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (9, N'HGV Drivers', N'Heavy Goods Vehicle Drivers, that work in shifts. ', CAST(N'2022-07-09T19:22:54.3459479' AS DateTime2), CAST(N'2022-07-09T19:22:54.3459489' AS DateTime2))
GO
INSERT [dbo].[WorkCategories] ([WorkCategoryId], [WorkCategoryType], [WorkCategoryDescription], [DateCreated], [DateUpdated]) VALUES (10, N'Car Mechanics', N'Car Mechanics with proven history of dealing with mechanical devices in car systems. ', CAST(N'2022-07-09T19:23:58.4493768' AS DateTime2), CAST(N'2022-07-09T19:23:58.4493778' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[WorkCategories] OFF
GO
/****** Object:  Index [AK_UserRoles_UserId_RoleId]    Script Date: 09/07/2022 20:58:39 ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [AK_UserRoles_UserId_RoleId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Users_Username]    Script Date: 09/07/2022 20:58:39 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClientFundiContracts] ADD  DEFAULT ((0.0)) FOR [AgreedCost]
GO
ALTER TABLE [dbo].[ClientFundiContracts] ADD  DEFAULT ((0.0)) FOR [NumberOfDaysToComplete]
GO
ALTER TABLE [dbo].[FundiProfiles] ADD  DEFAULT ((0)) FOR [AddressId]
GO
ALTER TABLE [dbo].[Jobs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HasBeenAssignedFundi]
GO
ALTER TABLE [dbo].[Locations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsGeocoded]
GO
ALTER TABLE [dbo].[ClientFundiContracts]  WITH CHECK ADD  CONSTRAINT [FK_ClientFundiContracts_Users_ClientUserId] FOREIGN KEY([ClientUserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientFundiContracts] CHECK CONSTRAINT [FK_ClientFundiContracts_Users_ClientUserId]
GO
ALTER TABLE [dbo].[ClientFundiContracts]  WITH CHECK ADD  CONSTRAINT [FK_ClientFundiContracts_Users_FundiUserId] FOREIGN KEY([FundiUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ClientFundiContracts] CHECK CONSTRAINT [FK_ClientFundiContracts_Users_FundiUserId]
GO
ALTER TABLE [dbo].[ClientProfiles]  WITH CHECK ADD  CONSTRAINT [FK_ClientProfiles_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProfiles] CHECK CONSTRAINT [FK_ClientProfiles_Addresses_AddressId]
GO
ALTER TABLE [dbo].[ClientProfiles]  WITH CHECK ADD  CONSTRAINT [FK_ClientProfiles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProfiles] CHECK CONSTRAINT [FK_ClientProfiles_Users_UserId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Locations_LocationId]
GO
ALTER TABLE [dbo].[FundiProfileAndReviewRatings]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfileAndReviewRatings_FundiProfiles_FundiProfileId] FOREIGN KEY([FundiProfileId])
REFERENCES [dbo].[FundiProfiles] ([FundiProfileId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfileAndReviewRatings] CHECK CONSTRAINT [FK_FundiProfileAndReviewRatings_FundiProfiles_FundiProfileId]
GO
ALTER TABLE [dbo].[FundiProfileAndReviewRatings]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfileAndReviewRatings_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfileAndReviewRatings] CHECK CONSTRAINT [FK_FundiProfileAndReviewRatings_Users_UserId]
GO
ALTER TABLE [dbo].[FundiProfileCertifications]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfileCertifications_Certifications_CertificationId] FOREIGN KEY([CertificationId])
REFERENCES [dbo].[Certifications] ([CertificationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfileCertifications] CHECK CONSTRAINT [FK_FundiProfileCertifications_Certifications_CertificationId]
GO
ALTER TABLE [dbo].[FundiProfileCertifications]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfileCertifications_FundiProfiles_FundiProfileId] FOREIGN KEY([FundiProfileId])
REFERENCES [dbo].[FundiProfiles] ([FundiProfileId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfileCertifications] CHECK CONSTRAINT [FK_FundiProfileCertifications_FundiProfiles_FundiProfileId]
GO
ALTER TABLE [dbo].[FundiProfileCourses]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfileCourses_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfileCourses] CHECK CONSTRAINT [FK_FundiProfileCourses_Courses_CourseId]
GO
ALTER TABLE [dbo].[FundiProfileCourses]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfileCourses_FundiProfiles_FundiProfileId] FOREIGN KEY([FundiProfileId])
REFERENCES [dbo].[FundiProfiles] ([FundiProfileId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfileCourses] CHECK CONSTRAINT [FK_FundiProfileCourses_FundiProfiles_FundiProfileId]
GO
ALTER TABLE [dbo].[FundiProfiles]  WITH CHECK ADD  CONSTRAINT [FK_FundiProfiles_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiProfiles] CHECK CONSTRAINT [FK_FundiProfiles_Addresses_AddressId]
GO
ALTER TABLE [dbo].[FundiWorkCategories]  WITH CHECK ADD  CONSTRAINT [FK_FundiWorkCategories_FundiProfiles_FundiProfileId] FOREIGN KEY([FundiProfileId])
REFERENCES [dbo].[FundiProfiles] ([FundiProfileId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiWorkCategories] CHECK CONSTRAINT [FK_FundiWorkCategories_FundiProfiles_FundiProfileId]
GO
ALTER TABLE [dbo].[FundiWorkCategories]  WITH CHECK ADD  CONSTRAINT [FK_FundiWorkCategories_WorkCategories_WorkCategoryId] FOREIGN KEY([WorkCategoryId])
REFERENCES [dbo].[WorkCategories] ([WorkCategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FundiWorkCategories] CHECK CONSTRAINT [FK_FundiWorkCategories_WorkCategories_WorkCategoryId]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Users_UserId]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Invoices_InvoiceId] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Invoices_InvoiceId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_ClientProfiles_ClientProfileId] FOREIGN KEY([ClientProfileId])
REFERENCES [dbo].[ClientProfiles] ([ClientProfileId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_ClientProfiles_ClientProfileId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_FundiProfiles_AssignedFundiProfileId] FOREIGN KEY([AssignedFundiProfileId])
REFERENCES [dbo].[FundiProfiles] ([FundiProfileId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_FundiProfiles_AssignedFundiProfileId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Locations_LocationId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Users_AssignedFundiUserId] FOREIGN KEY([AssignedFundiUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Users_AssignedFundiUserId]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Users_ClientUserId] FOREIGN KEY([ClientUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Users_ClientUserId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Addresses_AddressId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
