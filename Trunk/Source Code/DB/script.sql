USE [master]
GO
/****** Object:  Database [Hospital_Postal]    Script Date: 08-02-2018 3:25:45 PM ******/
CREATE DATABASE [Hospital_Postal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital_Postal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Hospital_Postal.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_Postal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Hospital_Postal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospital_Postal] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital_Postal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital_Postal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital_Postal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital_Postal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital_Postal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital_Postal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital_Postal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital_Postal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital_Postal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital_Postal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital_Postal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital_Postal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital_Postal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital_Postal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital_Postal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital_Postal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital_Postal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital_Postal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital_Postal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital_Postal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital_Postal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital_Postal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital_Postal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital_Postal] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital_Postal] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital_Postal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital_Postal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital_Postal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital_Postal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hospital_Postal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital_Postal', N'ON'
GO
USE [Hospital_Postal]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NULL,
	[UploadBy] [int] NOT NULL,
	[UploadDate] [datetime] NOT NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[Link] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting](
	[MeetingId] [int] IDENTITY(1,1) NOT NULL,
	[MeetingName] [nvarchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Content] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Meeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mission]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mission](
	[MissionId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Place] [nvarchar](500) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Createby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Updateby] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Mission] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MissionWorker]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MissionWorker](
	[MissionWorkerId] [int] IDENTITY(1,1) NOT NULL,
	[MissionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_MissionWorker] PRIMARY KEY CLUSTERED 
(
	[MissionWorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] NOT NULL,
	[NotificationName] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[Status] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NOT NULL,
	[RoomSize] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBooking](
	[RoomBookingId] [int] IDENTITY(1,1) NOT NULL,
	[MeetingId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RoomBooking] PRIMARY KEY CLUSTERED 
(
	[RoomBookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftNO] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[ShiftDayID] [int] NOT NULL,
	[Other] [nvarchar](300) NULL,
 CONSTRAINT [PK_WorkShift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftDay]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftDay](
	[ShiftDayID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftDay] [date] NOT NULL,
	[DayInWeek] [nvarchar](50) NOT NULL,
	[ShiftScheduleId] [int] NOT NULL,
 CONSTRAINT [PK_WorkDay] PRIMARY KEY CLUSTERED 
(
	[ShiftDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftSchedule]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftSchedule](
	[ShiftScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Createby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[Updateby] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ShiftSchedule] PRIMARY KEY CLUSTERED 
(
	[ShiftScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftWorker]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftWorker](
	[ShiftWorkerId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ShiftWorker] PRIMARY KEY CLUSTERED 
(
	[ShiftWorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 08-02-2018 3:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Sex] [int] NOT NULL,
	[DayOfBirth] [date] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](600) NULL,
	[Certificate] [nvarchar](600) NULL,
	[Status] [int] NOT NULL,
	[Manager] [bit] NOT NULL,
	[Scheduler] [bit] NOT NULL,
	[Poster] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Category]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_User] FOREIGN KEY([UploadBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_User]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_User1] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_User1]
GO
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_User1] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_User1]
GO
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_User2] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_User2]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_User1] FOREIGN KEY([Createby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_User1]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_User2] FOREIGN KEY([Updateby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_User2]
GO
ALTER TABLE [dbo].[MissionWorker]  WITH CHECK ADD  CONSTRAINT [FK_MissionWorker_Mission] FOREIGN KEY([MissionId])
REFERENCES [dbo].[Mission] ([MissionId])
GO
ALTER TABLE [dbo].[MissionWorker] CHECK CONSTRAINT [FK_MissionWorker_Mission]
GO
ALTER TABLE [dbo].[MissionWorker]  WITH CHECK ADD  CONSTRAINT [FK_MissionWorker_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[MissionWorker] CHECK CONSTRAINT [FK_MissionWorker_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_Meeting] FOREIGN KEY([MeetingId])
REFERENCES [dbo].[Meeting] ([MeetingId])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_Meeting]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_Room]
GO
ALTER TABLE [dbo].[Shift]  WITH CHECK ADD  CONSTRAINT [FK_Shift_ShiftDay] FOREIGN KEY([ShiftDayID])
REFERENCES [dbo].[ShiftDay] ([ShiftDayID])
GO
ALTER TABLE [dbo].[Shift] CHECK CONSTRAINT [FK_Shift_ShiftDay]
GO
ALTER TABLE [dbo].[ShiftDay]  WITH CHECK ADD  CONSTRAINT [FK_ShiftDay_ShiftSchedule] FOREIGN KEY([ShiftScheduleId])
REFERENCES [dbo].[ShiftSchedule] ([ShiftScheduleId])
GO
ALTER TABLE [dbo].[ShiftDay] CHECK CONSTRAINT [FK_ShiftDay_ShiftSchedule]
GO
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_Department]
GO
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_User] FOREIGN KEY([Createby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_User]
GO
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_User1] FOREIGN KEY([Updateby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_User1]
GO
ALTER TABLE [dbo].[ShiftWorker]  WITH CHECK ADD  CONSTRAINT [FK_ShiftWorker_Shift] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shift] ([ShiftId])
GO
ALTER TABLE [dbo].[ShiftWorker] CHECK CONSTRAINT [FK_ShiftWorker_Shift]
GO
ALTER TABLE [dbo].[ShiftWorker]  WITH CHECK ADD  CONSTRAINT [FK_ShiftWorker_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ShiftWorker] CHECK CONSTRAINT [FK_ShiftWorker_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
USE [master]
GO
ALTER DATABASE [Hospital_Postal] SET  READ_WRITE 
GO
