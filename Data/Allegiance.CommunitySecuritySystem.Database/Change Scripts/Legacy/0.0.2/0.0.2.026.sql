USE CSSStats
GO

/*
   Friday, April 02, 20102:17:19 PM
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
ALTER TABLE dbo.GameServerIP
	DROP CONSTRAINT FK_GameServerIP_GameServer
GO
ALTER TABLE dbo.GameServer SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.GameServer', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.GameServer', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.GameServer', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_GameServerIP
	(
	GameServerIpID int NOT NULL IDENTITY (1, 1),
	GameServerID int NOT NULL,
	IPAddress varchar(20) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_GameServerIP SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_GameServerIP OFF
GO
IF EXISTS(SELECT * FROM dbo.GameServerIP)
	 EXEC('INSERT INTO dbo.Tmp_GameServerIP (GameServerID, IPAddress)
		SELECT GameServerID, IPAddress FROM dbo.GameServerIP WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.GameServerIP
GO
EXECUTE sp_rename N'dbo.Tmp_GameServerIP', N'GameServerIP', 'OBJECT' 
GO
ALTER TABLE dbo.GameServerIP ADD CONSTRAINT
	PK_GameServerIP PRIMARY KEY CLUSTERED 
	(
	GameServerIpID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.GameServerIP ADD CONSTRAINT
	FK_GameServerIP_GameServer FOREIGN KEY
	(
	GameServerID
	) REFERENCES dbo.GameServer
	(
	GameServerID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.GameServerIP', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.GameServerIP', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.GameServerIP', 'Object', 'CONTROL') as Contr_Per 