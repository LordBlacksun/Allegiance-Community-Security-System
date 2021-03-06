/*
   Tuesday, October 12, 201011:02:16 AM
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

delete MachineRecord
GO

delete ban
GO

delete pollvote
GO

ALTER TABLE dbo.LinkedItem
	DROP CONSTRAINT FK_LinkedItem_Link
GO
DROP TABLE dbo.Link
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LinkedItem
	DROP CONSTRAINT FK_LinkedItem_LinkedItemType
GO
DROP TABLE dbo.LinkedItemType
GO
COMMIT
BEGIN TRANSACTION
GO
DROP TABLE dbo.LinkedItem
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Ban
	DROP CONSTRAINT FK_Ban_Identity
GO
ALTER TABLE dbo.PollVote
	DROP CONSTRAINT FK_PollVote_Identity
GO
ALTER TABLE dbo.MachineRecord
	DROP CONSTRAINT FK_MachineRecord_Identity
GO
ALTER TABLE dbo.[Identity] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Login SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.Ban.IdentityId', N'Tmp_LoginId_3', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Ban.BannedById', N'Tmp_BannedByLoginId_4', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Ban.Tmp_LoginId_3', N'LoginId', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Ban.Tmp_BannedByLoginId_4', N'BannedByLoginId', 'COLUMN' 
GO
ALTER TABLE dbo.Ban ADD CONSTRAINT
	FK_Ban_Login1 FOREIGN KEY
	(
	LoginId
	) REFERENCES dbo.Login
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ban SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.MachineRecord
	DROP COLUMN IdentityId
GO
ALTER TABLE dbo.MachineRecord SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.PollVote.IdentityId', N'Tmp_LoginId_5', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.PollVote.Tmp_LoginId_5', N'LoginId', 'COLUMN' 
GO
ALTER TABLE dbo.PollVote ADD CONSTRAINT
	FK_PollVote_Login FOREIGN KEY
	(
	LoginId
	) REFERENCES dbo.Login
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.PollVote SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
