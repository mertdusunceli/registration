USE [master]
GO
/****** Object:  Database [AdoNetIntegration]    Script Date: 8/22/2017 2:07:33 PM ******/
CREATE DATABASE [AdoNetIntegration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdoNetIntegration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AdoNetIntegration.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdoNetIntegration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AdoNetIntegration_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AdoNetIntegration] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdoNetIntegration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdoNetIntegration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdoNetIntegration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdoNetIntegration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdoNetIntegration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdoNetIntegration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdoNetIntegration] SET  MULTI_USER 
GO
ALTER DATABASE [AdoNetIntegration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdoNetIntegration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdoNetIntegration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdoNetIntegration] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AdoNetIntegration] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AdoNetIntegration]
GO
/****** Object:  Table [dbo].[Kullanici_Rol]    Script Date: 8/22/2017 2:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici_Rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ref_kullanici] [int] NOT NULL,
	[ref_rol] [int] NOT NULL,
 CONSTRAINT [PK_Kullanici_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 8/22/2017 2:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](128) NULL,
	[name] [varchar](50) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/22/2017 2:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[id] [int] NOT NULL,
	[rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([id], [email], [name], [username], [password]) VALUES (1, NULL, NULL, N'my-login', N'my-password-123')
INSERT [dbo].[Login] ([id], [email], [name], [username], [password]) VALUES (2, NULL, NULL, N'mert', N'1234A!')
INSERT [dbo].[Login] ([id], [email], [name], [username], [password]) VALUES (3, NULL, NULL, N'merhaba', N'merhaba')
INSERT [dbo].[Login] ([id], [email], [name], [username], [password]) VALUES (4, NULL, NULL, N'Mert2', N'mert2')
INSERT [dbo].[Login] ([id], [email], [name], [username], [password]) VALUES (5, N'', N'', N'qwqwweqe', N'123456')
INSERT [dbo].[Login] ([id], [email], [name], [username], [password]) VALUES (6, N'', N'', N'mert3', N'123456Q!')
SET IDENTITY_INSERT [dbo].[Login] OFF
ALTER TABLE [dbo].[Kullanici_Rol]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Rol_Login] FOREIGN KEY([ref_kullanici])
REFERENCES [dbo].[Login] ([id])
GO
ALTER TABLE [dbo].[Kullanici_Rol] CHECK CONSTRAINT [FK_Kullanici_Rol_Login]
GO
ALTER TABLE [dbo].[Kullanici_Rol]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Rol_Rol] FOREIGN KEY([ref_rol])
REFERENCES [dbo].[Rol] ([id])
GO
ALTER TABLE [dbo].[Kullanici_Rol] CHECK CONSTRAINT [FK_Kullanici_Rol_Rol]
GO
/****** Object:  StoredProcedure [dbo].[LoginByUsernamePassword]    Script Date: 8/22/2017 2:07:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================   
-- Author: <Author,,Asma Khalid>  
-- Create date: <Create Date,,15-Mar-2016>  
-- Description: <Description,,You are Allow to Distribute this Code>  
-- =============================================   
CREATE PROCEDURE [dbo].[LoginByUsernamePassword]   
@username varchar(50),   
@password varchar(50)   
AS   
BEGIN   
SELECT id, username, password   
FROM Login   
WHERE username = @username   
AND password = @password   
END   

GO
USE [master]
GO
ALTER DATABASE [AdoNetIntegration] SET  READ_WRITE 
GO
