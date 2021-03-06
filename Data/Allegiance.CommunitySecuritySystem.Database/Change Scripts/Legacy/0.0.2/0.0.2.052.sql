/*
   Thursday, December 02, 20103:40:25 PM
   User: css_server
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
ALTER TABLE dbo.Group_Alias_GroupRole
	DROP CONSTRAINT FK_Group_Alias_GroupRole_Alias
GO
ALTER TABLE dbo.GroupMessage_Alias
	DROP CONSTRAINT FK_GroupMessage_Alias_Alias
GO
ALTER TABLE dbo.GroupRequest
	DROP CONSTRAINT FK_GroupRequest_Alias
GO
ALTER TABLE dbo.PersonalMessage
	DROP CONSTRAINT FK_PersonalMessage_Alias
GO
ALTER TABLE dbo.Session
	DROP CONSTRAINT FK_Session_Alias
GO
ALTER TABLE dbo.GroupMessage
	DROP CONSTRAINT FK_GroupMessage_Alias
GO
ALTER TABLE dbo.Alias ADD CONSTRAINT
	IX_Alias UNIQUE NONCLUSTERED 
	(
	Callsign
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Alias SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Group_Alias_GroupRole ADD CONSTRAINT
	FK_Group_Alias_GroupRole_Alias FOREIGN KEY
	(
	AliasId
	) REFERENCES dbo.Alias
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Group_Alias_GroupRole SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.GroupMessage ADD CONSTRAINT
	FK_GroupMessage_Alias FOREIGN KEY
	(
	SenderAliasId
	) REFERENCES dbo.Alias
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.GroupMessage SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.GroupMessage_Alias ADD CONSTRAINT
	FK_GroupMessage_Alias_Alias FOREIGN KEY
	(
	AliasId
	) REFERENCES dbo.Alias
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.GroupMessage_Alias SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.GroupRequest ADD CONSTRAINT
	FK_GroupRequest_Alias FOREIGN KEY
	(
	AliasId
	) REFERENCES dbo.Alias
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.GroupRequest SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.PersonalMessage ADD CONSTRAINT
	FK_PersonalMessage_Alias FOREIGN KEY
	(
	SenderAliasId
	) REFERENCES dbo.Alias
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.PersonalMessage SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Session ADD CONSTRAINT
	FK_Session_Alias FOREIGN KEY
	(
	AliasId
	) REFERENCES dbo.Alias
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Session SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
