USE CSSStats
GO

/*
   Friday, April 02, 20109:44:29 AM
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
ALTER TABLE dbo.TeamMember
	DROP CONSTRAINT FK_TeamMember_Team
GO
ALTER TABLE dbo.Team SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_TeamMember
	(
	GameTeamID int NOT NULL,
	GameTeamMemeberCallsign varchar(50) NOT NULL,
	GameTeamMemeberDuration int NOT NULL,
	GameTeamMemeberID int NOT NULL IDENTITY (1, 1)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_TeamMember SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_TeamMember OFF
GO
IF EXISTS(SELECT * FROM dbo.TeamMember)
	 EXEC('INSERT INTO dbo.Tmp_TeamMember (GameTeamID, GameTeamMemeberCallsign, GameTeamMemeberDuration)
		SELECT TeamId, Callsign, Duration FROM dbo.TeamMember WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.TeamMember
GO
EXECUTE sp_rename N'dbo.Tmp_TeamMember', N'TeamMember', 'OBJECT' 
GO
ALTER TABLE dbo.TeamMember ADD CONSTRAINT
	PK_TeamMember PRIMARY KEY CLUSTERED 
	(
	GameTeamMemeberID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TeamMember ADD CONSTRAINT
	FK_TeamMember_Team FOREIGN KEY
	(
	GameTeamID
	) REFERENCES dbo.Team
	(
	TeamId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
