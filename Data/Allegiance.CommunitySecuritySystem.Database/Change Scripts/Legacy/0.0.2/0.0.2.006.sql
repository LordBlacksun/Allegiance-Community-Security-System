/*
   Tuesday, February 16, 20108:59:16 AM
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

ALTER TABLE dbo.BanClass SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.BanClass', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.BanClass', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.BanClass', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO

ALTER TABLE dbo.BanType ADD CONSTRAINT
	FK_BanType_BanClass FOREIGN KEY
	(
	BanClassId
	) REFERENCES dbo.BanClass
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.BanType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.BanType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.BanType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.BanType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.Ban.InfractionTypeId', N'Tmp_BanTypeId', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Ban.Tmp_BanTypeId', N'BanTypeId', 'COLUMN' 
GO
ALTER TABLE dbo.Ban ADD CONSTRAINT
	FK_Ban_BanType FOREIGN KEY
	(
	BanTypeId
	) REFERENCES dbo.BanType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Ban SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Ban', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Ban', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Ban', 'Object', 'CONTROL') as Contr_Per 