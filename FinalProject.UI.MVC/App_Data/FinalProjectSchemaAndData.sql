/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT IF EXISTS [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 8:39:57 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CourseId] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFileName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[LessonId] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/11/2019 8:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912041918583_InitialCreate', N'FinalProject.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A7738AAC954B77B127B0B7489DB80DCEE68275B2386F0B5AA21D9D9528AD44A5090EFACBFAD09FD4BFD0A144DD78D1C5566CA758606191C36F86C321391C0EF3E7EF7F8C7F7CF23DE31147B11B908979343A340D4CECC071C96A622674F9E6BDF9E3877F7C37BE70FC27E3734E77C2E8A0258927E603A5E1A965C5F603F6513CF25D3B0AE260494776E05BC809ACE3C3C37F5B474716060813B00C63FC2921D4F571FA019FD380D838A409F2AE02077B312F879A798A6A5C231FC721B2F1C49CB90479B751F03F6CD3D1FDE5E8EAF37494B5328D33CF4520D11C7B4BD3408404145190F7F43EC6731A0564350FA1007977CF2106BA25F262CCFB715A9277EDD2E131EB925536CCA1EC24A681DF13F0E884EBC8129BAFA569B3D02168F102B44D9F59AF534D4ECC4B07A7459F020F1420323C9D7A11239E9857058BB338BCC67494371C6590B308E07E0DA2AFA32AE281D1B9DD416153C7A343F6EFC098261E4D223C2138A111F20E8CDB64E1B9F67FF0F35DF01593C9C9D16279F2FEED3BE49CBCFB019FBCADF614FA0A74B50228026B097104B2E165D17FD3B0EAED2CB161D1ACD226D30AD8124C0FD3B8424F1F3159D1079838C7EF4D63E63E61272FE1C6754F5C984DD08846097C5E279E87161E2EEAAD469EECFF06AEC76FDF0DC2F51A3DBAAB74E805FE30712298579FB097D6C60F6E984DAFDA787FE164B328F0D977DDBEB2DA2FF320896CD699404B7287A215A675E9C65669BC9D4C9A410D6FD639EAFE9B369354366F2529EBD03A332167B1EDD990CBFBB27C3B5BDC5918C2E0A5A6C534D26470FA4D6B24A01C180ADAD2948EBA9A12812EFE9D57C60B1FB9DE004B63072EE09D2CDDC8C7452F7F0AC01011E92DF32D8A6358199C5F50FCD0203AFC1C40F439B693080C764E911FBE38B7DB8780E0EBC45FB079B03D5E830DCDDDAFC10CD934882E086BB531DEC7C0FE1A24F48238E788E27B6AE780ECF3CEF5BB030C22CE996DE3389E813163671A80F39D035E127A72DC1B8E2D54BB764DA61E727DB56F222CA95F72D2D23F5153483E8A864CE5A73489FA3158B9A49BA839A95ED48CA255544ED6575406D64D524EA9173425689533A31ACCF34B476878D72F85DD7FDF6FB3CD5BB71654D438871512FF8C098E6019736E11A53822E50874593776E12CA4C3C798BEF8DE9472FA8CBC6468566BCD867411187E36A4B0FB3F1B5231A1F8D1759857D2E1409413037C277AF559AB7DCE09926D7B3AD4BAB96DE6DB590374D3E52C8E03DB4D67812214C6031975F9C18733DAA31A596FC4C808740C0CDD655B1E9440DF4CD1A86EC839F630C5C6999D850AA728B69123AB113AE4F4102CDF511582951192BA70DF4B3CC1D271C41A2176088A61A6BA84CAD3C225B61B22AF554B42CB8E5B18EB7BC143AC39C721268C61AB26BA305707449800051F6150DA3434B62A16D76C881AAF5537E66D2E6C39EE529C622B36D9E23B6BEC92FB6F2F6298CD1ADB827136ABA48B00DAE0DE2E0C949F55BA1A807870D93703154E4C1A03E52ED5560CB4AEB11D18685D25AFCE40B3236AD7F117CEABFB669EF583F2F6B7F54675EDC0366BFAD833D3CC7C4F6843A1058E64F33C5FB04AFC4415873390939FCF62EEEA8A26C2C0E798D64336A5BFABF443AD6610D1889A004B436B01E5D782129034A17A0897C7F21AA5E35E440FD83CEED608CBD77E01B662033276F57AB442A8BF44158DB3D3E9A3E859610D9291773A2C54701406212E5EF58E77508A2E2E2B2BA68B2FDCC71BAE748C0F4683825A3C578D92F2CE0CAEA5DC34DBB5A472C8FAB8641B6949709F345ACA3B33B896B88DB62B49E114F4700B3652517D0B1F68B2E5918E62B729EAC656963DC50BC69626CD6A7C85C2D025AB4ADA152F31E659CED5F4CDBC7F12929F615876ACC8452AA42D38D120422B2CD4026B9074E646313D47142D108BF34C1D5F2253EEAD9AE53F6759DD3EE541CCF7819C9AFDCE5A345CE6D7F65CD929E15833E8A9CF3C9B349CAEB003757383A5C3210F458A08FE34F0129FE81D2D7DEBEC1EAFDA3E2B9111C69620BFE448495A93DCDDFA10741A2079720C3C58853FB3FE80E921746ACFBDD1AAE2751EAA1E250F5855517441AC9D0DA0CEB1596BD044DFB1FF98B522BCCC3CE3092B55005ED413A392F3208155EABAA3D6D352AA98F59AEE8842EE491552A8EA216535C3A42664B5622D3C8D46D514DD39C839255574B9B63BB222BBA40AADA85E035B21B358D71D5591805205565477C72EB351C4C5748F7732ED8966E3AD2C3BFC6EB69769305E66651C662BACDCF157812AC53DB1F82DBE04C6CBF7D2AAB427C08DAD2A8B7D6C66551A0CFD4A54BB25AF2F448D57FB7ACCDAD5776DB16FBAFAD7E3F5B3DD17B510E920289214DC8B03A170F01BF34358FB231CE95496919846AE46D8E89F638AFD112318CDBF7953CFC56C59CF09AE10719738A659BA87797C78742CBCDFD99FB734561C3B9EE210AB7B50531FB32D646E914714D90F2892F32836786F52824A21EA4BE2E0A789F9FFB4D5691AED60BFD2E203E332BE27EEB7042AEEA2041BBFC979A1C3E4DF7778F15108FADBAB784AD15DE597FFFD92353D306E22984EA7C6A1A0E87586BFFEC0A2973459D30DA459FBD9C5EB9D6DB5370C4A5461B6ACFF6461E1D2419E2BE452FED3474FFFEA2B9AF249C246888A670743E10DA242DDB38275B0B44F0A1CF8A4E993827E9D553F31584734EDF30297F407131F17745F86F2963BDC871407A76D2C49A99E5B93B337CAD4DCF5DE24E5706F34D1E53CED1E7083E6626FE6A2BCB21CE7C1B64E450AF360D8BBB4FB17CF5BDE9754E5D269DF6D86F23693921B2E9AFE56B9C87B903DA7C806DA7DC6F1B66D4D1709DEF3B4CD7E79C57B666C7C9BDF7DF6F0B68D4D1720DE7363EB9523BC67B6B6ABFD73C796D6790BDD79C6AF9CBCA4B9D1514591DB327AB3903B1CFF17011841E651660F31D529644DE9AF2D0C4B123D537DEE9AC8589A38125F89A2996DBFBEF20DBFB1B39CA699AD26E3B389375FFF1B79739A66DE9A3CCA5DE4222B331955F9E12DEB58535AD56BCA3DAEF5A425D5BDCD676DBC9E7F4DA9C68328A5367B34B7CBAF27B37810950C39757A6412CB17C5B07756FEA623ECDFB1BB2A21D85F7824D8AEED9A05CD255906F9E62D48949308119A2B4C91035BEA5944DD25B22954B30074FA923C0DEAB16B9005762EC94D42C3844297B1BFF06A012FE60434F14FD3A5EB328F6F42F6150FD10510D36581FB1BF253E27A4E21F74C1113D24030EF82877BD9585216F65D3D1748D701E908C4D557384577D80F3D008B6FC81C3DE2756403F3FB8857C87E2E23803A90F681A8AB7D7CEEA25584FC986394EDE1136CD8F19F3EFC05C1361F83DA540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'769545d2-17e5-4d4d-a99f-365e3e1fdc1e', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'cff7be39-3a42-4d26-8724-309826c62d67', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1aa62b59-74d4-4d6e-bc1f-076d3931ff2c', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1d1a6de3-4cb7-47d4-a85d-55c1755843d1', N'1aa62b59-74d4-4d6e-bc1f-076d3931ff2c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f8d23f80-10e1-49eb-8934-cd4160752464', N'769545d2-17e5-4d4d-a99f-365e3e1fdc1e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ca8dfdbf-b561-4cfd-bd9e-ad8c5cb0396d', N'cff7be39-3a42-4d26-8724-309826c62d67')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1d1a6de3-4cb7-47d4-a85d-55c1755843d1', N'student@offleash.com', 0, N'AIHUJ0Zhd/L3NX4kaYa7Af35I6ath4x04nN8DVB6EO9Xw3x23Fk0xFoY0igRBwWC7g==', N'a74df4cd-bfbf-44d3-829c-c95c17f8c9ab', NULL, 0, 0, NULL, 1, 0, N'student@offleash.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ca8dfdbf-b561-4cfd-bd9e-ad8c5cb0396d', N'aoffleash@gmail.com', 0, N'AAHw39sTvv1wtdoezlKCN3Na2Gy+kv9Kg/qE/XzjWmkGwdXlgpbTDGKUaTG4lwv2sQ==', N'66a17381-cb0f-47b4-ab85-4608ebc1bd98', NULL, 0, 0, NULL, 1, 0, N'aoffleash@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f8d23f80-10e1-49eb-8934-cd4160752464', N'admin@offleash.com', 0, N'AImNrxBijkGjz34JEHx5pUuWoQUfPWeL1awG0w3Q622T7np3RqkZPs/NDY7f0DCENg==', N'6abb1363-087b-4f13-8dad-b45778db7084', NULL, 0, 0, NULL, 1, 0, N'admin@offleash.com')
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (2, N'Canine Body Language', N'Learning how to read and interpret subtle body language and facial expression will allow us to understand what a dog is really trying to tell us. Being able to read a dog will allow you to understand and even predict canine behavior.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (3, N'Group Play', N'Increase your dog leadership skills that make your off-leash dog playgroups safe and fun.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (4, N'Canine Development', N'Canine life stages and each experience explained.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (6, N'Breed Recognition', N'The ability to recognize each breed group, specific breeds and their traits.', 0)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (8, N'First Aid', N'First Aid description', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (2, N'CBL101 - Body Language Basics', 2, N'Dogs communicate with one another and with us using their own elegant, non-verbal language. This lesson focuses on important aspects of a dog’s body: eyes, ears, mouth, tail, sweat and overall body posture/movement. Staff can use this information to interpret what an animal is feeling.', N'https://youtu.be/8bg_gGguwzg', NULL, 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (5, N'CBL102 - What is Normal Behavior?', 2, N'Dogs will be dogs. They’ll fetch, roll over, and beg. They’ll also chew, dig, and bark. Sometimes, they are cute, and sometimes, they are troublesome. Which canine behaviors are normal and which are problematic?', NULL, N'NormalBehavior.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (7, N'CBL103 - Guide to Aggression', 2, N'Knowing and understanding these sometimes subtle signals are the key to keeping yourself, and your dogs safe. Get skilled in these canine ‘tells’ and you will be able to reduce stress for your dog, improve your training and handling and even learn to predict canine behaviour.', NULL, N'Aggression.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (8, N'CBL104 - Safe Greetings', 2, N'Greetings between dogs allow people to assess their own ability to handle stress, but that is of course not their primary purpose. Dog greetings serve a lot of functions in social species, from reducing uncertainty, fear and arousal to gathering information. ', N'https://youtu.be/ffmttLUp7_Y', NULL, 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (9, N'CBL105 - Why Dogs Bark', 2, N'There are various reasons why dogs bark as well as using several different types of barking to communicate their meaning. ', NULL, N'Barking.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (10, N'GP101 - Dog Training Vocabulary', 3, N'Basic vocabulary for dog training.', NULL, N'VocabFlashCards.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (11, N'GP102 - Introduction to Safe Handling', 3, N'It is important to remember not all animals will act like the pets in your home. Some animals come in to a brand new environment with no familiar smells, bedding, people, or noises. It takes time for dogs to adjust to new faces, sharing communal space, and the smells and sounds of a new place.', N'https://youtu.be/-XVoZ4NWpZU
', NULL, 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (13, N'GP103 - Dog Handling Equipment', 3, N'A quick rundown of basic tools used in playgroup.', NULL, N'Equipment.jpg', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (14, N'GP104 - Seasonal Safety', 3, N'Summer and winter safety protocols to keep dogs safe in group
', NULL, N'SeasonalSafety.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (15, N'CD101 - Intro to Canine Development', 4, N'Overview of development of canine life and different stages included
', NULL, N'CriticalDevelopmentPeriods.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (16, N'CD102 - Puppy & Transitional Period', 4, N'Neonatal, Transitional, Awareness
', NULL, N'PuppyPeriod.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (17, N'CD103 - Socialization Period', 4, N'Canine and Human', NULL, N'Socialization.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (18, N'CD104 - Impact Periods', 4, N'Fear Impact, Seniority Classification, Flight Instinct, Second Impact 
', NULL, N'Impact.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (19, N'CD105 - Old Age', 4, N'Maturity', NULL, N'OldAge.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (21, N'BR101 - Hounds', 6, N'All breeds in the Hound Group were bred to pursue warm-blooded quarry. Members of the Hound Group possess strong prey drives and often will stop at nothing to catch their quarries.', NULL, N'Hounds.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (22, N'BR102 - Sporting', 6, N'Breeds in the Sporting Group were bred to assist hunters in the capture and retrieval of feathered game. Many Sporting Group breeds possess thick, water-repellant coats resistant to harsh hunting conditions.', NULL, N'Sporting.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (23, N'BR103 - Working', 6, N'Breeds in the Working Group were developed to assist humans in some capacity – including pulling sleds and carts, guarding flocks and homes, and protecting their families – and many of these breeds are still used as working dogs today.', NULL, N'Working.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (24, N'BR104 - Herding', 6, N'The Herding Group comprises breeds developed for moving livestock, including sheep, cattle, and even reindeer.  The high levels of energy found in Herding Group breeds means finding them a job is recommended, lest they begin herding your children at home.', NULL, N'Herding.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (25, N'BR105 - Terrier', 6, N'The feisty, short-legged breeds in the Terrier Group were first bred to go underground in pursuit of rodents and other vermin. Long-legged terrier breeds dig out varmints rather than burrowing in after them are popular companion dogs today.', NULL, N'Terrier.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (26, N'BR106 - Toy', 6, N'The diminutive breeds of the Toy Group come in enough coat types and colors to satisfy nearly any preference, but all are small enough to fit comfortably in the lap of their adored humans. ', NULL, N'Toy.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (27, N'BR107 - Non-Sporting', 6, N'Today, the varied breeds of the Non-Sporting Group are largely sought after as companion animals, as they were all developed to interact with people in some capacity.
', NULL, N'NonSporting.jpg', 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (36, N'FA101 - CPR', 8, N'intro', NULL, N'd4de0c6a-a6db-4e87-9040-15cf9c190b83.pdf', 0)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email]) VALUES (N'1d1a6de3-4cb7-47d4-a85d-55c1755843d1', N'Student', N'OffLeash', N'student@offleash.com')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email]) VALUES (N'71e7479a-52b3-4992-874d-35a4c12b0c1b', N'Rachel', N'Punches', N'student2@offleash.com')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email]) VALUES (N'ca8dfdbf-b561-4cfd-bd9e-ad8c5cb0396d', N'Manager', N'OffLeash', N'manager@offleash.com')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email]) VALUES (N'd04e86fa-082b-4812-8ae7-07b9dcde68ce', N'Test', N'User', N'test@offleash.com')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Email]) VALUES (N'f8d23f80-10e1-49eb-8934-cd4160752464', N'Administrator', N'OffLeash', N'admin@offleash.com')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_UserDetails]
GO
