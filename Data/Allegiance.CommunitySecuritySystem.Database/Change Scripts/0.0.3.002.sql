USE CSS
GO


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
ALTER TABLE dbo.GameEvent
	DROP CONSTRAINT FK_GameEvent_Game1
GO
ALTER TABLE dbo.Game SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_GameEvent
	(
	GameID int NOT NULL,
	GameEventID int NOT NULL IDENTITY (1, 1),
	EventID int NOT NULL,
	GameEventTime datetime NOT NULL,
	GameEventPerformerID int NOT NULL,
	GameEventPerformerLoginID int NOT NULL,
	GameEventPerformerName varchar(255) NOT NULL,
	GameEventTargetID int NOT NULL,
	GameEventTargetLoginID int NOT NULL,
	GameEventTargetName varchar(255) NOT NULL,
	GameEventIndirectID int NOT NULL,
	GameEventIndirectName varchar(255) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_GameEvent SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_GameEvent ON
GO
IF EXISTS(SELECT * FROM dbo.GameEvent)
	 EXEC('INSERT INTO dbo.Tmp_GameEvent (GameID, GameEventID, EventID, GameEventTime, GameEventPerformerID, GameEventPerformerLoginID, GameEventPerformerName, GameEventTargetID, GameEventTargetLoginID, GameEventTargetName, GameEventIndirectID, GameEventIndirectName)
		SELECT GameID, GameEventID, EventID, GameEventTime, GameEventPerformerID, GameEventPerformerLoginID, GameEventPerformerName, GameEventTargetID, GameEventTargetLoginID, GameEventTargetName, GameEventIndirectID, GameEventIndirectName FROM dbo.GameEvent WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_GameEvent OFF
GO
DROP TABLE dbo.GameEvent
GO
EXECUTE sp_rename N'dbo.Tmp_GameEvent', N'GameEvent', 'OBJECT' 
GO
ALTER TABLE dbo.GameEvent ADD CONSTRAINT
	PK_GameEvent PRIMARY KEY CLUSTERED 
	(
	GameEventID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.GameEvent ADD CONSTRAINT
	FK_GameEvent_Game1 FOREIGN KEY
	(
	GameID
	) REFERENCES dbo.Game
	(
	GameIdentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
