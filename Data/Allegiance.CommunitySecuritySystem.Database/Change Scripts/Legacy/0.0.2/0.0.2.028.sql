
USE CSSStats
GO


/****** Object:  Table [dbo].[StatsLeaderboard]    Script Date: 04/29/2010 00:48:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatsLeaderboard]') AND type in (N'U'))
DROP TABLE [dbo].[StatsLeaderboard]
GO
/****** Object:  Table [dbo].[StatsLeaderboard]    Script Date: 04/29/2010 00:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatsLeaderboard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StatsLeaderboard](
	[StatsLeaderboardId] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [int] NOT NULL,
	[Mu] [float] NOT NULL,
	[Sigma] [float] NOT NULL,
	[Rank] [float] NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Draws] [int] NOT NULL,
	[Defects] [int] NOT NULL,
	[StackRating] [float] NOT NULL,
	[CommandMu] [float] NOT NULL,
	[CommandSigma] [float] NOT NULL,
	[CommandRank] [float] NOT NULL,
	[CommandWins] [int] NOT NULL,
	[CommandLosses] [int] NOT NULL,
	[CommandDraws] [int] NOT NULL,
	[Kills] [int] NOT NULL,
	[Ejects] [int] NOT NULL,
	[DroneKills] [int] NOT NULL,
	[StationKills] [int] NOT NULL,
	[StationCaptures] [int] NOT NULL,
	[HoursPlayed] [float] NOT NULL,
	[DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_StatsLeaderboard] PRIMARY KEY CLUSTERED 
(
	[StatsLeaderboardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
--IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StatsLeaderboard_Login]') AND parent_object_id = OBJECT_ID(N'[dbo].[StatsLeaderboard]'))
--ALTER TABLE [dbo].[StatsLeaderboard]  WITH CHECK ADD  CONSTRAINT [FK_StatsLeaderboard_Login] FOREIGN KEY([LoginId])
--REFERENCES [dbo].[Login] ([Id])
--GO
--IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StatsLeaderboard_Login]') AND parent_object_id = OBJECT_ID(N'[dbo].[StatsLeaderboard]'))
--ALTER TABLE [dbo].[StatsLeaderboard] CHECK CONSTRAINT [FK_StatsLeaderboard_Login]
--GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StatsLeaderboard_LastUpdated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StatsLeaderboard] ADD  CONSTRAINT [DF_StatsLeaderboard_LastUpdated]  DEFAULT (getdate()) FOR [DateModified]
END

GO
