/*
   Wednesday, May 26, 20102:03:36 PM
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
ALTER TABLE dbo.Link
	DROP CONSTRAINT FK_Link_Identity
GO
ALTER TABLE dbo.Link
	DROP CONSTRAINT FK_Link_Identity2
GO
ALTER TABLE dbo.[Identity] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Link
	DROP CONSTRAINT DF_Link_DateCreated
GO
CREATE TABLE dbo.Tmp_Link
	(
	Id int NOT NULL IDENTITY (1, 1),
	IdentityId1 int NOT NULL,
	IdentityId2 int NOT NULL,
	DateCreated datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Link SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Link ADD CONSTRAINT
	DF_Link_DateCreated DEFAULT (getdate()) FOR DateCreated
GO
SET IDENTITY_INSERT dbo.Tmp_Link ON
GO
IF EXISTS(SELECT * FROM dbo.Link)
	 EXEC('INSERT INTO dbo.Tmp_Link (Id, IdentityId1, IdentityId2, DateCreated)
		SELECT Id, IdentityId1, IdentityId2, DateCreated FROM dbo.Link WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Link OFF
GO
ALTER TABLE dbo.LinkedItem
	DROP CONSTRAINT FK_LinkedItem_Link
GO
DROP TABLE dbo.Link
GO
EXECUTE sp_rename N'dbo.Tmp_Link', N'Link', 'OBJECT' 
GO
ALTER TABLE dbo.Link ADD CONSTRAINT
	PK_Link PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Link ADD CONSTRAINT
	FK_Link_Identity FOREIGN KEY
	(
	IdentityId1
	) REFERENCES dbo.[Identity]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Link ADD CONSTRAINT
	FK_Link_Identity2 FOREIGN KEY
	(
	IdentityId2
	) REFERENCES dbo.[Identity]
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LinkedItem ADD CONSTRAINT
	FK_LinkedItem_Link FOREIGN KEY
	(
	LinkId
	) REFERENCES dbo.Link
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LinkedItem SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
