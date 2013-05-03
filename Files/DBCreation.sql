USE [CourseMates]
GO
/****** Object:  User [sys_cm1]    Script Date: 05/03/2013 10:53:09 ******/
CREATE USER [sys_cm1] FOR LOGIN [sys_cm1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sys_cm]    Script Date: 05/03/2013 10:53:09 ******/
CREATE USER [sys_cm] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [eliranye]    Script Date: 05/03/2013 10:53:09 ******/
CREATE USER [eliranye] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[Email] [varchar](150) NULL,
	[Password] [varchar](150) NULL,
	[GCMId] [varchar](100) NULL,
	[UserName] [varchar](45) NULL,
	[IsVerify] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFileType]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFileType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NULL,
	[ImageUrl] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFile]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CourseId] [int] NULL,
	[PhysicalPath] [varchar](1000) NULL,
	[LogicalPath] [varchar](5000) NULL,
	[FileName] [varchar](100) NULL,
	[FileTypeId] [int] NULL,
	[Rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [fk_fileCourse_idx] ON [dbo].[tblFile] 
(
	[CourseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_fileType_idx] ON [dbo].[tblFile] 
(
	[FileTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_user_idx] ON [dbo].[tblFile] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAction]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Action] [int] NULL,
	[IsUsed] [bit] NULL,
 CONSTRAINT [PK_tblAction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSessions]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSessions](
	[UserID] [int] NULL,
	[SessionID] [varchar](100) NULL,
	[ExperationDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblParticipants]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParticipants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[UserId] [int] NULL,
	[IsAdmin] [bit] NULL,
	[IsVerifyed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_paCourse_idx] ON [dbo].[tblParticipants] 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_paUser_idx] ON [dbo].[tblParticipants] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblForum]    Script Date: 05/03/2013 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblForum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[Title] [varchar](45) NULL,
	[Content] [varchar](500) NULL,
	[RootId] [int] NULL,
	[UserId] [int] NULL,
	[Rate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [fk_forumCourse_idx] ON [dbo].[tblForum] 
(
	[CourseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_forunUser_idx] ON [dbo].[tblForum] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [fk_root_idx] ON [dbo].[tblForum] 
(
	[RootId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF__tblPartic__IsAdm__1367E606]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblParticipants] ADD  DEFAULT ((0)) FOR [IsAdmin]
GO
/****** Object:  Default [DF__tblPartic__IsVer__145C0A3F]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblParticipants] ADD  DEFAULT ((0)) FOR [IsVerifyed]
GO
/****** Object:  Default [DF__tblForum__RootId__1B0907CE]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblForum] ADD  DEFAULT ((-1)) FOR [RootId]
GO
/****** Object:  ForeignKey [fk_fileCourse]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblFile]  WITH CHECK ADD  CONSTRAINT [fk_fileCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourse] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFile] CHECK CONSTRAINT [fk_fileCourse]
GO
/****** Object:  ForeignKey [fk_fileType]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblFile]  WITH CHECK ADD  CONSTRAINT [fk_fileType] FOREIGN KEY([FileTypeId])
REFERENCES [dbo].[tblFileType] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblFile] CHECK CONSTRAINT [fk_fileType]
GO
/****** Object:  ForeignKey [fk_fileUser]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblFile]  WITH CHECK ADD  CONSTRAINT [fk_fileUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblFile] CHECK CONSTRAINT [fk_fileUser]
GO
/****** Object:  ForeignKey [FK_tblAction_tblUser]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblAction]  WITH CHECK ADD  CONSTRAINT [FK_tblAction_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblAction] CHECK CONSTRAINT [FK_tblAction_tblUser]
GO
/****** Object:  ForeignKey [FK_tblSessions_tblUser]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblSessions]  WITH CHECK ADD  CONSTRAINT [FK_tblSessions_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSessions] CHECK CONSTRAINT [FK_tblSessions_tblUser]
GO
/****** Object:  ForeignKey [fk_paCourse]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblParticipants]  WITH CHECK ADD  CONSTRAINT [fk_paCourse] FOREIGN KEY([CourseID])
REFERENCES [dbo].[tblCourse] ([Id])
GO
ALTER TABLE [dbo].[tblParticipants] CHECK CONSTRAINT [fk_paCourse]
GO
/****** Object:  ForeignKey [fk_paUser]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblParticipants]  WITH CHECK ADD  CONSTRAINT [fk_paUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblParticipants] CHECK CONSTRAINT [fk_paUser]
GO
/****** Object:  ForeignKey [fk_forumCourse]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblForum]  WITH CHECK ADD  CONSTRAINT [fk_forumCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourse] ([Id])
GO
ALTER TABLE [dbo].[tblForum] CHECK CONSTRAINT [fk_forumCourse]
GO
/****** Object:  ForeignKey [fk_forunUser]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblForum]  WITH CHECK ADD  CONSTRAINT [fk_forunUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([Id])
GO
ALTER TABLE [dbo].[tblForum] CHECK CONSTRAINT [fk_forunUser]
GO
/****** Object:  ForeignKey [fk_root]    Script Date: 05/03/2013 10:53:13 ******/
ALTER TABLE [dbo].[tblForum]  WITH CHECK ADD  CONSTRAINT [fk_root] FOREIGN KEY([RootId])
REFERENCES [dbo].[tblForum] ([Id])
GO
ALTER TABLE [dbo].[tblForum] CHECK CONSTRAINT [fk_root]
GO
