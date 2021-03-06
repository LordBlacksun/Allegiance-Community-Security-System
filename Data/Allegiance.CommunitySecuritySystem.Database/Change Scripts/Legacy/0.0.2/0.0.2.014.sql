/*
   Friday, March 19, 20101:41:41 PM
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
ALTER TABLE dbo.Alias SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.GroupMessage
	DROP CONSTRAINT FK_GroupMessage_Login
GO
ALTER TABLE dbo.Login SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.GroupMessage.LoginId', N'Tmp_SenderAliasId', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.GroupMessage.Tmp_SenderAliasId', N'SenderAliasId', 'COLUMN' 
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
