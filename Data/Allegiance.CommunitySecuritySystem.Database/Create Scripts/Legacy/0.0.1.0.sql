/****** Object:  User [css_server]    Script Date: 08/16/2009 18:09:25 ******/
CREATE USER [css_server] FOR LOGIN [css_server] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[TransformMethod]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransformMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [ntext] NOT NULL,
 CONSTRAINT [PK_TransformMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionStatus]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_SessionStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Identity]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Identity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateLastLogin] [datetime] NOT NULL,
 CONSTRAINT [PK_Identity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRole]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Token] [nchar](1) NULL,
 CONSTRAINT [PK_GroupRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRequestType]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRequestType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_GroupRequestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Tag] [nvarchar](5) NOT NULL,
	[IsSquad] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poll]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateExpires] [datetime] NOT NULL,
 CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineRecordType]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineRecordType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MachineRecordType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PollOption]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollId] [int] NOT NULL,
	[Option] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_PollOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMessage]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[GroupId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateToSend] [datetime] NOT NULL,
	[DateExpires] [datetime] NULL,
 CONSTRAINT [PK_GroupMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineRecord]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MachineRecord](
	[IdentityId] [int] NOT NULL,
	[RecordTypeId] [int] NOT NULL,
	[Identifier] [binary](255) NOT NULL,
 CONSTRAINT [PK_MachineRecord] PRIMARY KEY CLUSTERED 
(
	[IdentityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[IdentityId] [int] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActiveKey]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveKey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](95) NOT NULL,
	[Filename] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[RSACspBlob] [image] NOT NULL,
	[TransformMethodId] [int] NOT NULL,
 CONSTRAINT [PK_ActiveKey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsedKey]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsedKey](
	[LoginId] [int] NOT NULL,
	[ActiveKeyId] [int] NOT NULL,
	[DateUsed] [datetime] NOT NULL,
 CONSTRAINT [PK_UsedKey] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC,
	[ActiveKeyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PollVote]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollVote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollOptionId] [int] NOT NULL,
	[IdentityId] [int] NOT NULL,
 CONSTRAINT [PK_PollVote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [uniqueidentifier] NOT NULL,
	[LoginId] [int] NOT NULL,
	[ActiveKeyId] [int] NOT NULL,
	[SessionStatusId] [int] NOT NULL,
	[DateLastCheckIn] [datetime] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alias]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [int] NOT NULL,
	[Callsign] [nvarchar](20) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Alias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityId] [int] NOT NULL,
	[BannedById] [int] NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateExpires] [datetime] NULL,
	[InEffect] [bit] NOT NULL,
 CONSTRAINT [PK_Ban] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_Role]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Role](
	[LoginId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Login_Role] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Alias_GroupRole]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Alias_GroupRole](
	[GroupId] [int] NOT NULL,
	[AliasId] [int] NOT NULL,
	[GroupRoleId] [int] NOT NULL,
 CONSTRAINT [PK_Group_Alias_GroupRole] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[AliasId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[AvailableKey]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE FUNCTION [dbo].[AvailableKey]
(	
	@LoginId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT K.Id, K.Token, K.[Filename], K.DateCreated, K.TransformMethodId
	FROM ActiveKey K
		LEFT OUTER JOIN UsedKey UK ON K.Id = UK.ActiveKeyId AND UK.LoginId = @LoginId
	GROUP BY K.Id, K.Token, K.[Filename], K.DateCreated, K.TransformMethodId
	HAVING COUNT(UK.ActiveKeyId) = 0
)
GO
/****** Object:  Table [dbo].[GroupRequest]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestTypeId] [int] NOT NULL,
	[AliasId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMessage_Alias]    Script Date: 08/16/2009 18:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMessage_Alias](
	[GroupMessageId] [int] NOT NULL,
	[AliasId] [int] NOT NULL,
	[DateViewed] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupMessage_Alias] PRIMARY KEY CLUSTERED 
(
	[GroupMessageId] ASC,
	[AliasId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Identity_DateLastLogin]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Identity] ADD  CONSTRAINT [DF_Identity_DateLastLogin]  DEFAULT (getdate()) FOR [DateLastLogin]
GO
/****** Object:  Default [DF_Group_IsSquad]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsSquad]  DEFAULT ((0)) FOR [IsSquad]
GO
/****** Object:  Default [DF_Group_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Poll_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Poll] ADD  CONSTRAINT [DF_Poll_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_GroupMessage_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupMessage] ADD  CONSTRAINT [DF_GroupMessage_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_GroupMessage_DateToSend]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupMessage] ADD  CONSTRAINT [DF_GroupMessage_DateToSend]  DEFAULT (getdate()) FOR [DateToSend]
GO
/****** Object:  Default [DF_Login_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_ActiveKey_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[ActiveKey] ADD  CONSTRAINT [DF_ActiveKey_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_UsedKey_DateUsed]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[UsedKey] ADD  CONSTRAINT [DF_UsedKey_DateUsed]  DEFAULT (getdate()) FOR [DateUsed]
GO
/****** Object:  Default [DF_Session_Id]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_Session_DateLastCheckIn]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_DateLastCheckIn]  DEFAULT (getdate()) FOR [DateLastCheckIn]
GO
/****** Object:  Default [DF_Alias_IsDefault]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Alias] ADD  CONSTRAINT [DF_Alias_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Alias_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Alias] ADD  CONSTRAINT [DF_Alias_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Ban_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Ban] ADD  CONSTRAINT [DF_Ban_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Ban_InEffect]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Ban] ADD  CONSTRAINT [DF_Ban_InEffect]  DEFAULT ((1)) FOR [InEffect]
GO
/****** Object:  Default [DF_GroupRequest_DateCreated]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupRequest] ADD  CONSTRAINT [DF_GroupRequest_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_GroupMessage_Alias_DateViewed]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupMessage_Alias] ADD  CONSTRAINT [DF_GroupMessage_Alias_DateViewed]  DEFAULT (getdate()) FOR [DateViewed]
GO
/****** Object:  ForeignKey [FK_PollOption_Poll]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[PollOption]  WITH CHECK ADD  CONSTRAINT [FK_PollOption_Poll] FOREIGN KEY([PollId])
REFERENCES [dbo].[Poll] ([Id])
GO
ALTER TABLE [dbo].[PollOption] CHECK CONSTRAINT [FK_PollOption_Poll]
GO
/****** Object:  ForeignKey [FK_GroupMessage_Group]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupMessage]  WITH CHECK ADD  CONSTRAINT [FK_GroupMessage_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[GroupMessage] CHECK CONSTRAINT [FK_GroupMessage_Group]
GO
/****** Object:  ForeignKey [FK_MachineRecord_Identity]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[MachineRecord]  WITH CHECK ADD  CONSTRAINT [FK_MachineRecord_Identity] FOREIGN KEY([IdentityId])
REFERENCES [dbo].[Identity] ([Id])
GO
ALTER TABLE [dbo].[MachineRecord] CHECK CONSTRAINT [FK_MachineRecord_Identity]
GO
/****** Object:  ForeignKey [FK_MachineRecord_MachineRecordType]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[MachineRecord]  WITH CHECK ADD  CONSTRAINT [FK_MachineRecord_MachineRecordType] FOREIGN KEY([RecordTypeId])
REFERENCES [dbo].[MachineRecordType] ([Id])
GO
ALTER TABLE [dbo].[MachineRecord] CHECK CONSTRAINT [FK_MachineRecord_MachineRecordType]
GO
/****** Object:  ForeignKey [FK_Login_Identity]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Identity] FOREIGN KEY([IdentityId])
REFERENCES [dbo].[Identity] ([Id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Identity]
GO
/****** Object:  ForeignKey [FK_ActiveKey_TransformMethod]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[ActiveKey]  WITH CHECK ADD  CONSTRAINT [FK_ActiveKey_TransformMethod] FOREIGN KEY([TransformMethodId])
REFERENCES [dbo].[TransformMethod] ([Id])
GO
ALTER TABLE [dbo].[ActiveKey] CHECK CONSTRAINT [FK_ActiveKey_TransformMethod]
GO
/****** Object:  ForeignKey [FK_UsedKey_ActiveKey]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[UsedKey]  WITH CHECK ADD  CONSTRAINT [FK_UsedKey_ActiveKey] FOREIGN KEY([ActiveKeyId])
REFERENCES [dbo].[ActiveKey] ([Id])
GO
ALTER TABLE [dbo].[UsedKey] CHECK CONSTRAINT [FK_UsedKey_ActiveKey]
GO
/****** Object:  ForeignKey [FK_UsedKey_Login]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[UsedKey]  WITH CHECK ADD  CONSTRAINT [FK_UsedKey_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([Id])
GO
ALTER TABLE [dbo].[UsedKey] CHECK CONSTRAINT [FK_UsedKey_Login]
GO
/****** Object:  ForeignKey [FK_PollVote_Identity]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_PollVote_Identity] FOREIGN KEY([IdentityId])
REFERENCES [dbo].[Identity] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_PollVote_Identity]
GO
/****** Object:  ForeignKey [FK_PollVote_PollOption]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[PollVote]  WITH CHECK ADD  CONSTRAINT [FK_PollVote_PollOption] FOREIGN KEY([PollOptionId])
REFERENCES [dbo].[PollOption] ([Id])
GO
ALTER TABLE [dbo].[PollVote] CHECK CONSTRAINT [FK_PollVote_PollOption]
GO
/****** Object:  ForeignKey [FK_Session_ActiveKey]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_ActiveKey] FOREIGN KEY([ActiveKeyId])
REFERENCES [dbo].[ActiveKey] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_ActiveKey]
GO
/****** Object:  ForeignKey [FK_Session_Login]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Login]
GO
/****** Object:  ForeignKey [FK_Session_SessionStatus]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_SessionStatus] FOREIGN KEY([SessionStatusId])
REFERENCES [dbo].[SessionStatus] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_SessionStatus]
GO
/****** Object:  ForeignKey [FK_Alias_Login]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Alias]  WITH CHECK ADD  CONSTRAINT [FK_Alias_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([Id])
GO
ALTER TABLE [dbo].[Alias] CHECK CONSTRAINT [FK_Alias_Login]
GO
/****** Object:  ForeignKey [FK_Ban_Identity]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Ban]  WITH CHECK ADD  CONSTRAINT [FK_Ban_Identity] FOREIGN KEY([IdentityId])
REFERENCES [dbo].[Identity] ([Id])
GO
ALTER TABLE [dbo].[Ban] CHECK CONSTRAINT [FK_Ban_Identity]
GO
/****** Object:  ForeignKey [FK_Ban_Login]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Ban]  WITH CHECK ADD  CONSTRAINT [FK_Ban_Login] FOREIGN KEY([BannedById])
REFERENCES [dbo].[Login] ([Id])
GO
ALTER TABLE [dbo].[Ban] CHECK CONSTRAINT [FK_Ban_Login]
GO
/****** Object:  ForeignKey [FK_Login_Role_Login]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Login_Role]  WITH CHECK ADD  CONSTRAINT [FK_Login_Role_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([Id])
GO
ALTER TABLE [dbo].[Login_Role] CHECK CONSTRAINT [FK_Login_Role_Login]
GO
/****** Object:  ForeignKey [FK_Login_Role_Role]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Login_Role]  WITH CHECK ADD  CONSTRAINT [FK_Login_Role_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Login_Role] CHECK CONSTRAINT [FK_Login_Role_Role]
GO
/****** Object:  ForeignKey [FK_Group_Alias_GroupRole_Alias]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Group_Alias_GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_Group_Alias_GroupRole_Alias] FOREIGN KEY([AliasId])
REFERENCES [dbo].[Alias] ([Id])
GO
ALTER TABLE [dbo].[Group_Alias_GroupRole] CHECK CONSTRAINT [FK_Group_Alias_GroupRole_Alias]
GO
/****** Object:  ForeignKey [FK_Group_Alias_GroupRole_Group]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Group_Alias_GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_Group_Alias_GroupRole_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[Group_Alias_GroupRole] CHECK CONSTRAINT [FK_Group_Alias_GroupRole_Group]
GO
/****** Object:  ForeignKey [FK_Group_Alias_GroupRole_GroupRole]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[Group_Alias_GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_Group_Alias_GroupRole_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[Group_Alias_GroupRole] CHECK CONSTRAINT [FK_Group_Alias_GroupRole_GroupRole]
GO
/****** Object:  ForeignKey [FK_GroupRequest_Alias]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupRequest]  WITH CHECK ADD  CONSTRAINT [FK_GroupRequest_Alias] FOREIGN KEY([AliasId])
REFERENCES [dbo].[Alias] ([Id])
GO
ALTER TABLE [dbo].[GroupRequest] CHECK CONSTRAINT [FK_GroupRequest_Alias]
GO
/****** Object:  ForeignKey [FK_GroupRequest_GroupRequestType]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupRequest]  WITH CHECK ADD  CONSTRAINT [FK_GroupRequest_GroupRequestType] FOREIGN KEY([RequestTypeId])
REFERENCES [dbo].[GroupRequestType] ([Id])
GO
ALTER TABLE [dbo].[GroupRequest] CHECK CONSTRAINT [FK_GroupRequest_GroupRequestType]
GO
/****** Object:  ForeignKey [FK_GroupMessage_Alias_Alias]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupMessage_Alias]  WITH CHECK ADD  CONSTRAINT [FK_GroupMessage_Alias_Alias] FOREIGN KEY([AliasId])
REFERENCES [dbo].[Alias] ([Id])
GO
ALTER TABLE [dbo].[GroupMessage_Alias] CHECK CONSTRAINT [FK_GroupMessage_Alias_Alias]
GO
/****** Object:  ForeignKey [FK_GroupMessage_Alias_GroupMessage]    Script Date: 08/16/2009 18:09:26 ******/
ALTER TABLE [dbo].[GroupMessage_Alias]  WITH CHECK ADD  CONSTRAINT [FK_GroupMessage_Alias_GroupMessage] FOREIGN KEY([GroupMessageId])
REFERENCES [dbo].[GroupMessage] ([Id])
GO
ALTER TABLE [dbo].[GroupMessage_Alias] CHECK CONSTRAINT [FK_GroupMessage_Alias_GroupMessage]
GO
/****** Object:  Table [dbo].[PersonalMessage]    Script Date: 08/22/2009 15:51:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalMessage]') AND type in (N'U'))
DROP TABLE [dbo].[PersonalMessage]
GO
/****** Object:  Table [dbo].[PersonalMessage]    Script Date: 08/22/2009 15:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalMessage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonalMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateToSend] [datetime] NOT NULL,
	[DateExpires] [datetime] NULL,
	[LoginId] [int] NOT NULL,
 CONSTRAINT [PK_PersonalMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonalMessage_Login]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonalMessage]'))
ALTER TABLE [dbo].[PersonalMessage]  WITH CHECK ADD  CONSTRAINT [FK_PersonalMessage_Login] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PersonalMessage_Login]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonalMessage]'))
ALTER TABLE [dbo].[PersonalMessage] CHECK CONSTRAINT [FK_PersonalMessage_Login]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PersonalMessage_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonalMessage] ADD  CONSTRAINT [DF_PersonalMessage_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PersonalMessage_DateToSend]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonalMessage] ADD  CONSTRAINT [DF_PersonalMessage_DateToSend]  DEFAULT (getdate()) FOR [DateToSend]
END

GO
