USE CSSStats
GO


/*
   Tuesday, March 30, 20104:31:44 PM
   User: 
   Server: localhost
   Database: CSS
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Game
	(
	GameId int NOT NULL IDENTITY (1, 1),
	GameName varchar(255) NOT NULL,
	CoreFile varchar(50) NOT NULL,
	MapName varchar(50) NOT NULL,
	SquadGame bit NOT NULL,
	Conquest bit NOT NULL,
	DeathMatch bit NOT NULL,
	DeathmatchGoal int NOT NULL,
	FriendlyFire bit NOT NULL,
	RevealMap bit NOT NULL,
	AllowDevelopments bit NOT NULL,
	AllowShipyards bit NOT NULL,
	AllowDefections bit NOT NULL,
	InvulnerableStations bit NOT NULL,
	StatsCount bit NOT NULL,
	MaxImbalance int NOT NULL,
	StartingMoney float(53) NOT NULL,
	TotalMoney float(53) NOT NULL,
	Resources int NOT NULL,
	StartTime datetime NOT NULL,
	EndTime datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Game SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Game ON
GO
IF EXISTS(SELECT * FROM dbo.Game)
	 EXEC('INSERT INTO dbo.Tmp_Game (GameId, GameName, CoreFile, MapName, SquadGame, Conquest, DeathMatch, DeathmatchGoal, FriendlyFire, RevealMap, AllowDevelopments, AllowShipyards, AllowDefections, InvulnerableStations, StatsCount, MaxImbalance, StartingMoney, TotalMoney, Resources, StartTime, EndTime)
		SELECT GameId, GameName, CONVERT(varchar(50), CoreFile), MapName, SquadGame, Conquest, DeathMatch, DeathmatchGoal, FriendlyFire, RevealMap, AllowDevelopments, AllowShipyards, AllowDefections, InvulnerableStations, StatsCount, MaxImbalance, StartingMoney, TotalMoney, Resources, StartTime, EndTime FROM dbo.Game WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Game OFF
GO
ALTER TABLE dbo.GameEvent
	DROP CONSTRAINT FK_GameEvent_Game
GO
ALTER TABLE dbo.ChatLog
	DROP CONSTRAINT FK_ChatLog_Game
GO
ALTER TABLE dbo.Team
	DROP CONSTRAINT FK_Team_Game
GO
DROP TABLE dbo.Game
GO
EXECUTE sp_rename N'dbo.Tmp_Game', N'Game', 'OBJECT' 
GO
ALTER TABLE dbo.Game ADD CONSTRAINT
	PK_Game PRIMARY KEY CLUSTERED 
	(
	GameId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Team ADD CONSTRAINT
	FK_Team_Game FOREIGN KEY
	(
	GameId
	) REFERENCES dbo.Game
	(
	GameId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Team SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ChatLog ADD CONSTRAINT
	FK_ChatLog_Game FOREIGN KEY
	(
	GameId
	) REFERENCES dbo.Game
	(
	GameId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChatLog SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.GameEvent ADD CONSTRAINT
	FK_GameEvent_Game FOREIGN KEY
	(
	GameId
	) REFERENCES dbo.Game
	(
	GameId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.GameEvent SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
