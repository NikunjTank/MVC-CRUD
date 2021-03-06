USE [master]
GO
/****** Object:  Database [TestingSample1]    Script Date: 17/4/2018 6:31:51 PM ******/
CREATE DATABASE [TestingSample1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestingSample1', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.GVMEXPRESS\MSSQL\DATA\TestingSample1.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestingSample1_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.GVMEXPRESS\MSSQL\DATA\TestingSample1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestingSample1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestingSample1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestingSample1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestingSample1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestingSample1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestingSample1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestingSample1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestingSample1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestingSample1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestingSample1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestingSample1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestingSample1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestingSample1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestingSample1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestingSample1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestingSample1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestingSample1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestingSample1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestingSample1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestingSample1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestingSample1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestingSample1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestingSample1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestingSample1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestingSample1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestingSample1] SET  MULTI_USER 
GO
ALTER DATABASE [TestingSample1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestingSample1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestingSample1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestingSample1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TestingSample1]
GO
/****** Object:  Table [dbo].[AdminProfile]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminProfile](
	[AdminProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_AdminProfile] PRIMARY KEY CLUSTERED 
(
	[AdminProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hobby]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobby](
	[HobbyId] [int] IDENTITY(1,1) NOT NULL,
	[HobbyName] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Hobby] PRIMARY KEY CLUSTERED 
(
	[HobbyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInRole]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInRole](
	[UserInRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserInRole] PRIMARY KEY CLUSTERED 
(
	[UserInRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserProfileId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminProfile] ON 

INSERT [dbo].[AdminProfile] ([AdminProfileId], [UserId], [FirstName], [LastName], [Phone], [CountryId]) VALUES (1, 1, N'adminFirst', N'adminLast', NULL, 1)
SET IDENTITY_INSERT [dbo].[AdminProfile] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime]) VALUES (1, N'c1', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [CreatedBy], [CreatedDateTime], [ModifiedBy], [ModifiedDateTime]) VALUES (2, N'c2', 1, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Hobby] ON 

INSERT [dbo].[Hobby] ([HobbyId], [HobbyName], [IsDeleted]) VALUES (1, N'h1', 0)
INSERT [dbo].[Hobby] ([HobbyId], [HobbyName], [IsDeleted]) VALUES (2, N'h2200', 0)
INSERT [dbo].[Hobby] ([HobbyId], [HobbyName], [IsDeleted]) VALUES (3, N'h3', 1)
SET IDENTITY_INSERT [dbo].[Hobby] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName], [IsDeleted]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([RoleId], [RoleName], [IsDeleted]) VALUES (2, N'User', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDeleted]) VALUES (1, N's1', 2, 0)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDeleted]) VALUES (2, N's2', 1, 0)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDeleted]) VALUES (3, N's7', 2, 0)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDeleted]) VALUES (4, N's5', 1, 0)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId], [IsDeleted]) VALUES (5, N'assasad', 2, 0)
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Username], [Password], [IsActive], [IsDeleted]) VALUES (1, N'admin@gmail.com', N'123456', 1, 0)
INSERT [dbo].[User] ([UserId], [Username], [Password], [IsActive], [IsDeleted]) VALUES (2, N'1', N'1', 1, 0)
INSERT [dbo].[User] ([UserId], [Username], [Password], [IsActive], [IsDeleted]) VALUES (3, N'u1@u.u', N'1', 1, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInRole] ON 

INSERT [dbo].[UserInRole] ([UserInRoleId], [UserId], [RoleId], [IsDeleted]) VALUES (1, 1, 1, 0)
INSERT [dbo].[UserInRole] ([UserInRoleId], [UserId], [RoleId], [IsDeleted]) VALUES (2, 2, 2, 0)
INSERT [dbo].[UserInRole] ([UserInRoleId], [UserId], [RoleId], [IsDeleted]) VALUES (3, 3, 2, 0)
SET IDENTITY_INSERT [dbo].[UserInRole] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserProfileId], [UserId], [FirstName], [LastName], [Phone], [CountryId]) VALUES (1, 2, N'uf', N'ul', N'878787', 1)
INSERT [dbo].[UserProfile] ([UserProfileId], [UserId], [FirstName], [LastName], [Phone], [CountryId]) VALUES (2, 3, N'u1f', N'u1l', N'9865983', 2)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Hobby] ADD  CONSTRAINT [DF_Hobby_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserInRole] ADD  CONSTRAINT [DF_UserInRole_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[AdminProfileGet]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AdminProfileGet]
(
	@UserId		int	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT AP.*
			,U.Username
	FROM AdminProfile AP
			INNER JOIN [dbo].[User] U ON AP.UserId = U.UserId
	WHERE U.IsDeleted = 0			
			AND AP.UserId = ISNULL(@UserId,AP.UserId)

END
GO
/****** Object:  StoredProcedure [dbo].[CountryAdd]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CountryAdd]
(
	@CountryName nvarchar(100),
	@CreatedBy int,
	@Result int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Country]
           ([CountryName]           
           ,[CreatedBy]
           ,[CreatedDateTime])
     VALUES
           (@CountryName           
           ,@CreatedBy
           ,GETDATE())

	SET @Result = SCOPE_IDENTITY()
						
END
GO
/****** Object:  StoredProcedure [dbo].[CountryDelete]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountryDelete]
(
	@CountryID int,
	@ModifiedBy int,
	@Result int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[Country]
	   SET IsDeleted = 1
		  ,[ModifiedBy] = @ModifiedBy
		  ,[ModifiedDateTime] = GETDATE()
	WHERE CountryId = @CountryID

	SET @Result = 1
						
END
GO
/****** Object:  StoredProcedure [dbo].[CountryGet]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CountryGet]
(
	@CountryId INT	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM Country
	WHERE IsDeleted = 0
			AND CountryId = ISNULL(@CountryId,CountryId)
						
END
GO
/****** Object:  StoredProcedure [dbo].[CountryUpdate]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountryUpdate]
(
	@CountryID int,
	@CountryName nvarchar(100),
	@ModifiedBy int,
	@Result int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[Country]
	   SET [CountryName] = @CountryName
		  ,[ModifiedBy] = @ModifiedBy
		  ,[ModifiedDateTime] = GETDATE()
	WHERE CountryId = @CountryID

	SET @Result = 1
						
END
GO
/****** Object:  StoredProcedure [dbo].[HobbyAdd]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HobbyAdd]
(
	@HobbyName	nvarchar(100),
	@Result		int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Hobby]
           ([HobbyName])
     VALUES
           (
			@HobbyName
           )

    SET @Result = 1
END
GO
/****** Object:  StoredProcedure [dbo].[HobbyDelete]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HobbyDelete]
(
	@HobbyId	int,	
	@Result		int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[Hobby]
	   SET IsDeleted = 1
	 WHERE HobbyId = @HobbyId

    SET @Result = 1
END
GO
/****** Object:  StoredProcedure [dbo].[HobbyGet]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HobbyGet]
(
	@HobbyId	int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT *
	FROM Hobby
	WHERE IsDeleted = 0
			AND HobbyId = ISNULL(@HobbyId,HobbyId)
END
GO
/****** Object:  StoredProcedure [dbo].[HobbyUpdate]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HobbyUpdate]
(
	@HobbyId	int,
	@HobbyName	nvarchar(100),
	@Result		int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[Hobby]
	   SET [HobbyName] = @HobbyName
	 WHERE HobbyId = @HobbyId

    SET @Result = 1
END
GO
/****** Object:  StoredProcedure [dbo].[StateAdd]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StateAdd]
(
	@StateName	NVARCHAR(100),
	@CountryId	INT,	
	@Result		INT OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[State]
           ([StateName]
		   ,[CountryId]
		   )
     VALUES
           (@StateName           
           ,@CountryId)

	SET @Result = SCOPE_IDENTITY()
						
END
GO
/****** Object:  StoredProcedure [dbo].[StateDelete]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StateDelete]
(
	@StateID int,	
	@Result int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[State]
	   SET IsDeleted = 1		  
	WHERE StateId = @StateID

	SET @Result = 1
						
END
GO
/****** Object:  StoredProcedure [dbo].[StateGet]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StateGet]
(
	@StateId	INT,
	@CountryId	INT	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT S.*
			,C.CountryName
	FROM [dbo].[State] S
			INNER JOIN Country C ON S.CountryId = C.CountryId
	WHERE S.IsDeleted = 0
			AND StateId = ISNULL(@StateId,StateId)
			AND S.CountryId = ISNULL(@CountryId,S.CountryId)
						
END
GO
/****** Object:  StoredProcedure [dbo].[StateUpdate]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StateUpdate]
(
	@StateID int,
	@StateName nvarchar(100),
	@CountryId	INT,
	@Result int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[State]
	   SET [StateName] = @StateName
			,[CountryId] = @CountryId
	WHERE StateId = @StateID

	SET @Result = 1
						
END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin]
(
	@Username	nvarchar(100),
	@Password	nvarchar(100)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT U.*
			,UIR.RoleId
	FROM [dbo].[User] U
			INNER JOIN UserInRole UIR ON U.UserId = UIR.UserId
	WHERE U.IsDeleted = 0
			AND U.IsActive = 1
			AND U.Username = @Username
			AND U.Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[UserProfileAdd]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserProfileAdd]
(
	@Username	nvarchar(100),
	@Password	nvarchar(100),
	@FirstName	nvarchar(100),
	@LastName	nvarchar(100),
	@Phone		nvarchar(100),
	@CountryId	int,
	@Result		int OUTPUT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UserId int

	INSERT INTO [dbo].[User]
           (
		   [Username]
           ,[Password]
		   )
     VALUES
           (
		   @Username
           ,@Password
           )

	SET @UserId = SCOPE_IDENTITY()

	INSERT INTO [dbo].[UserInRole]
           ([UserId]
           ,[RoleId])
     VALUES
           (@UserId
           ,(SELECT RoleId FROM Role WHERE RoleName = 'User'))

	INSERT INTO [dbo].[UserProfile]
           ([UserId]
           ,[FirstName]
           ,[LastName]
           ,[Phone]
           ,[CountryId])
     VALUES
           (@UserId
           ,@FirstName
           ,@LastName
           ,@Phone
           ,@CountryId)

	SET @Result = SCOPE_IDENTITY()
    
END
GO
/****** Object:  StoredProcedure [dbo].[UserProfileGet]    Script Date: 17/4/2018 6:31:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserProfileGet]
(
	@UserId		int	
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT UP.*
			,U.Username
	FROM UserProfile UP
			INNER JOIN [dbo].[User] U ON UP.UserId = U.UserId
	WHERE U.IsDeleted = 0			
			AND UP.UserId = ISNULL(@UserId,UP.UserId)

END
GO
USE [master]
GO
ALTER DATABASE [TestingSample1] SET  READ_WRITE 
GO
